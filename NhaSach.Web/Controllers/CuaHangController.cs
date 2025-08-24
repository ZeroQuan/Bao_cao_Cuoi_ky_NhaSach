using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;

public class CuaHangController : Controller
{
    private readonly NhaSachDbContext _db;
    public CuaHangController(NhaSachDbContext db) { _db = db; }

    // /CuaHang?q=&cat=&pmin=&pmax=&sort=
    public async Task<IActionResult> Index(
        string? q, int? cat, decimal? pmin, decimal? pmax, string? sort, bool? onlyPromo)
    {
        // dropdown thể loại
        ViewBag.Danhmucs = new SelectList(
            await _db.Danhmucs.AsNoTracking().OrderBy(x => x.Ten_Danhmuc).ToListAsync(),
            "Danhmuc_Id", "Ten_Danhmuc", cat);

        // giữ lại giá trị lọc cho view
        ViewBag.Q = q;
        ViewBag.Cat = cat;
        ViewBag.Pmin = pmin;
        ViewBag.Pmax = pmax;
        ViewBag.Sort = sort ??  "";
        ViewBag.OnlyPromo = onlyPromo ?? false;

        var qry = _db.Sanphams.AsNoTracking().AsQueryable();

        if (!string.IsNullOrWhiteSpace(q))
        {
            var kw = q.Trim();
            qry = qry.Where(x =>
                x.Ten_Sanpham.Contains(kw) ||
                (x.TacGia ?? "").Contains(kw) ||
                (x.NhaXuatBan ?? "").Contains(kw) ||
                (x.ISBN ?? "").Contains(kw));
        }

        if (cat.HasValue)  qry = qry.Where(x => x.Danhmuc_Id == cat.Value);
        if (pmin.HasValue) qry = qry.Where(x => x.Gia_Ban >= pmin.Value);
        if (pmax.HasValue) qry = qry.Where(x => x.Gia_Ban <= pmax.Value);

        // Chỉ khuyến mãi
        if (onlyPromo == true)
            qry = qry.Where(x => x.GiaKhuyenMai != null && x.GiaKhuyenMai < x.Gia_Ban);

        // Sắp xếp
        qry = (sort ?? "") switch
        {
            "price_asc"  => qry.OrderBy(x => x.Gia_Ban),
            "price_desc" => qry.OrderByDescending(x => x.Gia_Ban),

            // BÁN CHẠY: order by tổng SoLuong trong Donhang_Chitiet (left join)
            "bestseller" => qry
                .Select(sp => new
                {
                    sp,
                    TotalSold = _db.Donhang_Chitiets
                        .Where(c => c.Sanpham_Id == sp.Sanpham_Id)
                        .Sum(c => (int?)c.SoLuong) ?? 0
                })
                .OrderByDescending(x => x.TotalSold)
                .Select(x => x.sp),

            // Mặc định: mới nhất
            _ => qry.OrderByDescending(x => x.Sanpham_Id)
        };

        var list = await qry.ToListAsync();
        return View(list);
    }
}
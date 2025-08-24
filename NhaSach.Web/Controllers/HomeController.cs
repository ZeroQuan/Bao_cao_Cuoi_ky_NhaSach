using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.ViewModels;

namespace NhaSach.Web.Controllers;

public class HomeController : Controller
{
    private readonly NhaSachDbContext _db;
    public HomeController(NhaSachDbContext db) { _db = db; }

    public async Task<IActionResult> Index()
    {
        // Tính "Nổi bật" theo top bán chạy (fallback: mới nhất nếu chưa có đơn hàng)
        var topIds = await _db.Donhang_Chitiets
        .Join(_db.Sanphams, ct => ct.Sanpham_Id, sp => sp.Sanpham_Id,
              (ct, sp) => new { ct.Sanpham_Id, ct.SoLuong })
        .GroupBy(x => x.Sanpham_Id)
        .Select(g => new { Sanpham_Id = g.Key, Total = g.Sum(x => x.SoLuong) })
        .OrderByDescending(x => x.Total)
        .ThenByDescending(x => x.Sanpham_Id)
        .Take(3)
        .Select(x => x.Sanpham_Id)
        .ToListAsync();

        // Nếu chưa có chi tiết đơn hàng => fallback theo mới nhất
        List<NhaSach.Web.Models.Sanpham> noiBat;
        if (topIds.Count > 0)
        {
            var items = await _db.Sanphams.AsNoTracking()
                .Where(sp => topIds.Contains(sp.Sanpham_Id))
                .ToListAsync();
            var orderIndex = topIds.Select((id, i) => new { id, i })
                                   .ToDictionary(x => x.id, x => x.i);
            noiBat = items.OrderBy(sp => orderIndex[sp.Sanpham_Id]).ToList();
        }
        else
        {
            noiBat = await _db.Sanphams.AsNoTracking()
                .OrderByDescending(x => x.Sanpham_Id).Take(4).ToListAsync();
        }
    
        // Lấy các sản phẩm mới, khuyến mãi, bài viết và sự kiện
        var vm = new HomeIndexVm
        {
            SanPhamMoi = await _db.Sanphams
                    .AsNoTracking()
                    .OrderByDescending(x => x.Sanpham_Id)  // hoặc .OrderByDescending(x => x.Ngay_Tao)
                    .Take(4)
                    .ToListAsync(),
            SanPhamKhuyenMai = await _db.Sanphams.AsNoTracking()
                    .Where(x => x.GiaKhuyenMai != null && x.GiaKhuyenMai < x.Gia_Ban)
                    .OrderByDescending(x => x.Sanpham_Id)
                    .Take(4)
                    .ToListAsync(),

            SanPhamNoiBat = noiBat,

            BaiVietMoi = await _db.Baiviets
                    .AsNoTracking()
                    .OrderByDescending(x => x.Baiviet_Id)
                    .Take(3)
                    .ToListAsync(),
            

            SuKien = await _db.Sukiens
                    .AsNoTracking()
                    .OrderBy(x => x.BatDau_Sukien)
                    .Take(5)
                    .ToListAsync()
        };
        return View(vm);
    }
    public IActionResult Loixayra() => View();
}

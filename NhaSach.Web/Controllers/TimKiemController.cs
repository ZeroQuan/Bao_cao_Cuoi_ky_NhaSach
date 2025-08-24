using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;

namespace NhaSach.Web.Controllers
{
    public class TimKiemController : Controller
    {
        private readonly NhaSachDbContext _db;
        public TimKiemController(NhaSachDbContext db) => _db = db;

        // GET: /TimKiem/Index?q=...
        public async Task<IActionResult> Index(string? q)
        {
            q = (q ?? "").Trim();
            var sp = await _db.Sanphams
                .AsNoTracking()
                .Where(x => q == "" ||
                            EF.Functions.Like(x.Ten_Sanpham, $"%{q}%") ||
                            EF.Functions.Like(x.TacGia!, $"%{q}%"))
                .OrderBy(x => x.Ten_Sanpham)
                .Take(100)
                .ToListAsync();

            var bv = await _db.Baiviets
                .AsNoTracking()
                .Where(x => q == "" ||
                            EF.Functions.Like(x.Tieude_Baiviet, $"%{q}%") ||
                            EF.Functions.Like(x.Tomtat_Baiviet!, $"%{q}%"))
                .OrderByDescending(x => x.Baiviet_Id)
                .Take(50)
                .ToListAsync();

            var sk = await _db.Sukiens.AsNoTracking()
            .Where(x => q == "" ||
                        EF.Functions.Like(x.Tieude_Sukien, $"%{q}%") ||
                        EF.Functions.Like(x.Diadiem_Sukien!, $"%{q}%") ||
                        EF.Functions.Like(x.Mota_Sukien!, $"%{q}%"))
            .OrderBy(x => x.BatDau_Sukien)
            .Take(50)
            .ToListAsync();


            ViewBag.Q = q;
            ViewBag.BaiViet = bv;
            ViewBag.SuKien = sk;
            return View(sp); // model = List<Sanpham>
        }
    }
}
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;

namespace NhaSach.Web.Controllers
{
    public class SukienController : Controller
    {
        private readonly NhaSachDbContext _db;
        public SukienController(NhaSachDbContext db) { _db = db; }

        // /Sukien?sapToi=true&page=1&pageSize=10
        public async Task<IActionResult> Index(bool? sapToi, int page = 1, int pageSize = 10)
        {
            var query = _db.Sukiens.AsNoTracking().AsQueryable();
            if (sapToi == true) query = query.Where(x => x.BatDau_Sukien >= DateTime.UtcNow);

            var total = await query.CountAsync();
            var items = await query.OrderBy(x => x.BatDau_Sukien)
                                   .Skip((page - 1) * pageSize)
                                   .Take(pageSize)
                                   .ToListAsync();

            ViewBag.SapToi = sapToi;
            ViewBag.Page = page; ViewBag.PageSize = pageSize; ViewBag.Total = total;
            return View(items); // Views/Sukien/Index.cshtml -> @model List<Sukien>
        }

        // /Sukien/ChiTiet/5
        public async Task<IActionResult> ChiTiet(int id)
        {
            var sk = await _db.Sukiens.AsNoTracking().FirstOrDefaultAsync(x => x.Sukien_Id == id);
            if (sk == null) return NotFound();
            return View(sk); // Views/Sukien/ChiTiet.cshtml -> @model Sukien
        }
    }
}
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.Models;

namespace NhaSach.Web.Controllers
{
    public class BlogController : Controller
    {
        private readonly NhaSachDbContext _db;
        public BlogController(NhaSachDbContext db) { _db = db; }

        // GET: /Blog?q=...&page=1&pageSize=10
        public async Task<IActionResult> Index(string? q, int page = 1, int pageSize = 10)
        {
            var query = _db.Baiviets.AsNoTracking().AsQueryable();

            if (!string.IsNullOrWhiteSpace(q))
                query = query.Where(x => x.Tieude_Baiviet.Contains(q) || (x.Tomtat_Baiviet ?? "").Contains(q));

            var total = await query.CountAsync();
            var items = await query
                .OrderByDescending(x => x.Ngay_Tao)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            ViewBag.Q = q;
            ViewBag.Page = page;
            ViewBag.PageSize = pageSize;
            ViewBag.Total = total;

            return View(items); // Views/Blog/Index.cshtml  -> @model List<Baiviet>
        }

        // GET: /Blog/ChiTiet/5
        public async Task<IActionResult> ChiTiet(int id)
        {
            var bv = await _db.Baiviets
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Baiviet_Id == id);

            if (bv == null) return NotFound();
            return View(bv); // Views/Blog/ChiTiet.cshtml -> @model Baiviet
        }

        //  Đọc theo slug:
        [Route("blog/{slug}")]
        public async Task<IActionResult> Doc(string slug)
        {
            var bv = await _db.Baiviets.AsNoTracking().FirstOrDefaultAsync(x => x.Slug_Baiviet == slug);
            if (bv == null) return NotFound();
            return View("ChiTiet", bv);
        }
    }
}

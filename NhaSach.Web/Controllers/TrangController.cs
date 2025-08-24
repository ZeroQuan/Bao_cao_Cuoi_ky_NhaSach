using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.Models;

namespace NhaSach.Web.Controllers
{
    public class TrangController : Controller
    {
        private readonly NhaSachDbContext _db;
        public TrangController(NhaSachDbContext db) { _db = db; }

        // Helper: tạo slug không dấu
        private static string ToSlug(string input)
        {
            if (string.IsNullOrWhiteSpace(input)) return string.Empty;
            var s = input.ToLowerInvariant().Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();
            foreach (var ch in s)
            {
                var cat = CharUnicodeInfo.GetUnicodeCategory(ch);
                if (cat != UnicodeCategory.NonSpacingMark)
                {
                    var c = ch;
                    if (char.IsWhiteSpace(c) || c=='/' || c=='_') c = '-';
                    sb.Append(c);
                }
            }
            s = sb.ToString().Normalize(NormalizationForm.FormC);
            s = Regex.Replace(s, "[^a-z0-9-]+", "-");
            s = Regex.Replace(s, "-{2,}", "-").Trim('-');
            return s;
        }

        // /Trang?q=...
        [AllowAnonymous]
        public async Task<IActionResult> Index(string? q)
        {
            var query = _db.Trangs.AsNoTracking();

            if (!string.IsNullOrWhiteSpace(q))
            {
                var kw = $"%{q.Trim()}%";
                query = query.Where(x =>
                    EF.Functions.Like((x.Tieude_Trang ?? ""), kw) ||
                    EF.Functions.Like((x.Slug_Trang ?? ""), kw));
            }

            var pages = await query.OrderByDescending(x => x.Ngay_Tao).ToListAsync();
            ViewBag.q = q;
            return View(pages);
        }

        // /trang/{slug}
        [AllowAnonymous]
        [Route("trang/{slug}")]
        public async Task<IActionResult> ChiTiet(string slug)
        {
            if (string.IsNullOrWhiteSpace(slug)) return NotFound();
            var p = await _db.Trangs.AsNoTracking().FirstOrDefaultAsync(x => x.Slug_Trang == slug);
            if (p == null) return NotFound();
            return View(p); // Views/Trang/ChiTiet.cshtml -> @model TrangNoiDung
        }

        // GET: /Trang/Tao
        [Authorize]
        public IActionResult Tao()
        {
            return View(new TrangNoiDung
            {
                HienThi_Menu = true
            });
        }

        // POST: /Trang/Tao
        [Authorize, HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Tao(TrangNoiDung m)
        {
            if (string.IsNullOrWhiteSpace(m.Tieude_Trang))
                ModelState.AddModelError(nameof(m.Tieude_Trang), "Vui lòng nhập tiêu đề.");

            if (string.IsNullOrWhiteSpace(m.Slug_Trang))
                m.Slug_Trang = ToSlug(m.Tieude_Trang ?? string.Empty); // << sửa ở đây

            var exists = await _db.Trangs.AnyAsync(x => x.Slug_Trang == m.Slug_Trang);
            if (!ModelState.IsValid || exists)
            {
                if (exists) ModelState.AddModelError(nameof(m.Slug_Trang), "Slug đã tồn tại.");
                return View(m);
            }

            m.Ngay_Tao = DateTime.UtcNow;
            _db.Trangs.Add(m);
            await _db.SaveChangesAsync();
            TempData["Success"] = "Đã tạo trang.";
            return RedirectToAction(nameof(Index));
        }

        // GET: /Trang/Sua/5
        [Authorize]
        public async Task<IActionResult> Sua(int id)
        {
            var p = await _db.Trangs.FindAsync(id);
            if (p == null) return NotFound();
            return View(p); // Views/Trang/Sua.cshtml -> @model TrangNoiDung
        }

        // POST: /Trang/Sua/5
        [Authorize, HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Sua(int id, TrangNoiDung m)
        {
            if (id != m.Trang_Id) return BadRequest();

            if (string.IsNullOrWhiteSpace(m.Tieude_Trang))
                ModelState.AddModelError(nameof(m.Tieude_Trang), "Vui lòng nhập tiêu đề.");

            if (string.IsNullOrWhiteSpace(m.Slug_Trang))
                m.Slug_Trang = ToSlug(m.Tieude_Trang); // << và ở đây

            var slugTaken = await _db.Trangs.AnyAsync(x => x.Trang_Id != m.Trang_Id && x.Slug_Trang == m.Slug_Trang);
            if (!ModelState.IsValid || slugTaken)
            {
                if (slugTaken) ModelState.AddModelError(nameof(m.Slug_Trang), "Slug đã tồn tại.");
                return View(m);
            }

            var p = await _db.Trangs.FindAsync(id);
            if (p == null) return NotFound();

            p.Tieude_Trang = m.Tieude_Trang;
            p.Noidung_Trang = m.Noidung_Trang;
            p.Slug_Trang = m.Slug_Trang;
            p.HienThi_Menu = m.HienThi_Menu;

            await _db.SaveChangesAsync();
            TempData["Success"] = "Đã cập nhật trang.";
            return RedirectToAction(nameof(ChiTiet), new { slug = p.Slug_Trang });
        }

        // POST: /Trang/Xoa
        [Authorize, HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Xoa(int id)
        {
            var p = await _db.Trangs.FindAsync(id);
            if (p != null)
            {
                _db.Trangs.Remove(p);
                await _db.SaveChangesAsync();
                TempData["Success"] = "Đã xoá trang.";
            }
            return RedirectToAction(nameof(Index));
        }

        // POST: /Trang/ToggleMenu
        [Authorize, HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> ToggleMenu(int id)
        {
            var p = await _db.Trangs.FindAsync(id);
            if (p == null) return RedirectToAction(nameof(Index));
            p.HienThi_Menu = !p.HienThi_Menu;
            await _db.SaveChangesAsync();
            TempData["Success"] = p.HienThi_Menu ? "Đã HIỂN THỊ trên menu." : "Đã ẨN khỏi menu.";
            return RedirectToAction(nameof(ChiTiet), new { slug = p.Slug_Trang });
        }
    }
}
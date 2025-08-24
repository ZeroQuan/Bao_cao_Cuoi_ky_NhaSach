using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.Models;
using System.Text;
using System.Globalization;

namespace NhaSach.Web.Controllers
{
    public class DanhmucController : Controller
    {
        private readonly NhaSachDbContext _db;
        public DanhmucController(NhaSachDbContext db) { _db = db; }

        // Helper: tạo slug VN-không-dấu
        private static string ToSlug(string input)
        {
            if (string.IsNullOrWhiteSpace(input)) return string.Empty;
            var s = input.ToLowerInvariant().Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();
            foreach (var ch in s)
            {
                var uc = CharUnicodeInfo.GetUnicodeCategory(ch);
                if (uc != UnicodeCategory.NonSpacingMark)
                {
                    var c = ch;
                    if (char.IsWhiteSpace(c) || c == '/' || c == '_') c = '-';
                    sb.Append(c);
                }
            }
            s = sb.ToString().Normalize(NormalizationForm.FormC);
            s = System.Text.RegularExpressions.Regex.Replace(s, "[^a-z0-9-]+", "-");
            s = System.Text.RegularExpressions.Regex.Replace(s, "-{2,}", "-").Trim('-');
            return s;
        }

        // GET: /Danhmuc
        public async Task<IActionResult> Index()
        {
            var list = await _db.Danhmucs
                .AsNoTracking()
                .OrderBy(x => x.Ten_Danhmuc)
                .ToListAsync();
            return View(list);
        }

        // GET: /Danhmuc/Tao
        public IActionResult Tao()
        {
            return View(new Danhmuc());
        }

        // POST: /Danhmuc/Tao
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Tao(Danhmuc m)
        {
            if (string.IsNullOrWhiteSpace(m.Slug_Danhmuc))
                m.Slug_Danhmuc = ToSlug(m.Ten_Danhmuc);

            // unique slug
            var exists = await _db.Danhmucs.AnyAsync(x => x.Slug_Danhmuc == m.Slug_Danhmuc);
            if (exists) ModelState.AddModelError(nameof(m.Slug_Danhmuc), "Slug đã tồn tại.");

            if (!ModelState.IsValid)
                return View(m);

            _db.Danhmucs.Add(m);
            await _db.SaveChangesAsync();
            TempData["Success"] = "Đã tạo danh mục.";
            return RedirectToAction(nameof(Index));
        }

        // GET: /Danhmuc/Sua/5
        public async Task<IActionResult> Sua(int id)
        {
            var dm = await _db.Danhmucs.FindAsync(id);
            if (dm == null) return NotFound();
            return View(dm);
        }

        // POST: /Danhmuc/Sua/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Sua(int id, Danhmuc m)
        {
            if (id != m.Danhmuc_Id) return BadRequest();

            if (string.IsNullOrWhiteSpace(m.Slug_Danhmuc))
                m.Slug_Danhmuc = ToSlug(m.Ten_Danhmuc);

            var exists = await _db.Danhmucs
                .AnyAsync(x => x.Slug_Danhmuc == m.Slug_Danhmuc && x.Danhmuc_Id != m.Danhmuc_Id);
            if (exists) ModelState.AddModelError(nameof(m.Slug_Danhmuc), "Slug đã tồn tại.");

            if (!ModelState.IsValid)
                return View(m);

            _db.Entry(m).State = EntityState.Modified;
            await _db.SaveChangesAsync();
            TempData["Success"] = "Đã cập nhật danh mục.";
            return RedirectToAction(nameof(Index));
        }

        // POST: /Danhmuc/Xoa/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Xoa(int id)
        {
            var dm = await _db.Danhmucs.FindAsync(id);
            if (dm == null) return RedirectToAction(nameof(Index));

            // chỉ chặn khi còn sản phẩm tham chiếu
            var hasProduct = await _db.Sanphams.AnyAsync(x => x.Danhmuc_Id == id);
            if (hasProduct)
            {
                TempData["Error"] = "Không thể xoá: còn sản phẩm thuộc danh mục này.";
                return RedirectToAction(nameof(Index));
            }

            _db.Danhmucs.Remove(dm);
            await _db.SaveChangesAsync();
            TempData["Success"] = "Đã xoá danh mục.";
            return RedirectToAction(nameof(Index));
        }
    }
}
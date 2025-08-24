using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using NhaSach.Web.Data;
using NhaSach.Web.Models;
using NhaSach.Web.Services.Storage; // << add

namespace NhaSach.Web.Controllers
{
    public class SanphamController : Controller
    {
        private readonly NhaSachDbContext _context;
        private readonly IFileStorage _storage; // << thay cho IWebHostEnvironment

        public SanphamController(NhaSachDbContext context, IFileStorage storage)
        {
            _context = context;
            _storage = storage;
        }

        public async Task<IActionResult> Index()
        {
            var list = await _context.Sanphams.AsNoTracking()
                                .Include(x => x.Danhmuc)
                                .OrderByDescending(x => x.Sanpham_Id)
                                .ToListAsync();
            return View(list);
        }

        public async Task<IActionResult> ChiTiet(int id)
        {
            var sp = await _context.Sanphams.AsNoTracking()
                        .FirstOrDefaultAsync(x => x.Sanpham_Id == id);
            if (sp == null) return NotFound();
            return View(sp);
        }

        // GET: /Sanpham/Tao
        public IActionResult Tao()
        {
            ViewBag.Danhmucs = new SelectList(_context.Danhmucs.AsNoTracking(),
                                              "Danhmuc_Id", "Ten_Danhmuc");
            return View(new Sanpham());
        }

        // POST: /Sanpham/Tao
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Tao(Sanpham model, IFormFile? anh)
        {
            // VALIDATION: KM phải < Giá bán (nếu nhập)
            if (model.GiaKhuyenMai.HasValue && model.GiaKhuyenMai.Value >= model.Gia_Ban)
                ModelState.AddModelError(nameof(Sanpham.GiaKhuyenMai), "Giá khuyến mãi phải nhỏ hơn Giá bán.");

            if (!ModelState.IsValid)
            {
                ViewBag.Danhmucs = new SelectList(_context.Danhmucs, "Danhmuc_Id", "Ten_Danhmuc", model.Danhmuc_Id);
                return View(model);
            }

            if (anh != null && anh.Length > 0)
                model.HinhAnh_Chinh = await _storage.SaveAsync(anh, "sanpham");

            // (tuỳ chọn) cập nhật cờ còn hàng theo tồn kho
            model.Con_Hang = model.SoLuong_Ton > 0;

            _context.Sanphams.Add(model);
            await _context.SaveChangesAsync();
            TempData["Success"] = "Đã thêm sản phẩm.";
            return RedirectToAction(nameof(Index));
        }

        // GET: /Sanpham/Sua/5
        public async Task<IActionResult> Sua(int id)
        {
            var sp = await _context.Sanphams.AsNoTracking().FirstOrDefaultAsync(x => x.Sanpham_Id == id);
            if (sp == null) return NotFound();

            ViewBag.Danhmucs = new SelectList(_context.Danhmucs.AsNoTracking(),
                                              "Danhmuc_Id", "Ten_Danhmuc", sp.Danhmuc_Id);
            return View(sp);
        }

        // POST: /Sanpham/Sua/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Sua(int id, Sanpham model, IFormFile? anh, bool xoaAnh = false)
        {
            var sp = await _context.Sanphams.FindAsync(id);
            if (sp == null) return NotFound();

            // VALIDATION: KM phải < Giá bán (nếu nhập)
            if (model.GiaKhuyenMai.HasValue && model.GiaKhuyenMai.Value >= model.Gia_Ban)
                ModelState.AddModelError(nameof(Sanpham.GiaKhuyenMai), "Giá khuyến mãi phải nhỏ hơn Giá bán.");

            if (!ModelState.IsValid)
            {
                ViewBag.Danhmucs = new SelectList(_context.Danhmucs, "Danhmuc_Id", "Ten_Danhmuc", model.Danhmuc_Id);
                return View(model);
            }

            sp.Ten_Sanpham = model.Ten_Sanpham;
            sp.Gia_Ban = model.Gia_Ban;
            sp.GiaKhuyenMai = model.GiaKhuyenMai;              // << THÊM DÒNG NÀY
            sp.SoLuong_Ton = model.SoLuong_Ton;
            sp.Danhmuc_Id = model.Danhmuc_Id;
            sp.SKU_Sanpham = model.SKU_Sanpham;
            sp.TacGia = model.TacGia;
            sp.NhaXuatBan = model.NhaXuatBan;
            sp.NamXuatBan = model.NamXuatBan;
            sp.ISBN = model.ISBN;
            sp.MoTaNgan_Sanpham = model.MoTaNgan_Sanpham;
            sp.MoTa_Sanpham = model.MoTa_Sanpham;
            sp.Con_Hang = model.SoLuong_Ton > 0;               // (tuỳ chọn)

            if (xoaAnh && !string.IsNullOrEmpty(sp.HinhAnh_Chinh))
            {
                await _storage.DeleteAsync(sp.HinhAnh_Chinh);
                sp.HinhAnh_Chinh = null;
            }

            if (anh != null && anh.Length > 0)
            {
                if (!string.IsNullOrEmpty(sp.HinhAnh_Chinh))
                    await _storage.DeleteAsync(sp.HinhAnh_Chinh);

                sp.HinhAnh_Chinh = await _storage.SaveAsync(anh, "sanpham");
            }

            await _context.SaveChangesAsync();
            TempData["Success"] = "Đã cập nhật sản phẩm.";
            return RedirectToAction(nameof(Index));
        }

        // POST: /Sanpham/Xoa/5
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Xoa(int id)
        {
            var sp = await _context.Sanphams.FindAsync(id);
            if (sp != null)
            {
                if (!string.IsNullOrEmpty(sp.HinhAnh_Chinh))
                    await _storage.DeleteAsync(sp.HinhAnh_Chinh);   // << chỉ 1 tham số

                _context.Sanphams.Remove(sp);
                await _context.SaveChangesAsync();
                TempData["Success"] = "Đã xoá sản phẩm.";
            }
            return RedirectToAction(nameof(Index));
        }
    }
}

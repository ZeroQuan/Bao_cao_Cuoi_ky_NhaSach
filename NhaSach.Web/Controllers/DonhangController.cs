using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.Models;
using NhaSach.Web.ViewModels;
using System.Security.Claims;

namespace NhaSach.Web.Controllers
{
    [Authorize]
    public class DonhangController : Controller
    {
        private readonly NhaSachDbContext _db;
        public DonhangController(NhaSachDbContext db) { _db = db; }

        private string LaySessionId() =>
            HttpContext.Session.GetString("_SESSION_CART_ID_") ?? string.Empty;

        [HttpGet]
        public async Task<IActionResult> Checkout()
        {
            var sid = LaySessionId();
            var items = await _db.Giohang_Items
                                 .Include(x => x.Sanpham)
                                 .Where(x => x.Session_Id == sid)
                                 .ToListAsync();

            var vm = new CheckoutVm { Items = items };
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DatHang(CheckoutVm vm)
        {
            var sid = LaySessionId();
            var items = await _db.Giohang_Items
                                 .Include(x => x.Sanpham)
                                 .Where(x => x.Session_Id == sid)
                                 .ToListAsync();

            if (items.Count == 0) return RedirectToAction("Xem", "Giohang");
            if (!ModelState.IsValid)
            {
                vm.Items = items;
                return View("Checkout", vm);
            }

            var don = new Donhang
            {
                Ma_Don = $"DH{DateTime.UtcNow:yyyyMMddHHmmss}",
                User_Id = User.FindFirstValue(ClaimTypes.NameIdentifier),
                Ho_Ten = vm.Ho_Ten,
                Email = vm.Email,
                DienThoai= vm.DienThoai,
                Dia_Chi = vm.Dia_Chi,
                Tong_Tien = items.Sum(x => x.DonGia_LucThem * x.SoLuong),
                TrangThai_Don = "Chờ Xử Lý",
                Ngay_Dat = DateTime.UtcNow
            };
            _db.Donhangs.Add(don);
            await _db.SaveChangesAsync();

            foreach (var it in items)
            {
                _db.Donhang_Chitiets.Add(new Donhang_Chitiet
                {
                    Donhang_Id = don.Donhang_Id,
                    Sanpham_Id = it.Sanpham_Id,
                    SoLuong    = it.SoLuong,
                    DonGia     = it.DonGia_LucThem
                });

                if (it.Sanpham != null)
                    it.Sanpham.SoLuong_Ton -= it.SoLuong;
            }

            _db.Giohang_Items.RemoveRange(items);
            await _db.SaveChangesAsync();

            return RedirectToAction("HoanTat", new { id = don.Donhang_Id });
        }

        // Trang hoàn tất
        [HttpGet]
        public async Task<IActionResult> HoanTat(int id)
        {
            var don = await _db.Donhangs
                .Include(d => d.Chitiets)
                .ThenInclude(c => c.Sanpham)
                .FirstOrDefaultAsync(d => d.Donhang_Id == id);

            if (don == null) return NotFound();
            return View(don);
        }
    }
}

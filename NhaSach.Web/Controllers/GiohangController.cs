using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.Models;

namespace NhaSach.Web.Controllers
{
    public class GiohangController : Controller
    {
        private readonly NhaSachDbContext _db;
        public GiohangController(NhaSachDbContext db) { _db = db; }

        private string LaySessionId()
        {
            const string key = "_SESSION_CART_ID_";
            var sid = HttpContext.Session.GetString(key);
            if (string.IsNullOrEmpty(sid))
            {
                sid = Guid.NewGuid().ToString("N");
                HttpContext.Session.SetString(key, sid);
            }
            return sid!;
        }

        // ==> LƯU Ý: đã thêm ValidateAntiForgeryToken
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Them(int id, int soLuong = 1)
        {
            if (soLuong <= 0) soLuong = 1;

            var sp = await _db.Sanphams.AsNoTracking().FirstOrDefaultAsync(x => x.Sanpham_Id == id);
            if (sp == null) return NotFound();

            // Hết hàng?
            if (!sp.Con_Hang || sp.SoLuong_Ton <= 0)
            {
                TempData["Error"] = "Sản phẩm tạm hết hàng.";
                return RedirectToAction("Xem");
            }

            var sid = LaySessionId();

            // Đơn giá tại thời điểm thêm (ưu tiên KM nếu hợp lệ)
            var donGia = (sp.GiaKhuyenMai.HasValue && sp.GiaKhuyenMai.Value < sp.Gia_Ban)
                         ? sp.GiaKhuyenMai.Value
                         : sp.Gia_Ban;

            // Lấy item hiện có của cùng session & sản phẩm
            var item = await _db.Giohang_Items
                .FirstOrDefaultAsync(x => x.Session_Id == sid && x.Sanpham_Id == id);

            if (item == null)
            {
                // Giới hạn SL theo tồn kho
                var sl = Math.Min(soLuong, sp.SoLuong_Ton);
                if (sl < soLuong) TempData["Warn"] = "Số lượng vượt tồn kho, đã tự động điều chỉnh.";

                item = new Giohang_Item
                {
                    Session_Id = sid,
                    Sanpham_Id = id,
                    SoLuong = sl,
                    DonGia_LucThem = donGia
                };
                _db.Giohang_Items.Add(item);
            }
            else
            {
                // Cộng dồn nhưng không vượt tồn
                var newQty = item.SoLuong + soLuong;
                if (newQty > sp.SoLuong_Ton)
                {
                    newQty = sp.SoLuong_Ton;
                    TempData["Warn"] = "Số lượng vượt tồn kho, đã tự động điều chỉnh.";
                }
                item.SoLuong = newQty;

                // (tuỳ chọn) cập nhật đơn giá nếu hiện tại đang giảm sâu hơn
                if (donGia < item.DonGia_LucThem)
                    item.DonGia_LucThem = donGia;
            }

            await _db.SaveChangesAsync();
            TempData["Success"] = "Đã thêm vào giỏ hàng.";
            return RedirectToAction("Xem");
        }

        public async Task<IActionResult> Xem()
        {
            var sid = LaySessionId();
            var items = await _db.Giohang_Items
                .Include(x => x.Sanpham)
                .Where(x => x.Session_Id == sid)
                .ToListAsync();

            ViewBag.Tong = items.Sum(i => i.DonGia_LucThem * i.SoLuong);
            return View(items);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Xoa(int id)
        {
            var sid = LaySessionId();
            var item = await _db.Giohang_Items
                .FirstOrDefaultAsync(x => x.Session_Id == sid && x.Giohang_Item_Id == id);

            if (item != null)
            {
                _db.Giohang_Items.Remove(item);
                await _db.SaveChangesAsync();
                TempData["Success"] = "Đã xoá sản phẩm khỏi giỏ.";
            }

            return RedirectToAction("Xem");
        }
    }
}
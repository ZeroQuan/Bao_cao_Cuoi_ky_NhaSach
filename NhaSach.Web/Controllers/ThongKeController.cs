using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NhaSach.Web.Controllers
{
    // Nếu bạn đã bật đăng nhập/quyền hạn thì bỏ comment dòng dưới:
    // [Microsoft.AspNetCore.Authorization.Authorize]
    public class ThongKeController : Controller
    {
        private readonly NhaSachDbContext _db;
        public ThongKeController(NhaSachDbContext db) { _db = db; }

        public async Task<IActionResult> Index()
        {
            var now = DateTime.UtcNow;
            var startMonth = new DateTime(now.Year, now.Month, 1);
            var endMonth = startMonth.AddMonths(1);

            // Tổng quan
            var totalProducts    = await _db.Sanphams.CountAsync();
            var totalCategories  = await _db.Danhmucs.CountAsync();
            var totalOrders      = await _db.Donhangs.CountAsync();
            var revenueThisMonth = await _db.Donhangs
                .Where(d => d.Ngay_Dat >= startMonth && d.Ngay_Dat < endMonth)
                .SumAsync(d => (decimal?)d.Tong_Tien) ?? 0m;
            var revenuePrevMonth = await _db.Donhangs
                .Where(d => d.Ngay_Dat >= startMonth.AddMonths(-1) && d.Ngay_Dat < startMonth)
                .SumAsync(d => (decimal?)d.Tong_Tien) ?? 0m;

            // Top 5 sản phẩm bán chạy trong THÁNG HIỆN TẠI
            var top5 = await _db.Donhang_Chitiets
                // lọc Donhang theo tháng
                .Join(_db.Donhangs.Where(d => d.Ngay_Dat >= startMonth && d.Ngay_Dat < endMonth),
                      ct => ct.Donhang_Id, d => d.Donhang_Id, (ct, d) => ct)
                // join để lấy tên SP (tránh phụ thuộc navigation)
                .Join(_db.Sanphams, ct => ct.Sanpham_Id, sp => sp.Sanpham_Id,
                      (ct, sp) => new { ct.Sanpham_Id, sp.Ten_Sanpham, ct.SoLuong })
                .GroupBy(x => new { x.Sanpham_Id, x.Ten_Sanpham })
                .Select(g => new { g.Key.Sanpham_Id, g.Key.Ten_Sanpham, Total = g.Sum(x => x.SoLuong) })
                .OrderByDescending(x => x.Total)
                .ThenByDescending(x => x.Sanpham_Id)
                .Take(5)
                .ToListAsync();

            // Doanh thu theo ngày trong tháng (mini-chart)
            var daily = await _db.Donhangs
                .Where(d => d.Ngay_Dat >= startMonth && d.Ngay_Dat < endMonth)
                .GroupBy(d => d.Ngay_Dat.Date)
                .Select(g => new { Ngay = g.Key, Sum = g.Sum(x => x.Tong_Tien) })
                .OrderBy(x => x.Ngay)
                .ToListAsync();

            var labels = new List<string>();
            var data   = new List<decimal>();
            for (var d = startMonth.Date; d < endMonth.Date; d = d.AddDays(1))
            {
                labels.Add(d.ToString("dd/MM"));
                var hit = daily.FirstOrDefault(x => x.Ngay == d);
                data.Add(hit?.Sum ?? 0);
            }

            // ViewBags
            ViewBag.TotalProducts     = totalProducts;
            ViewBag.TotalCategories   = totalCategories;
            ViewBag.TotalOrders       = totalOrders;
            ViewBag.RevenueThisMonth  = revenueThisMonth;
            ViewBag.RevenuePrevMonth  = revenuePrevMonth;
            ViewBag.StartMonth        = startMonth;

            ViewBag.Top5SanPhamThang  = top5;
            ViewBag.RevLabels         = labels;
            ViewBag.RevData           = data;

            return View();
        }
    }
}
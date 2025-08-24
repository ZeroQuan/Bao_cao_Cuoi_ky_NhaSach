using NhaSach.Web.Models;

namespace NhaSach.Web.ViewModels
{
    public class HomeIndexVm
    {
        public List<Sanpham> SanPhamMoi { get; set; } = new();
        public List<Sanpham> SanPhamKhuyenMai { get; set; } = new();
        public List<Sanpham> SanPhamNoiBat { get; set; } = new();
        public List<Baiviet> BaiVietMoi { get; set; } = new();
        public List<Sukien> SuKien { get; set; } = new();
    }
}
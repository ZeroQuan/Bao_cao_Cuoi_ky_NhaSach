using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Sanpham")]
    public class Sanpham
    {
        [Key]
        public int Sanpham_Id { get; set; }
        [Required, MaxLength(250)]
        public string Ten_Sanpham { get; set; } = string.Empty;
        [MaxLength(400)]
        public string? MoTaNgan_Sanpham { get; set; }
        public string? MoTa_Sanpham { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal Gia_Ban { get; set; }
        [Column("Gia_KhuyenMai", TypeName = "decimal(18,2)")]
        public decimal? GiaKhuyenMai { get; set; }
        [MaxLength(50)]
        public string? SKU_Sanpham { get; set; }
        public int SoLuong_Ton { get; set; }
        [MaxLength(500)]
        public string? HinhAnh_Chinh { get; set; }
        public bool Con_Hang { get; set; } = true;
        public DateTime Ngay_Tao { get; set; } = DateTime.UtcNow;

        // Thuoc tinh sach
        [MaxLength(150)]
        public string? TacGia { get; set; }
        [MaxLength(150)]
        public string? NhaXuatBan { get; set; }
        public int? NamXuatBan { get; set; }
        [MaxLength(20)]
        public string? ISBN { get; set; }

        // FK
        public int Danhmuc_Id { get; set; }
        public Danhmuc? Danhmuc { get; set; }

        // Nav
        [NotMapped]
        public bool IsKhuyenMai => GiaKhuyenMai.HasValue && GiaKhuyenMai.Value < Gia_Ban;
        public ICollection<Giohang_Item> Giohang_Items { get; set; } = new List<Giohang_Item>();
        public ICollection<Donhang_Chitiet> Donhang_Chitiets { get; set; } = new List<Donhang_Chitiet>();
    }
}
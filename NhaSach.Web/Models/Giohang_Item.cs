using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Giohang_Item")]
    public class Giohang_Item
    {
        [Key]
        public int Giohang_Item_Id { get; set; }
        [MaxLength(64)]
        public string Session_Id { get; set; } = string.Empty; // de khach vang lai
        public string? User_Id { get; set; } // neu dang nhap
        public int Sanpham_Id { get; set; }
        public Sanpham? Sanpham { get; set; }
        public int SoLuong { get; set; } = 1;
        [Column(TypeName = "decimal(18,2)")]
        public decimal DonGia_LucThem { get; set; }
        public DateTime Ngay_Tao { get; set; } = DateTime.UtcNow;
    }
}
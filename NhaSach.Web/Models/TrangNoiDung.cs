using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Trang")]
    public class TrangNoiDung
    {
        [Key]
        public int Trang_Id { get; set; }
        [Required, MaxLength(250)]
        public string Tieude_Trang { get; set; } = string.Empty;
        public string? Noidung_Trang { get; set; }
        [MaxLength(200)]
        public string? Slug_Trang { get; set; } = string.Empty;
        public bool HienThi_Menu { get; set; } = true;
        public DateTime Ngay_Tao { get; set; } = DateTime.UtcNow;
    }
}
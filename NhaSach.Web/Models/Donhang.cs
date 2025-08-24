using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Donhang")]
    public class Donhang
    {
        [Key]
        public int Donhang_Id { get; set; }
        [MaxLength(30)]
        public string Ma_Don { get; set; } = string.Empty;
        [MaxLength(450)]
        public string? User_Id { get; set; }
        [MaxLength(150)]
        public string Ho_Ten { get; set; } = string.Empty;
        [MaxLength(150)]
        public string Email { get; set; } = string.Empty;
        [MaxLength(30)]
        public string DienThoai { get; set; } = string.Empty;
        [MaxLength(400)]
        public string Dia_Chi { get; set; } = string.Empty;
        [Column(TypeName = "decimal(18,2)")]
        public decimal Tong_Tien { get; set; }
        [MaxLength(30)]
        public string TrangThai_Don { get; set; } = "Chờ Xử Lý";
        public DateTime Ngay_Dat { get; set; } = DateTime.UtcNow;
        // Navigation
        public ICollection<Donhang_Chitiet> Chitiets { get; set; } = new List<Donhang_Chitiet>();

        
        [NotMapped]
        public string TrangThai_Don_Norm
        {
            get
            {
                var s = (TrangThai_Don ?? string.Empty).Trim();
                if (string.Equals(s, "ChoXuLy", StringComparison.OrdinalIgnoreCase) || string.Equals(s, "Cho Xu Ly", StringComparison.OrdinalIgnoreCase))
                    return "Chờ Xử Lý";
                return s;
            }
        }

    }
}
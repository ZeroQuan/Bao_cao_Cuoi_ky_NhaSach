using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Baiviet")]
    public class Baiviet
    {
        [Key]
        public int Baiviet_Id { get; set; }
        [Required, MaxLength(250)]
        public string Tieude_Baiviet { get; set; } = string.Empty;
        [MaxLength(400)]
        public string? Tomtat_Baiviet { get; set; }
        public string? Noidung_Baiviet { get; set; }
        [MaxLength(200)]
        public string? Slug_Baiviet { get; set; }
        [MaxLength(100)]
        public string? TacGia_Baiviet { get; set; }
        public DateTime Ngay_Tao { get; set; } = DateTime.UtcNow;
        public ICollection<Baiviet_Tag> Baiviet_Tags { get; set; } = new List<Baiviet_Tag>();
    }
}
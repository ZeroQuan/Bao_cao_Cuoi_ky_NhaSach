using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Sukien")]
    public class Sukien
    {
        [Key]
        public int Sukien_Id { get; set; }
        [Required, MaxLength(250)]
        public string Tieude_Sukien { get; set; } = string.Empty;
        public string? Mota_Sukien { get; set; }
        public DateTime BatDau_Sukien { get; set; }
        public DateTime KetThuc_Sukien { get; set; }
        [MaxLength(200)]
        public string? Diadiem_Sukien { get; set; }
        [MaxLength(200)]
        public string? Slug_Sukien { get; set; }
        [MaxLength(500)]
        public string? Banner_Sukien { get; set; }
    }
}
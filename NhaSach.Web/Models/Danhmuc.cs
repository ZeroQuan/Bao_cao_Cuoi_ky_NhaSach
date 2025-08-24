using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NhaSach.Web.Models
{
    [Table("Danhmuc")]
    public class Danhmuc
    {
        [Key]
        public int Danhmuc_Id { get; set; }
        [Required, MaxLength(200)]
        public string Ten_Danhmuc { get; set; } = string.Empty;
        public string? MoTa_Danhmuc { get; set; }
        [MaxLength(200)]
        public string? Slug_Danhmuc { get; set; }

        // Nav khớp với Fluent API
        public ICollection<Sanpham> Sanphams { get; set; } = new List<Sanpham>();
    }
}
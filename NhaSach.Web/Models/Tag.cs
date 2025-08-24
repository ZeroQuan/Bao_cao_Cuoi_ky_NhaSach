using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Tag")]
    public class Tag
    {
        [Key]
        public int Tag_Id { get; set; }
        [Required, MaxLength(50)]
        public string Ten_Tag { get; set; } = string.Empty;
        public ICollection<Baiviet_Tag> Baiviet_Tags { get; set; } = new List<Baiviet_Tag>();
    }

    [Table("Baiviet_Tag")]
    public class Baiviet_Tag
    {
        public int Baiviet_Id { get; set; }
        public Baiviet Baiviet { get; set; } = null!;
        public int Tag_Id { get; set; }
        public Tag Tag { get; set; } = null!;
    }
}

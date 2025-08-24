using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace NhaSach.Web.Models
{
    [Table("Donhang_Chitiet")]
    public class Donhang_Chitiet
    {
        [Key]
        public int Donhang_Chitiet_Id { get; set; }
        // FK bắt buộc
        public int Donhang_Id { get; set; }
        public Donhang Donhang { get; set; } = null!;
        public int Sanpham_Id { get; set; }
        public Sanpham Sanpham { get; set; } = null!;
        public int SoLuong { get; set; }
        [Column(TypeName = "decimal(18,2)")]
        public decimal DonGia { get; set; } 
    }
}

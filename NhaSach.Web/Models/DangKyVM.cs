using System.ComponentModel.DataAnnotations;

namespace NhaSach.Web.Models
{
    public class DangKyVM
    {
        [Required, EmailAddress]
        public string Email { get; set; } = "";
        [Required, DataType(DataType.Password)]
        public string Password { get; set; } = "";
        [Required, DataType(DataType.Password), Compare(nameof(Password), ErrorMessage = "Mat khau khong khop")]
        public string ConfirmPassword { get; set; } = "";
        public string? HoTen { get; set; }
    }
}
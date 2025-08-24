using System.ComponentModel.DataAnnotations;

namespace NhaSach.Web.Models
{
    public class DangNhapVM
    {
        [Required, EmailAddress]
        public string Email { get; set; } = "";
        [Required, DataType(DataType.Password)]
        public string Password { get; set; } = "";
        public bool GhiNho { get; set; } = false;
        public string? ReturnUrl { get; set; }
    }
}
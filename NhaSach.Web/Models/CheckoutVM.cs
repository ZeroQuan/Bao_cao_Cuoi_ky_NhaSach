using NhaSach.Web.Models;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace NhaSach.Web.ViewModels
{
    public class CheckoutVm
    {
        public List<Giohang_Item> Items { get; set; } = new();

        // Thông tin nhận hàng
        [Required] public string Ho_Ten { get; set; } = "";
        [Required, EmailAddress] public string Email { get; set; } = "";
        [Required] public string DienThoai { get; set; } = "";
        [Required] public string Dia_Chi { get; set; } = "";
    }
}
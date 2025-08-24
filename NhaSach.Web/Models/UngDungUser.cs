using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace NhaSach.Web.Models
{
    public class UngDungUser : IdentityUser
    {
        [MaxLength(150)]
        public string? Ho_Ten { get; set; }

        [MaxLength(400)]
        public string? Dia_Chi { get; set; }
    }
}
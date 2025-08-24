using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using NhaSach.Web.Models;
using System.Threading.Tasks;

namespace NhaSach.Web.Controllers
{
    [AllowAnonymous]
    [Authorize]   
    public class TaikhoanController : Controller
    {
        private readonly UserManager<UngDungUser> _userManager;
        private readonly SignInManager<UngDungUser> _signInManager;

        public TaikhoanController(UserManager<UngDungUser> userManager, SignInManager<UngDungUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [HttpGet]
        public IActionResult Index(string? returnUrl = null)
        {
            ViewBag.ReturnUrl = string.IsNullOrEmpty(returnUrl) ? "/" : returnUrl;
            return View(new { }); // model trống, form sẽ post VM riêng
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DangNhap(DangNhapVM model)
        {
            var returnUrl = string.IsNullOrEmpty(model.ReturnUrl) ? "/" : model.ReturnUrl;

            if (!ModelState.IsValid) return RedirectToAction(nameof(Index), new { returnUrl });

            var result = await _signInManager.PasswordSignInAsync(model.Email, model.Password, model.GhiNho, lockoutOnFailure: false);
            if (result.Succeeded) return LocalRedirect(returnUrl);

            TempData["Error"] = "Dang nhap that bai. Kiem tra Email/Mat khau.";
            return RedirectToAction(nameof(Index), new { returnUrl });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DangKy(DangKyVM model)
        {
            if (!ModelState.IsValid) return RedirectToAction(nameof(Index));

            var user = new UngDungUser
            {
                UserName = model.Email,
                Email = model.Email,
                Ho_Ten = model.HoTen
            };
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                await _signInManager.SignInAsync(user, isPersistent: false);
                return RedirectToAction("Index", "CuaHang");
            }

            foreach (var err in result.Errors)
                TempData["Error"] = (TempData["Error"] as string ?? "") + err.Description + "\n";

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DangXuat()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "CuaHang");
        }
    }
}
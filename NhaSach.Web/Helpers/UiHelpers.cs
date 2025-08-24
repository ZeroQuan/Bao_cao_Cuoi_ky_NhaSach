using Microsoft.AspNetCore.Mvc;
using System.Globalization;

namespace NhaSach.Web.Helpers
{
    public static class UiHelpers
    {
        private static readonly CultureInfo vi = new("vi-VN");

        // --- Currency ---
        public static string ToCurrency(this decimal v, string suffix = " đ")
            => v.ToString("N0", vi) + suffix;

        public static string ToCurrency(this decimal? v, string suffix = " đ")
            => (v ?? 0m).ToString("N0", vi) + suffix;

        // --- Image URL ---
        public static string ImgSrc(this IUrlHelper url, string? p)
        {
            if (string.IsNullOrWhiteSpace(p))
                return url.Content("~/images/placeholder.png");

            if (Uri.TryCreate(p, UriKind.Absolute, out _))
                return p;

            // chuẩn hoá đường dẫn tương đối
            var path = p.StartsWith("~/") ? p : "~/" + p.TrimStart('/');
            return url.Content(path);
        }
    }
}

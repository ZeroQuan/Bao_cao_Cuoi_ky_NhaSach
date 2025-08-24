// Helpers/FileHelper.cs
using Microsoft.AspNetCore.Http;

namespace NhaSach.Web.Helpers
{
    public static class FileHelper
    {
        private static readonly string[] AllowExt = [".jpg", ".jpeg", ".png", ".gif", ".webp"];
        public static bool IsImage(string fileName) =>
            AllowExt.Contains(Path.GetExtension(fileName).ToLowerInvariant());

        public static async Task<string?> SaveUploadAsync(IFormFile file, IWebHostEnvironment env, long maxBytes = 2_000_000)
        {
            if (file == null || file.Length == 0) return null;
            if (file.Length > maxBytes) throw new InvalidOperationException("File qua lon (>2MB).");
            if (!IsImage(file.FileName)) throw new InvalidOperationException("Dinh dang khong ho tro.");

            var uploads = Path.Combine(env.WebRootPath, "uploads");
            Directory.CreateDirectory(uploads);

            var ext = Path.GetExtension(file.FileName).ToLowerInvariant();
            var fname = $"{Guid.NewGuid():N}{ext}";
            var fullPath = Path.Combine(uploads, fname);

            using (var stream = System.IO.File.Create(fullPath))
            {
                await file.CopyToAsync(stream);
            }
            return $"/uploads/{fname}";
        }

        public static void DeleteUpload(string? virtualPath, IWebHostEnvironment env)
        {
            if (string.IsNullOrWhiteSpace(virtualPath)) return;
            if (virtualPath.StartsWith("/")) virtualPath = virtualPath.TrimStart('/');
            var fullPath = Path.Combine(env.WebRootPath, virtualPath);
            if (System.IO.File.Exists(fullPath)) System.IO.File.Delete(fullPath);
        }
    }
}

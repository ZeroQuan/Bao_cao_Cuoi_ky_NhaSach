using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace NhaSach.Web.Services.Storage
{
    public class LocalFileStorage : IFileStorage
    {
        private readonly IWebHostEnvironment _env;
        private readonly string _root; // wwwroot/uploads

        public LocalFileStorage(IWebHostEnvironment env, IConfiguration cfg)
        {
            _env = env;
            var sub = cfg["Storage:Local:RootFolder"] ?? "uploads";
            _root = Path.Combine(_env.WebRootPath ?? _env.ContentRootPath, sub);
            Directory.CreateDirectory(_root);
        }

        public async Task<string> SaveAsync(IFormFile file, string folder)
        {
            var dir = Path.Combine(_root, folder);
            Directory.CreateDirectory(dir);

            var name = $"{Guid.NewGuid():N}{Path.GetExtension(file.FileName)}";
            var physical = Path.Combine(dir, name);
            using var fs = new FileStream(physical, FileMode.Create);
            await file.CopyToAsync(fs);

            // Trả về path tương đối dùng cho <img src="...">
            return $"/{Path.GetRelativePath(_env.WebRootPath ?? _env.ContentRootPath, physical)}"
                    .Replace("\\", "/");
        }

        public Task DeleteAsync(string storedPath)
        {
            if (string.IsNullOrWhiteSpace(storedPath)) return Task.CompletedTask;

            var rel = storedPath.TrimStart('~', '/').Replace('/', Path.DirectorySeparatorChar);
            var physical = Path.Combine(_env.WebRootPath ?? _env.ContentRootPath, rel);
            if (File.Exists(physical)) File.Delete(physical);
            return Task.CompletedTask;
        }
    }
}

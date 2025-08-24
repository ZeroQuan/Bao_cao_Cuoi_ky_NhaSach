using Microsoft.AspNetCore.Http;

namespace NhaSach.Web.Services.Storage
{
    public interface IFileStorage
    {
        // Lưu file, trả về đường dẫn/URL đã lưu
        Task<string> SaveAsync(IFormFile file, string folder);
        // Xoá theo đúng đường dẫn đã lưu (relative hoặc absolute URL)
        Task DeleteAsync(string storedPath);
    }
}

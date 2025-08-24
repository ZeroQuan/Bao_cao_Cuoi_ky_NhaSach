using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Microsoft.AspNetCore.Http;

namespace NhaSach.Web.Services.Storage
{
    public class AzureBlobFileStorage : IFileStorage
    {
        private readonly BlobContainerClient _container;

        public AzureBlobFileStorage(IConfiguration cfg)
        {
            var cs = cfg["Storage:Azure:ConnectionString"];
            var containerName = cfg["Storage:Azure:Container"] ?? "sanpham";
            if (string.IsNullOrWhiteSpace(cs))
                throw new InvalidOperationException("Thiếu Storage:Azure:ConnectionString.");

            var service = new BlobServiceClient(cs);
            _container = service.GetBlobContainerClient(containerName);
            _container.CreateIfNotExists(PublicAccessType.Blob);
        }

        public async Task<string> SaveAsync(IFormFile file, string folder)
        {
            var blobName = $"{folder}/{Guid.NewGuid():N}{Path.GetExtension(file.FileName)}".ToLowerInvariant();
            var blob = _container.GetBlobClient(blobName);
            using var s = file.OpenReadStream();
            await blob.UploadAsync(s, new BlobHttpHeaders { ContentType = file.ContentType });
            // Trả về URL tuyệt đối -> dùng trực tiếp trong <img src="">
            return blob.Uri.ToString();
        }

        public async Task DeleteAsync(string storedPath)
        {
            if (string.IsNullOrWhiteSpace(storedPath)) return;

            // Hỗ trợ cả URL tuyệt đối lẫn tên blob tương đối
            string name;
            if (Uri.TryCreate(storedPath, UriKind.Absolute, out var uri))
            {
                // Lấy phần đường dẫn bên trong container
                var prefix = _container.Uri.AbsolutePath.TrimEnd('/') + "/";
                var path = uri.AbsolutePath;
                name = path.StartsWith(prefix, StringComparison.OrdinalIgnoreCase)
                    ? path.Substring(prefix.Length)
                    : Path.GetFileName(uri.LocalPath);
            }
            else
            {
                name = storedPath.TrimStart('/');
            }

            await _container.DeleteBlobIfExistsAsync(name, DeleteSnapshotsOption.IncludeSnapshots);
        }
    }
}

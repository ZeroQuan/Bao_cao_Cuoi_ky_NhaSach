using Microsoft.AspNetCore.Identity.EntityFrameworkCore;   // vẫn dùng namespace này
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Models;

namespace NhaSach.Web.Data
{
    // CHỈ User, KHÔNG Roles:
    public class NhaSachDbContext : IdentityUserContext<UngDungUser>
    {
        public NhaSachDbContext(DbContextOptions<NhaSachDbContext> options) : base(options) { }
        public DbSet<Danhmuc> Danhmucs => Set<Danhmuc>();
        public DbSet<Sanpham> Sanphams => Set<Sanpham>();
        public DbSet<TrangNoiDung> Trangs => Set<TrangNoiDung>();
        public DbSet<Baiviet> Baiviets => Set<Baiviet>();
        public DbSet<Tag> Tags => Set<Tag>();
        public DbSet<Baiviet_Tag> Baiviet_Tags => Set<Baiviet_Tag>();
        public DbSet<Sukien> Sukiens => Set<Sukien>();
        public DbSet<Giohang_Item> Giohang_Items => Set<Giohang_Item>();
        public DbSet<Donhang> Donhangs => Set<Donhang>();
        public DbSet<Donhang_Chitiet> Donhang_Chitiets => Set<Donhang_Chitiet>();

        protected override void OnModelCreating(ModelBuilder b)
        {
            base.OnModelCreating(b);

            // Đổi tên bảng user thành TaiKhoan (tuỳ chọn)
            b.Entity<UngDungUser>().ToTable("TaiKhoan");

            // Khóa ghép cho bài viết - tag
            b.Entity<Baiviet_Tag>().HasKey(x => new { x.Baiviet_Id, x.Tag_Id });

            // Index slug/sku
            b.Entity<Danhmuc>().HasIndex(x => x.Slug_Danhmuc).IsUnique(false);
            b.Entity<Sanpham>().HasIndex(x => x.SKU_Sanpham).IsUnique(false);
            b.Entity<TrangNoiDung>().HasIndex(x => x.Slug_Trang).IsUnique(true);
            b.Entity<Baiviet>().HasIndex(x => x.Slug_Baiviet).IsUnique(false);
            b.Entity<Sukien>().HasIndex(x => x.Slug_Sukien).IsUnique(false);
            b.Entity<Giohang_Item>().HasIndex(x => new { x.Session_Id, x.Sanpham_Id }).IsUnique();


            // Sanpham -- Danhmuc (1-n)
            b.Entity<Sanpham>(e =>
            {
                e.HasOne(p => p.Danhmuc)
                 .WithMany(d => d.Sanphams)
                 .HasForeignKey(p => p.Danhmuc_Id)
                 .OnDelete(DeleteBehavior.Restrict);
            });

            // Donhang_Chitiet -- Donhang (1-n) & -- Sanpham (1-n)
            b.Entity<Donhang_Chitiet>(e =>
            {
                e.HasOne(x => x.Donhang)
                 .WithMany(d => d.Chitiets)
                 .HasForeignKey(x => x.Donhang_Id)
                 .OnDelete(DeleteBehavior.Cascade);

                e.HasOne(x => x.Sanpham)
                 .WithMany(p => p.Donhang_Chitiets)
                 .HasForeignKey(x => x.Sanpham_Id)
                 .OnDelete(DeleteBehavior.Restrict);
            });

            // Baiviet_Tag (join entity)
            b.Entity<Baiviet_Tag>(e =>
            {
                e.HasKey(x => new { x.Baiviet_Id, x.Tag_Id });

                e.HasOne(x => x.Baiviet)
                 .WithMany(bv => bv.Baiviet_Tags)
                 .HasForeignKey(x => x.Baiviet_Id)
                 .OnDelete(DeleteBehavior.Cascade);

                e.HasOne(x => x.Tag)
                 .WithMany(t => t.Baiviet_Tags)
                 .HasForeignKey(x => x.Tag_Id)
                 .OnDelete(DeleteBehavior.Cascade);
            });

            // Giohang_Item -> Sanpham (tránh Sanpham_Id1)
            b.Entity<Giohang_Item>(e =>
            {
                e.HasOne(x => x.Sanpham)
                 .WithMany(p => p.Giohang_Items)
                 .HasForeignKey(x => x.Sanpham_Id)
                 .OnDelete(DeleteBehavior.Restrict);
            });
        }
    }
}
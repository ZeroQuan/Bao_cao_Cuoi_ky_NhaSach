using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Models;

namespace NhaSach.Web.Data
{
    public static class DbSeeder
    {
        public static void Seed(NhaSachDbContext db)
        {
            // nếu chưa có trang nào
            if (!db.Trangs.Any())
            {
                db.Trangs.AddRange(
                    new TrangNoiDung {
                        Tieude_Trang = "Giới thiệu",
                        Slug_Trang = "gioi-thieu",
                        Noidung_Trang = "<p>Đây là trang giới thiệu của Nhà Sách.</p>"
                    },
                    new TrangNoiDung {
                        Tieude_Trang = "Liên hệ",
                        Slug_Trang = "lien-he",
                        Noidung_Trang = "<p>Thông tin liên hệ: 0123456789</p>"
                    }
                );
            }

            // nếu chưa có sự kiện nào
            if (!db.Sukiens.Any())
            {
                db.Sukiens.AddRange(
                    new Sukien {
                        Tieude_Sukien = "Khai trương chi nhánh mới",
                        Diadiem_Sukien = "Hà Nội",
                        BatDau_Sukien = DateTime.UtcNow.AddDays(5),
                        KetThuc_Sukien = DateTime.UtcNow.AddDays(6),
                        Mota_Sukien = "<p>Sự kiện khai trương chi nhánh mới tại Hà Nội.</p>"
                    },
                    new Sukien {
                        Tieude_Sukien = "Workshop đọc sách",
                        Diadiem_Sukien = "TP.HCM",
                        BatDau_Sukien = DateTime.UtcNow.AddDays(10),
                        KetThuc_Sukien = DateTime.UtcNow.AddDays(10).AddHours(2),
                        Mota_Sukien = "<p>Buổi workshop về thói quen đọc sách.</p>"
                    }
                );
            }

            db.SaveChanges();
        }
    }
}
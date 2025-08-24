using System;
using System.Globalization;
using System.Runtime.InteropServices;

namespace NhaSach.Web.Helpers
{
    public static class DateTimeExtensions
    {
        private static readonly CultureInfo vn = new CultureInfo("vi-VN");

        private static readonly TimeZoneInfo tzVN = GetVietnamTimeZone();

        private static TimeZoneInfo GetVietnamTimeZone()
        {
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                return TimeZoneInfo.FindSystemTimeZoneById("SE Asia Standard Time");
            }
            else
            {
                // Linux / macOS
                return TimeZoneInfo.FindSystemTimeZoneById("Asia/Ho_Chi_Minh");
            }
        }

        public static string ToVNString(this DateTime dateTime)
        {
            // Chuyển về UTC trước rồi convert sang giờ VN
            var utc = dateTime.Kind == DateTimeKind.Unspecified 
                ? DateTime.SpecifyKind(dateTime, DateTimeKind.Utc) 
                : dateTime.ToUniversalTime();

            var local = TimeZoneInfo.ConvertTimeFromUtc(utc, tzVN);

            return local.ToString("dd/MM/yyyy 'lúc' HH:mm", vn);
        }
    }
}
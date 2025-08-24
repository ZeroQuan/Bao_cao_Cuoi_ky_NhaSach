using System.Globalization;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;
using NhaSach.Web.Models;
using NhaSach.Web.Services.Storage; // << add

var builder = WebApplication.CreateBuilder(args);

// DbContext
builder.Services.AddDbContext<NhaSachDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("Chuoiketnoi")));

// Identity
builder.Services
    .AddDefaultIdentity<UngDungUser>(options =>
    {
        options.Password.RequireDigit = false;
        options.Password.RequireUppercase = false;
        options.Password.RequireLowercase = false;
        options.Password.RequireNonAlphanumeric = false;
        options.Password.RequiredLength = 6;
    })
    .AddEntityFrameworkStores<NhaSachDbContext>();

// MVC + Razor Pages
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

builder.Services.AddHttpContextAccessor();

// Session
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(o =>
{
    o.IdleTimeout = TimeSpan.FromHours(2);
    o.Cookie.HttpOnly = true;
    o.Cookie.IsEssential = true;
});

// Cookie paths
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/Taikhoan/Index";   
    options.LogoutPath = "/Taikhoan/Index";
    options.AccessDeniedPath = "/Taikhoan/Index";
});

// Chon Storage provider
var provider = builder.Configuration["Storage:Provider"];
if (string.Equals(provider, "AzureBlob", StringComparison.OrdinalIgnoreCase))
    builder.Services.AddSingleton<IFileStorage, AzureBlobFileStorage>();
else
    builder.Services.AddSingleton<IFileStorage, LocalFileStorage>();

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Loixayra");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseForwardedHeaders(new ForwardedHeadersOptions
{
    ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
});

app.UseSession();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapRazorPages();

// (Tuy chon) Migrate + Seed (nen chi dev)
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<NhaSachDbContext>();
    db.Database.Migrate();
    // DbSeeder.Seed(db);
}

app.Run();
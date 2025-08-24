using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NhaSach.Web.Data;

namespace NhaSach.Web.ViewComponents
{
    public class DanhmucMenuComponent : ViewComponent
    {
        private readonly NhaSachDbContext _db;
        public DanhmucMenuComponent(NhaSachDbContext db) { _db = db; }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var list = await _db.Danhmucs.AsNoTracking().OrderBy(x => x.Ten_Danhmuc).ToListAsync();
            return View("~/Views/Shared/_DanhmucMenu.cshtml", list);
        }
    }
}
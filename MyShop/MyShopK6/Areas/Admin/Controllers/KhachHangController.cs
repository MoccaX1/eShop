using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MyShopK6.Models;
using OfficeOpenXml;

namespace MyShopK6.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class KhachHangController : Controller
    {
        private readonly MyDbContext _context;

        public KhachHangController(MyDbContext context)
        {
            _context = context;
        }

        public IActionResult ExportToExcel()
        {
            //Chuẩn bị dữ liệu
            var data = _context.KhachHangs.Select(kh => new
            {
                Email = kh.Email,
                FirstName = kh.HoLot,
                LastName = kh.Ten
            });

            //Xuất ra Excel dùng EPLus
            var stream = new MemoryStream();
            using (var package = new ExcelPackage(stream))
            {
                var sheet = package.Workbook.Worksheets.Add("Customer");
                
                //sheet.Cells[1, 1].Value = "A";
                sheet.Cells.LoadFromCollection(data, true);

                package.Save();
            }
            stream.Position = 0;
            
            return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "KhachHang.xlsx");
        }
    }
}
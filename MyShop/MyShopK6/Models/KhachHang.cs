using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MyShopK6.Models
{   
    public class KhachHangView
    {
        [MaxLength(150)]
        [Required(ErrorMessage = "*")]
        [Display(Name = "Họ lót")]
        public string HoLot { get; set; }
        [MaxLength(50)]
        [Required(ErrorMessage ="*")]
        [Display(Name ="Tên")]
        public string Ten { get; set; }
        [MaxLength(150)]
        [Required(ErrorMessage = "*")]
        [Remote(controller:"KhachHang", action:"CheckEmailAvaible", ErrorMessage ="Email đã tồn tại")]
        public string Email { get; set; }
        [MaxLength(50)]
        [Required(ErrorMessage = "*")]
        [Display(Name = "Điện thoại")]
        public string DienThoai { get; set; }
        [MaxLength(150)]
        [Required(ErrorMessage = "*")]
        [Display(Name = "Mật khẩu")]
        [DataType(DataType.Password)]
        public string MatKhau { get; set; }        
        [MaxLength(150)]
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }

    }

    [Table("KhachHang")]
    public class KhachHang : KhachHangView
    {
        [Key]
        [MaxLength(50)]
        public string MaKh { get; set; }
        [MaxLength(10)]
        public string RandomKey { get; set; }
        public DateTime LastLogin { get; set; }
        public bool IsActive { get; set; }
        public string Role { get; set; } = MyRole.Customer;
    }

    public class MyRole
    {
        public static string Admin = "Admin";
        public static string Customer = "Customer";
        public static string Guest = "Guest";
    }
}

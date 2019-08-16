using Microsoft.EntityFrameworkCore.Migrations;

namespace MyShopK6.Migrations
{
    public partial class Update_Table_KhachHang : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "HoTen",
                table: "KhachHang",
                newName: "HoLot");

            migrationBuilder.AddColumn<string>(
                name: "Ten",
                table: "KhachHang",
                maxLength: 50,
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Ten",
                table: "KhachHang");

            migrationBuilder.RenameColumn(
                name: "HoLot",
                table: "KhachHang",
                newName: "HoTen");
        }
    }
}

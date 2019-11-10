using Microsoft.EntityFrameworkCore.Migrations;

namespace MyShopK6.Migrations
{
    public partial class Add_Twilio : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "AuthyId",
                table: "KhachHang",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PhoneNumber",
                table: "KhachHang",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "PhoneNumberConfirmed",
                table: "KhachHang",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AuthyId",
                table: "KhachHang");

            migrationBuilder.DropColumn(
                name: "PhoneNumber",
                table: "KhachHang");

            migrationBuilder.DropColumn(
                name: "PhoneNumberConfirmed",
                table: "KhachHang");
        }
    }
}

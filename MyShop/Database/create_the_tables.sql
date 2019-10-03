--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1+deb10u1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1+deb10u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: HangHoa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."HangHoa" (
    "MaHh" integer NOT NULL,
    "TenHh" character varying(150) NOT NULL,
    "Hinh" character varying(150),
    "MoTa" text,
    "DonGia" double precision NOT NULL,
    "SoLuong" integer NOT NULL,
    "MaLoai" integer NOT NULL,
    "MaTh" character varying(50),
    "GiamGia" integer DEFAULT 0 NOT NULL
);


--
-- Name: KhachHang; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."KhachHang" (
    "MaKh" character varying(50) NOT NULL,
    "HoLot" character varying(150) NOT NULL,
    "Email" character varying(150) NOT NULL,
    "DienThoai" character varying(50) NOT NULL,
    "MatKhau" character varying(150) NOT NULL,
    "DiaChi" character varying(150),
    "RandomKey" character varying(10),
    "LastLogin" timestamp without time zone NOT NULL,
    "IsActive" boolean NOT NULL,
    "Role" text,
    "Ten" character varying(50) DEFAULT ''::character varying NOT NULL
);


--
-- Name: Loai; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Loai" (
    "MaLoai" integer NOT NULL,
    "TenLoai" character varying(50),
    "MoTa" text,
    "Hinh" character varying(150),
    "MaLoaiCha" integer
);


--
-- Name: ThuongHieu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."ThuongHieu" (
    "MaTh" character varying(50) NOT NULL,
    "TenThuongHieu" character varying(50) NOT NULL,
    "DiaChi" character varying(150),
    "DienThoai" character varying(50),
    "Logo" character varying(150)
);


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


--
-- Name: HangHoa PK_HangHoa; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HangHoa"
    ADD CONSTRAINT "PK_HangHoa" PRIMARY KEY ("MaHh");


--
-- Name: KhachHang PK_KhachHang; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."KhachHang"
    ADD CONSTRAINT "PK_KhachHang" PRIMARY KEY ("MaKh");


--
-- Name: Loai PK_Loai; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Loai"
    ADD CONSTRAINT "PK_Loai" PRIMARY KEY ("MaLoai");


--
-- Name: ThuongHieu PK_ThuongHieu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."ThuongHieu"
    ADD CONSTRAINT "PK_ThuongHieu" PRIMARY KEY ("MaTh");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_HangHoa_MaLoai; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_HangHoa_MaLoai" ON public."HangHoa" USING btree ("MaLoai");


--
-- Name: IX_HangHoa_MaTh; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_HangHoa_MaTh" ON public."HangHoa" USING btree ("MaTh");


--
-- Name: IX_Loai_MaLoaiCha; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IX_Loai_MaLoaiCha" ON public."Loai" USING btree ("MaLoaiCha");


--
-- Name: HangHoa FK_HangHoa_Loai_MaLoai; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HangHoa"
    ADD CONSTRAINT "FK_HangHoa_Loai_MaLoai" FOREIGN KEY ("MaLoai") REFERENCES public."Loai"("MaLoai") ON DELETE CASCADE;


--
-- Name: HangHoa FK_HangHoa_ThuongHieu_MaTh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."HangHoa"
    ADD CONSTRAINT "FK_HangHoa_ThuongHieu_MaTh" FOREIGN KEY ("MaTh") REFERENCES public."ThuongHieu"("MaTh") ON DELETE RESTRICT;


--
-- Name: Loai FK_Loai_Loai_MaLoaiCha; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Loai"
    ADD CONSTRAINT "FK_Loai_Loai_MaLoaiCha" FOREIGN KEY ("MaLoaiCha") REFERENCES public."Loai"("MaLoai") ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


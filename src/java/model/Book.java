/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ThinkPad X1 G4
 */
public class Book{
    private int id,soluong;
    private String tensach, tacgia, dinhdang, img;
    private double trongluong, giaban;
    private Category category;
    private int stt, giamgia;
    private Date ngaythem;
    private int daban;
    public Book(int id, String tensach, String tacgia, String dinhdang, double trongluong, double giaban, Category category, int giamgia, int stt, String img,Date ngaythem,int soluong,int daban) {
        this.id = id;
        this.tensach = tensach;
        this.tacgia = tacgia;
        this.dinhdang = dinhdang;
        this.img = img;
        this.trongluong = trongluong;
        this.giaban = giaban;
        this.giamgia = giamgia;
        this.category = category;
        this.stt = stt;
        this.ngaythem=ngaythem;
        this.soluong=soluong;
        this.daban=daban;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public Date getNgaythem() {
        return ngaythem;
    }

    public void setNgaythem(Date ngaythem) {
        this.ngaythem = ngaythem;
    }

    public Book() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTensach() {
        return tensach;
    }

    public void setTensach(String tensach) {
        this.tensach = tensach;
    }

    public String getTacgia() {
        return tacgia;
    }

    public void setTacgia(String tacgia) {
        this.tacgia = tacgia;
    }

    public String getDinhdang() {
        return dinhdang;
    }

    public void setDinhdang(String dinhdang) {
        this.dinhdang = dinhdang;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getTrongluong() {
        return trongluong;
    }

    public void setTrongluong(double trongluong) {
        this.trongluong = trongluong;
    }

    public double getGiaban() {
        return giaban;
    }

    public void setGiaban(double giaban) {
        this.giaban = giaban;
    }

    public int getGiamgia() {
        return giamgia;
    }

    public void setGiamgia(int giamgia) {
        this.giamgia = giamgia;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public int getDaban() {
        return daban;
    }

    public void setDaban(int daban) {
        this.daban = daban;
    }


    

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ThinkPad X1 G4
 */
public class Order_Detail {
    private int ID;
    private int OrderID;
    private String Tensach;
    private int Soluong;
    private double Thanhtien;
    private double Giaban;
    public Order_Detail() {
    }

    public Order_Detail(int ID, int OrderID, String Tensach, int Soluong, double Thanhtien, double Giaban) {
        this.ID = ID;
        this.OrderID = OrderID;
        this.Tensach = Tensach;
        this.Soluong = Soluong;
        this.Thanhtien = Thanhtien;
        this.Giaban = Giaban;
    }


    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getTensach() {
        return Tensach;
    }

    public void setTensach(String Tensach) {
        this.Tensach = Tensach;
    }

    public int getSoluong() {
        return Soluong;
    }

    public void setSoluong(int Soluong) {
        this.Soluong = Soluong;
    }

    public double getThanhtien() {
        return Thanhtien;
    }

    public void setThanhtien(double Thanhtien) {
        this.Thanhtien = Thanhtien;
    }

    public double getGiaban() {
        return Giaban;
    }

    public void setGiaban(double Giaban) {
        this.Giaban = Giaban;
    }
    
}

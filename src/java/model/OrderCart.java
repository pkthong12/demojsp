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
public class OrderCart {
    private int ID;
    private String Hoten;
    private String Phone;
    private Account Account;
    private double Total;
    private OrderStatus status;
    private String Diachi;
    private double Giamgia;
    private String Thoigian;
    private String Email;
    private MethodPayment Method;
    private double TotalFirst;
    private double Phiship;

   
    public OrderCart() {
    }

    public OrderCart(int ID, String Hoten, String Phone, Account Account, double Total, OrderStatus status, String Diachi, double Giamgia, String Thoigian, String Email, MethodPayment Method, double TotalFirst, double Phiship) {
        this.ID = ID;
        this.Hoten = Hoten;
        this.Phone = Phone;
        this.Account = Account;
        this.Total = Total;
        this.status = status;
        this.Diachi = Diachi;
        this.Giamgia = Giamgia;
        this.Thoigian = Thoigian;
        this.Email = Email;
        this.Method = Method;
        this.TotalFirst = TotalFirst;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getHoten() {
        return Hoten;
    }

    public void setHoten(String Hoten) {
        this.Hoten = Hoten;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public Account getAccount() {
        return Account;
    }

    public void setAccount(Account Account) {
        this.Account = Account;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public String getDiachi() {
        return Diachi;
    }

    public void setDiachi(String Diachi) {
        this.Diachi = Diachi;
    }

    public double getGiamgia() {
        return Giamgia;
    }

    public void setGiamgia(double Giamgia) {
        this.Giamgia = Giamgia;
    }

    public String getThoigian() {
        return Thoigian;
    }

    public void setThoigian(String Thoigian) {
        this.Thoigian = Thoigian;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public MethodPayment getMethod() {
        return Method;
    }

    public void setMethod(MethodPayment Method) {
        this.Method = Method;
    }

    public double getTotalFirst() {
        return TotalFirst;
    }

    public void setTotalFirst(double TotalFirst) {
        this.TotalFirst = TotalFirst;
    }
     public double getPhiship() {
        return Phiship;
    }

    public void setPhiship(double Phiship) {
        this.Phiship = Phiship;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ThinkPad X1 G4
 */
public class Discount {
    private String magg;
    private double rate;
    private int Stt;
    public Discount() {
    }

    public Discount(String magg, double rate, int Stt) {
        this.magg = magg;
        this.rate = rate;
        this.Stt = Stt;
    }

    public String getMagg() {
        return magg;
    }

    public void setMagg(String magg) {
        this.magg = magg;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
    public int getStt() {
        return Stt;
    }

    public void setStt(int Stt) {
        this.Stt = Stt;
    }
}

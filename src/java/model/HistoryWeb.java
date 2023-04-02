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
public class HistoryWeb {
    private int ID;
    private Account account;
    private String action;
    private String thoigian;

    public HistoryWeb() {
    }

    public HistoryWeb(int ID, Account account, String action, String thoigian) {
        this.ID = ID;
        this.account = account;
        this.action = action;
        this.thoigian = thoigian;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getThoigian() {
        return thoigian;
    }

    public void setThoigian(String thoigian) {
        this.thoigian = thoigian;
    }
    
}

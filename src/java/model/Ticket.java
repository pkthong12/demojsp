/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ThinkPad X1 G4
 */
public class Ticket {
    private int ID;
    private Account account;
    private OrderCart order;
    private String title;
    private String description;
    private int replied;
    private String substance_rep;
    private int ID_rep;
    private String timeopen,timereply;

    public Ticket(int ID, Account account, OrderCart order, String title, String description, int replied, String substance_rep, int ID_rep, String timeopen, String timereply) {
        this.ID = ID;
        this.account = account;
        this.order = order;
        this.title = title;
        this.description = description;
        this.replied = replied;
        this.substance_rep = substance_rep;
        this.ID_rep = ID_rep;
        this.timeopen = timeopen;
        this.timereply = timereply;
    }

    public Ticket() {
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

    public OrderCart getOrder() {
        return order;
    }

    public void setOrder(OrderCart order) {
        this.order = order;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getReplied() {
        return replied;
    }

    public void setReplied(int replied) {
        this.replied = replied;
    }

    public String getSubstance_rep() {
        return substance_rep;
    }

    public void setSubstance_rep(String substance_rep) {
        this.substance_rep = substance_rep;
    }

    public int getID_rep() {
        return ID_rep;
    }

    public void setID_rep(int ID_rep) {
        this.ID_rep = ID_rep;
    }

    public String getTimeopen() {
        return timeopen;
    }

    public void setTimeopen(String timeopen) {
        this.timeopen = timeopen;
    }

    public String getTimereply() {
        return timereply;
    }

    public void setTimereply(String timereply) {
        this.timereply = timereply;
    }
    
    
}

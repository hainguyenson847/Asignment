/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author DELL-PC
 */
public class Order {
    /*
    Oid int IDENTITY(1,1) NOT NULL primary key,
	Date date not null,
	UserName varchar(50) references Accounts(UserName) not null,
	TotalPrice money null,
	status int not null
     */
    private int oid;
    private String date;
    private String username;
    private int totalPrice;
    private int status;

    public Order(int oid, String date, String username, int totalPrice, int status) {
        this.oid = oid;
        this.date = date;
        this.username = username;
        this.totalPrice = (int)(totalPrice / 1000) * 1000;
        this.status = status;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}

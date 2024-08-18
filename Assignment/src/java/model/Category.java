/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL-PC
 */
public class Category {
    /*
    Cid int IDENTITY(1,1) NOT NULL primary key,
	CategoryName nvarchar(50) not null
    */
    private int cid;
    private String categoryName;

    public Category(int cid, String categoryName) {
        this.cid = cid;
        this.categoryName = categoryName;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    
}

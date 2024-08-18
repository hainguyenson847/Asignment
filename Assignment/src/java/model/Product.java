/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL-PC
 */
public class Product {
    /*
    Pid int IDENTITY(1,1) NOT NULL primary key,
	ProductName nvarchar(300) not null,
	Image varchar(MAX) NULL,
	SalePrice money null,
	Description nvarchar(max),
	Quantity int,
	Discount float,
	Sold int,
	ReleaseDate date,
	Cid int references Categories(Cid) on update cascade on delete set null,
	status bit not null default 1
    */
    private int pid;
    private String productName;
    private String image;
    private int salePrice;
    private String description;
    private int quantity;
    private double discount;
    private int sold;
    private String releaseDate;
    private Category category;
    private boolean status;

    public Product(int pid, String productName, String image, int salePrice, String description, int quantity, double discount, int sold, String releaseDate, Category category, boolean status) {
        this.pid = pid;
        this.productName = productName;
        this.image = image;
        this.salePrice = salePrice;
        this.description = description;
        this.quantity = quantity;
        this.discount = discount;
        this.sold = sold;
        this.releaseDate = releaseDate;
        this.category = category;
        this.status = status;
    }
    
    public Product(String productName,  int salePrice, String description, int quantity, double discount, Category category ) {
        
        this.productName = productName;
        this.salePrice = salePrice;
        this.description = description;
        this.quantity = quantity;
        this.discount = discount;
        this.category = category;
    }
    
    public Product(int pid, String productName,  int salePrice, String description, int quantity, double discount, Category category ) {
        this.pid = pid;
        this.productName = productName;
        this.salePrice = salePrice;
        this.description = description;
        this.quantity = quantity;
        this.discount = discount;
        this.category = category;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }


    
    
}

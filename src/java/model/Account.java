/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL-PC
 */
public class Account {
    /*
    Username varchar(50) primary key,
	FullName nvarchar(50) not null,
	Password varchar(50) not null,
	Role int not null,
	Image varchar(MAX) not null,
	Email varchar(50) not null,
	BirthDay date not null,
	Address nvarchar(200) not null,
	Phone nvarchar(50) not null,
	status bit not null
     */
    private String username;
    private String fullname;
    private String password;
    private int role;
    private String image;
    private String email;
    private String birth;
    private String address;
    private String phone;
    private boolean status;

    /*
    INSERT INTO Accounts (Username, FullName, Password, Role, Email)
    */
    
    public Account(String username, String fullname, String password, int role, String email) {
        this.username = username;
        this.fullname = fullname;
        this.password = password;
        this.role = role;
        this.email = email;
    }

    public Account(String username, String fullname, String password, int role, String image, String email, String birth, String address, String phone, boolean status) {
        this.username = username;
        this.fullname = fullname;
        this.password = password;
        this.role = role;
        this.image = image;
        this.email = email;
        this.birth = birth;
        this.address = address;
        this.phone = phone;
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}

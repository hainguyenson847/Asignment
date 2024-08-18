/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.*;
import java.util.*;

/**
 *
 * @author DELL-PC
 */
public class AccountDAO extends DBContext {

    public AccountDAO() {
    }

    public void deleteAccount(String username) {
        String sql = "delete from Accounts\n"
                + "where Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    
    
    public List<Account> getAllAccount(String username) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Accounts where username != ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString("Username"),
                        rs.getString("FullName"),
                        rs.getString("Password"),
                        rs.getInt("Role"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("BirthDay"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        (rs.getInt("status") == 1));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account getAccount(String username) {
        String sql = "select * from Accounts where Username =?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString("Username"),
                        rs.getString("FullName"),
                        rs.getString("Password"),
                        rs.getInt("Role"),
                        rs.getString("Image"),
                        rs.getString("Email"),
                        rs.getString("BirthDay"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        (rs.getInt("status") == 1));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addAccount(Account a) {
        String sql = "INSERT INTO Accounts (Username, FullName, Password, Role, Email) VALUES\n"
                + "(?, ?, ?, ?, ?)";
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, a.getUsername());
            ps.setString(2, a.getFullname());
            ps.setString(3, a.getPassword());
            ps.setInt(4, a.getRole());
            ps.setString(5, a.getEmail());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    

    public void updateProfile(Account a) {
        String sql = "UPDATE [dbo].[Accounts]\n"
                + "   SET [FullName] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[BirthDay] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + " WHERE [Username] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, a.getFullname());
            ps.setString(2, a.getEmail());
            ps.setString(3, a.getBirth());
            ps.setString(4, a.getAddress());
            ps.setString(5, a.getPhone());
            ps.setString(6, a.getUsername());
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void changePassword(String username, String newPassword) {
        String sql = "update Accounts\n"
                + "set Password = ?\n"
                + "where Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
}

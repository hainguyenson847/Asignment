/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author DELL-PC
 */
public class ProductDAO extends DBContext {

    public ProductDAO() {
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[SalePrice] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[Discount] = ?\n"
                + "      ,[Cid] = ?\n"
                + " WHERE Pid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setInt(2, p.getSalePrice());
            ps.setString(3, p.getDescription());
            ps.setInt(4, p.getQuantity());
            ps.setDouble(5, p.getDiscount());
            ps.setInt(6, p.getCategory().getCid());
            ps.setInt(7, p.getPid());
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void addProduct(Product p) {
        String sql = "insert into Products(ProductName, Image, SalePrice, Description, Quantity, Discount, Sold,  Cid, status) values"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setString(2, "img/products/default.jpg");
            ps.setInt(3, p.getSalePrice());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getQuantity());
            ps.setDouble(6, p.getDiscount());
            ps.setInt(7, 0);
            ps.setInt(8, p.getCategory().getCid());
            ps.setInt(9, 1);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(int pid) {
        String sql = "update Products\n"
                + "set status = 0\n"
                + "where Pid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countProduct() {
        String sql = "select count(*) as co from Products where status > 0";
        int c = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("co");
            }
        } catch (Exception e) {
        }
        return c;
    }

    public Category getCategoryById(int id) {
        String sql = "select * from Categories where Cid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getInt("Cid"), rs.getString("categoryName"));
                return c;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public List<Product> getProducts() {
        String sql = "select * from Products where status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByPriceAsc() {
        String sql = "select * from Products where status > 0 order by SalePrice";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByNameAsc() {
        String sql = "select * from Products where status > 0 order by ProductName";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByNameDesc() {
        String sql = "select * from Products where status > 0 order by ProductName desc";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByPriceDesc() {
        String sql = "select * from Products where status > 0 order by SalePrice desc";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByPrice10_50() {
        String sql = "select * from Products where SalePrice between 10000 and 50000 and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByPrice50_100() {
        String sql = "select * from Products where SalePrice between 50000 and 100000 and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByPrice100_500() {
        String sql = "select * from Products where SalePrice between 100000 and 500000 and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByFilter() {
        String sql = "select * from Products where status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductsByCate(int cid) {
        String sql = "select * from Products where Cid = ? and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getSpecificProducts() {
        String sql = "select * from Products where Discount > 0 and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getRelevantProducts(int cid, int pid) {
        String sql = "select * from Products where cid = ? and pid != ? and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getSpecificProducts(String searchKey) {
        String sql = "select * from Products where ProductName like ? and status > 0";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + searchKey + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                list.add(p);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProduct(String id) {
        String sql = "select * from Products where Pid = ? ";
        List<Product> list = new ArrayList<>();
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
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category c = getCategoryById(rs.getInt("Cid"));
                Product p = new Product(
                        rs.getInt("Pid"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getInt("SalePrice"),
                        rs.getString("Description"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Discount"),
                        rs.getInt("Sold"),
                        rs.getString("ReleaseDate"),
                        c,
                        (rs.getInt("status") == 1));
                return p;

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getCategories() {
        String sql = "select * from Categories";
        List<Category> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("cid"), rs.getString("CategoryName"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

}

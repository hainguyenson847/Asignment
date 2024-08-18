/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author DELL-PC
 */
public class OrderDAO extends DBContext {

    public OrderDAO() {
    }
    
    public List<OrderItem> getOrderDetail(int oid) {
        String sql = "select * from OrderDetail where Oid = ? ";
        List<OrderItem> list = new ArrayList<>();
        ProductDAO pd = new ProductDAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Product p = pd.getProduct(rs.getString("pid"));
                OrderItem oi = new OrderItem(p, rs.getInt("Quantity"));
                list.add(oi);
            }
        } catch (Exception e) {
        }
        
        return list;
    }
    
    public int getCurrentMonth() {
        String sql = "select MONTH(GETDATE()) as m ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("m");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getProfit() {
        String sql = "select sum(TotalPrice) as total from [Order] where status = 1";
        int t = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return (int) (rs.getInt("total") / 1000) * 1000;
            }
        } catch (Exception e) {
        }
        return t;
    }
    
    public int getProfitByMonth(int month) {
        String sql = "select SUM(TotalPrice) as totalMonth from [Order] where MONTH(Date) = ? and status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return (int) (rs.getInt("totalMonth") / 1000) * 1000;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countOrder() {
        int c = 0;
        String sql = "select count(*) as co from [Order] where status = 1";
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
    
    public int countProductSold(int month) {
        int c = 0;
        String sql = "select sum(od.Quantity) as quanSold from [Order] o join OrderDetail od on o.Oid = od.Oid where MONTH(Date) = ? and status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("quanSold");
            }
        } catch (Exception e) {
        }
        return c;
    }
    
    public int countOrderByMonth(int month) {
        int c = 0;
        String sql = "select count(*) as numOfO from [Order] where MONTH(Date) = ? and status = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("numOfO");
            }
        } catch (Exception e) {
        }
        return c;
    }

    public Order getOrder(String username) {
        /*
        Oid int IDENTITY(1,1) NOT NULL primary key,
	Date date not null,
	UserName varchar(50) references Accounts(UserName) not null,
	TotalPrice money null,
	status int not null
         */
        String sql = "select * from [Order] where status = 0 and UserName = ? order by Oid desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Order o = new Order(
                        rs.getInt("Oid"),
                        rs.getString("Date"),
                        rs.getString("UserName"),
                        rs.getInt("TotalPrice"),
                        rs.getInt("status"));
                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }
    public Order getOrder(int oid) {
        /*
        Oid int IDENTITY(1,1) NOT NULL primary key,
	Date date not null,
	UserName varchar(50) references Accounts(UserName) not null,
	TotalPrice money null,
	status int not null
         */
        String sql = "select * from [Order] where Oid = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("Oid"),
                        rs.getString("Date"),
                        rs.getString("UserName"),
                        rs.getInt("TotalPrice"),
                        rs.getInt("status"));
                return o;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Order> getAllOrder(String username) {
        String sql = "select * from [Order] where UserName = ? order by status";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("Oid"),
                        rs.getString("Date"),
                        rs.getString("UserName"),
                        rs.getInt("TotalPrice"),
                        rs.getInt("status"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrder() {
        /*
        Oid int IDENTITY(1,1) NOT NULL primary key,
	Date date not null,
	UserName varchar(50) references Accounts(UserName) not null,
	TotalPrice money null,
	status int not null
         */
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] order by status, oid desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("Oid"),
                        rs.getString("Date"),
                        rs.getString("UserName"),
                        rs.getInt("TotalPrice"),
                        rs.getInt("status"));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addOrder(Account a, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {

            // add vao bang Order
            String sql1 = "insert into [Order](Date, UserName, TotalPrice, status) values(?,?,?,?)";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setString(1, date);
            st1.setString(2, a.getUsername());
            st1.setDouble(3, cart.getTotalMoney());
            st1.setInt(4, 0);
            st1.executeUpdate();

            // Lay ra orderID cua Order vua tao
            String sql2 = "select top 1 oid from [order] order by Oid desc";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();

            // add thong tin vao bang OrderDetails
            if (rs.next()) {
                int oID = rs.getInt(1);
                for (Item item : cart.getListItems()) {
                    String sql3 = "insert into OrderDetail values(?, ?, ?)";
                    PreparedStatement st3 = connection.prepareStatement(sql3);
                    st3.setInt(1, oID);
                    st3.setInt(2, item.getProduct().getPid());
                    st3.setInt(3, item.getQuantity());
                    st3.executeUpdate();
                }
            }

            // add vao bang orderDetail
        } catch (Exception e) {
        }
    }

    public void deleteOrder(int oid) {
        String sql = "delete from [Order] where oid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateStatus(int id) {
        String sql = "UPDATE [dbo].[Order] SET [status] = 1 WHERE [OID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
}

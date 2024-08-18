/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

/**
 *
 * @author DELL-PC
 */
public class PayTheBill extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayTheBill</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayTheBill at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.setAttribute("orderss", null);
        String role = request.getParameter("role");
        Account a = (Account) session.getAttribute("account");
        String oid = request.getParameter("oid");
        String view = request.getParameter("view");
        session.setAttribute("v", null);
        if(view != null) {
            session.setAttribute("v", view);
        }
        OrderDAO od = new OrderDAO();
        switch (role) {
            case "view":
                List<OrderItem> list = od.getOrderDetail(Integer.parseInt(oid));
                Order o = od.getOrder(Integer.parseInt(oid));
                session.setAttribute("o", o);
                session.setAttribute("listodd", list);
                request.getRequestDispatcher("vieworderdetail.jsp").forward(request, response);
                break;
            case "delete":
                od.deleteOrder(Integer.parseInt(oid));
                response.sendRedirect("od");
                break;
            default:
                throw new AssertionError();
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //quan${li.product.pid}
        HttpSession session = request.getSession(true);
        
        session.setAttribute("orderss", null);
        Account a = (Account) session.getAttribute("account");
        Cart cart = (Cart) session.getAttribute("cart");
        for (Item item : cart.getListItems()) {
            String iii = "quantity" + item.getProduct().getPid();
            String ii = request.getParameter(iii);
            item.setQuantity(Integer.parseInt(ii));
        }
//        PrintWriter out = response.getWriter();
//        out.print(cart);
        OrderDAO od = new OrderDAO();
        od.addOrder(a, cart);
        session.setAttribute("cart", null);
        Order o = od.getOrder(a.getUsername());
        session.setAttribute("oddt", o);
        session.setAttribute("orderss", "Đặt hàng thành công!");
        response.sendRedirect("cart");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

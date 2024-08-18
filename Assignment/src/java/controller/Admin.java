/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Order;
import model.Product;

/**
 *
 * @author DELL-PC
 */
public class Admin extends HttpServlet {

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
            out.println("<title>Servlet Admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin at " + request.getContextPath() + "</h1>");
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
        ProductDAO pd = new ProductDAO();
        AccountDAO ad = new AccountDAO();
        Account a = (Account)session.getAttribute("account");
        int quanp = pd.countProduct();
        OrderDAO od = new OrderDAO();
        int quano = od.countOrder();
        int profit = od.getProfit();
        int currMonth = od.getCurrentMonth();
        int[] months = new int[currMonth];
        for (int i = 0; i < currMonth; i++) {
            months[i] = i + 1;
        }
        int numO = od.countOrderByMonth(currMonth);
        int proM = od.getProfitByMonth(currMonth);
        int quanSold = od.countProductSold(currMonth);
        String manage = request.getParameter("manage");
        if (manage == null || manage.equals("overall")) {
            session.setAttribute("mag", "overall");
            session.setAttribute("months", months);
            session.setAttribute("currmonth", currMonth);
            session.setAttribute("quansold", quanSold);
            session.setAttribute("numoom", numO);
            session.setAttribute("proM", proM);
            session.setAttribute("quanp", quanp);
            session.setAttribute("quano", quano);
            session.setAttribute("profit", profit);
        } else {
            switch (manage.toLowerCase()) {
                case "account":
                    session.setAttribute("mag", "account");
                    List<Account> list = ad.getAllAccount(a.getUsername());
                    session.setAttribute("allacc", list);
                    break;
                case "order":
                    session.setAttribute("mag", "order");
                    List<Order> listo = od.getAllOrder();
                    session.setAttribute("allord", listo);
                    break;
                case "product":
                    session.setAttribute("mag", "product");
                    List<Product> listp = pd.getProducts();
                    session.setAttribute("allp", listp);
                    break;
                default:
                    throw new AssertionError();
            }
        }

//        PrintWriter out = response.getWriter();
//        out.print(quanp + " " + quano + " " + profit);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
        processRequest(request, response);
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

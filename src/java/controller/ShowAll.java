/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Product;

/**
 *
 * @author DELL-PC
 */
public class ShowAll extends HttpServlet {

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
            out.println("<title>Servlet ShowAll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowAll at " + request.getContextPath() + "</h1>");
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
        String cate = request.getParameter("category");
        List<Product> list;
        if(cate.equals("catfood")) {
            list = pd.getProductsByCate(1);
            session.setAttribute("allcp", "Tất cả thức ăn cho mèo");
        }
        else if(cate.equals("catchain")) {
            list = pd.getProductsByCate(2);
            session.setAttribute("allcp", "Tất cả vòng cổ cho mèo");
        }
        else if(cate.equals("catcage")) {
            list = pd.getProductsByCate(3);
            session.setAttribute("allcp", "Tất cả lồng cho mèo");
        }else  {
            list = pd.getProducts();
            session.setAttribute("allcp", "Tất cả sản phẩm");
        }
        session.setAttribute("listall", list);
        request.getRequestDispatcher("showall.jsp").forward(request, response);
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
        HttpSession session = request.getSession(true);
        ProductDAO pd = new ProductDAO();
        String cate = request.getParameter("category");
        List<Product> list;
        if(cate.equals("catfood")) {
            list = pd.getProductsByCate(1);
            session.setAttribute("allcp", "Tất cả thức ăn cho mèo");
        }
        else if(cate.equals("catchain")) {
            list = pd.getProductsByCate(2);
            session.setAttribute("allcp", "Tất cả vòng cổ cho mèo");
        }
        else if(cate.equals("catcage")) {
            list = pd.getProductsByCate(3);
            session.setAttribute("allcp", "Tất cả lồng cho mèo");
        }else  {
            list = pd.getProducts();
            session.setAttribute("allcp", "Tất cả sản phẩm");
        }
        session.setAttribute("listall", list);
        request.getRequestDispatcher("showall.jsp").forward(request, response);
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

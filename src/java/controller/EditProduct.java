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
import model.Category;
import model.Product;

/**
 *
 * @author DELL-PC
 */
public class EditProduct extends HttpServlet {

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
            out.println("<title>Servlet EditProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProduct at " + request.getContextPath() + "</h1>");
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
        session.setAttribute("errquan", null);
        ProductDAO pd = new ProductDAO();
        List<Category> list = pd.getCategories();
        String pid = request.getParameter("pid");
        Product p = pd.getProduct(pid);
        session.setAttribute("eprod", p);
        session.setAttribute("listcgg", list);
        request.getRequestDispatcher("dashboard/editproduct.jsp").forward(request, response);
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
        session.setAttribute("errquan", null);
        String name = request.getParameter("name");
        String cate = request.getParameter("cate");
        String quantity = request.getParameter("quantity");
        String salePrice = request.getParameter("saleprice");
        String description = request.getParameter("description");
        String discount = request.getParameter("discount");
        String pid = request.getParameter("prodid");
        int pi = Integer.parseInt(pid);
        ProductDAO pd = new ProductDAO();
        Category c = pd.getCategoryById(Integer.parseInt(cate));
        int sale = Integer.parseInt(salePrice);
        double dis = Double.parseDouble(discount) / 100;
        int quan = Integer.parseInt(quantity);
        if (quan < 0) {
            session.setAttribute("errquan", "Số lượng không được phép nhỏ hơn 0");
            response.sendRedirect("dashboard?role=update&pid=" + pi);
        } else {
            Product p = new Product(pi, name, sale, description, quan, dis, c);
            pd.updateProduct(p);
            response.sendRedirect("admin?manage=product");
        }

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

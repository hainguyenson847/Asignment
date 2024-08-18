package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.getSpecificProducts();
        session.setAttribute("list", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);

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
        session.setAttribute("orderss", null);
        ProductDAO pd = new ProductDAO();
        String fil = request.getParameter("ord");
        /*
        <option value="def">Mặc định</option>
                    <option value="asc">Tăng dần</option>
                    <option value="desc">Giảm dần</option>
                    <option value="az">A-Z</option>
                    <option value="za">Z-A</option>
         */
        List<Product> list;
        String t = null;

        switch (fil) {
            case "def":
                list = pd.getProducts();
                break;
            case "asc":
                list = pd.getProductsByPriceAsc();
                t = "a";
                break;
            case "desc":
                list = pd.getProductsByPriceDesc();
                t = "d";
                break;
            case "az":
                list = pd.getProductsByNameAsc();
                t = "az";
                break;
            case "za":
                list = pd.getProductsByNameDesc();
                t = "za";
                break;
            case "10-50":
                list = pd.getProductsByPrice10_50();
                t = "10";
                break;
            case "50-100":
                list = pd.getProductsByPrice50_100();
                t = "50";
                break;
            case "100-500":
                list = pd.getProductsByPrice100_500();
                t = "100";
                break;
            default:
                throw new AssertionError();
        }

        session.setAttribute("t", t);
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

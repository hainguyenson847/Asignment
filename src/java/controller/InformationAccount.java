/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import model.Account;

/**
 *
 * @author DELL-PC
 */
public class InformationAccount extends HttpServlet {

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
            out.println("<title>Servlet InformationAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InformationAccount at " + request.getContextPath() + "</h1>");
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
        session.setAttribute("change", false);
        session.setAttribute("errD", null);
        session.setAttribute("changeprofile", null);
        session.setAttribute("save", null);
        Account acc = (Account) session.getAttribute("account");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        session.setAttribute("change", false);
        session.setAttribute("changeprofile", null);
        session.setAttribute("errD", null);
        session.setAttribute("save", null);
        String edit = request.getParameter("edit");
        if (edit.equalsIgnoreCase("edit")) {
            session.setAttribute("change", true);
            session.setAttribute("save", "0");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else if (edit.equalsIgnoreCase("save")) {
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String birthday = request.getParameter("birthday");
            try {
                long phoneN = Long.parseLong(phone);
                if (!isValidFormat("yyyy-MM-dd", birthday)) {
                    session.setAttribute("errD", "Định dạng ngày sinh là Năm sinh-Tháng sinh-Ngày sinh.");
                    session.setAttribute("change", true);
                } else {
                    Account a = new Account(username, name, null, 0, null, email, birthday, address, phone, true);
                    //String username, String fullname, String password, int role, String image, String email, String birth, String address, String phone, boolean status
                    AccountDAO ad = new AccountDAO();
                    ad.updateProfile(a);
                    session.setAttribute("account", ad.getAccount(username));
                    session.setAttribute("change", false);
                    session.setAttribute("changeprofile", "Lưu thông tin thành công!");
                }
            } catch (Exception e) {
                session.setAttribute("errD", "Số điện thoại phải ở dạng số");
                session.setAttribute("change", true);
            }

            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

    }

    public static boolean isValidFormat(String format, String value) {
        LocalDateTime ldt = null;
        DateTimeFormatter fomatter = DateTimeFormatter.ofPattern(format);

        try {
            ldt = LocalDateTime.parse(value, fomatter);
            String result = ldt.format(fomatter);
            return result.equals(value);
        } catch (DateTimeParseException e) {
            try {
                LocalDate ld = LocalDate.parse(value, fomatter);
                String result = ld.format(fomatter);
                return result.equals(value);
            } catch (DateTimeParseException exp) {
                try {
                    LocalTime lt = LocalTime.parse(value, fomatter);
                    String result = lt.format(fomatter);
                    return result.equals(value);
                } catch (DateTimeParseException e2) {
                    // Debugging purposes
                    //e2.printStackTrace();
                }
            }
        }

        return false;
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

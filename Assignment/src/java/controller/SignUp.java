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
import model.Account;


/**
 *
 * @author DELL-PC
 */
public class SignUp extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet SignUp</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.setAttribute("signupsuccess", null);
        session.setAttribute("signuperr", null);
        session.setAttribute("passerr", null);
        session.setAttribute("signupsuccess", null);
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.setAttribute("signupsuccess", null);
        session.setAttribute("signuperr", null);
        session.setAttribute("passerr", null);
        session.setAttribute("signupsuccess", null);
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String fullName = firstName + " " + lastName;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AccountDAO ad = new AccountDAO();
        Account a = ad.getAccount(username);
        if(a != null) {
            session.setAttribute("signuperr", "*Tên người dùng đã tồn tại!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else if(password.length() < 8) {
            session.setAttribute("passerr", "*Mật khẩu phải có ít nhất 8 ký tự!");
            session.setAttribute("fn", firstName);
            session.setAttribute("ln", lastName);
            session.setAttribute("un", username);
            session.setAttribute("em", email);
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
        else {
            Account newAcc = new Account(username, fullName, password, 1, email);
            ad.addAccount(newAcc);
            session.setAttribute("signupsuccess", "Đăng ký thành công!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

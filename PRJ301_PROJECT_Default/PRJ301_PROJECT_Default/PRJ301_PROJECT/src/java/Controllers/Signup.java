/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Accounts;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Thành Vinh
 */
public class Signup extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String confirm = request.getParameter("confirm"); 
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        
        if (!pass.equals(confirm)) {
            request.setAttribute("error2", "Password incorrect");
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            Accounts acc = d.checkAccount(user);
            if (acc == null) {
                int isAdmin = 0;
                int isActive = 1;
                d.signUp1(user, pass,isAdmin, fname, lname, email,isActive,phonenumber);
                response.sendRedirect("Login");
            } else {
                request.setAttribute("error2", "User already exist");
                request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

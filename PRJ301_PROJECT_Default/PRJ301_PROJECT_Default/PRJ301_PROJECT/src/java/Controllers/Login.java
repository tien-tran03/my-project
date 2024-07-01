package Controllers;

import DAL.DAO;
import Models.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String remem = request.getParameter("remember");
        request.setAttribute("user", username);
        Accounts a = d.loadAccount(username, password);
        Cookie cu = new Cookie("cuser", username);
        Cookie cp = new Cookie("cpass", password);
        Cookie cr = new Cookie("crem", remem);
        if (a == null) {
            request.setAttribute("error1", "Wrong username or password");
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else if (a.getIsActive() == 0) {
            request.setAttribute("error1", "Account didn't active");
            int tag = 1;
            request.setAttribute("tag", 1);
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            if (remem != null) {
                //chon remember
                cu.setMaxAge(60 * 60 * 7 * 24);
                cp.setMaxAge(60 * 60 * 7 * 24);
                cr.setMaxAge(60 * 60 * 7 * 24);

            } else {
                // khong muon luu
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);

            }
            //luu cookie va browser
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);
            session.setAttribute("user", new Accounts(username, password, a.getIsAdmin()));
            session.setAttribute("acc", a);
            response.sendRedirect(request.getContextPath() + "/Home");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

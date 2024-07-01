package Controllers;

import DAL.DAO;
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
public class Active extends HttpServlet {

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
        String user = request.getParameter("u");
        request.setAttribute("user", user);
        request.getRequestDispatcher("Active.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Object o1 = request.getParameter("active");
        String user = request.getParameter("u");
        String pass = request.getParameter("p");
        if (d.checkUserAndPass(user, pass) == true) {
            d.updateActive(1, user);
            request.setAttribute("error1", "Active successfully");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            request.setAttribute("error1", "Active failed");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

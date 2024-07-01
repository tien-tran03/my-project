package Controllers;

import Models.Accounts;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Thành Vinh
 */
public class Logout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Accounts user = (Accounts) session.getAttribute("user");
        if(user==null){
        response.sendRedirect("Login");
        
        }else{
        if (user.getIsAdmin() == 1) {
            response.sendRedirect("Login");
        } else if (user.getIsAdmin() == 0) {
            response.sendRedirect("Home");
        }
        }
        
        
        session.invalidate();
//        session.removeAttribute("acc");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


package Controllers;

import DAL.DAO;
import Models.*;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thành Vinh
 */
public class Cart extends HttpServlet {
    
    DAO d;
    
    public void init() {
        d = new DAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<Categories> listCate = d.loadCategory();
        List<Products> listPro = d.loadProductOderBypIDcID();
        request.setAttribute("products", listPro);
        request.setAttribute("category", listCate);
        HttpSession session = request.getSession();
        Accounts a = (Accounts) session.getAttribute("acc");
        request.getRequestDispatcher("../Views/Cart.jsp").forward(request, response);
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

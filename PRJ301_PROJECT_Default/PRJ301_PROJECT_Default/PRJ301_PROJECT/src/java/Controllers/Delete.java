package Controllers;

import DAL.DAO;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.util.List;

public class Delete extends HttpServlet {

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
        String type = request.getParameter("type");
        String pid = request.getParameter("pid");

        // sua type
        if (type != null) {
            int id = 0;
            //delete

            id = Integer.parseInt(pid);

            if (pid != null) {
                d.DeleteOrderItem(id);
                d.Delete(id);

            }
        }
        List<Products> list = d.loadProduct();
        request.setAttribute("products", list);
        request.getRequestDispatcher("ManagerProduct").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

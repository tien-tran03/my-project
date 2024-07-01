package Controllers;

import DAL.DAO;
import Models.Categories;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Thành Vinh
 */
public class Shopdetail extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String did = request.getParameter("detailpid");
        String cid = request.getParameter("categoryid");
        int detailpid;
        int categorypid;
      
            if(did!=null || cid!=null){
                try {
                     detailpid = Integer.parseInt(request.getParameter("detailpid"));
            categorypid = Integer.parseInt(request.getParameter("categoryid"));
            List<Categories> listCate = d.loadCategory();
            List<Products> listCateID = d.loadProductByCID(categorypid);
            Products pro = d.loadProductByPID(detailpid);
            request.setAttribute("p", pro);
            request.setAttribute("tag", categorypid);
            request.setAttribute("category", listCate);
            request.setAttribute("pcateid", listCateID);
            request.getRequestDispatcher("Views/Shopdetail.jsp").forward(request, response);
                } catch (Exception e) {
                      response.sendRedirect("/PRJ301_PROJECT/Home");
                }
            }
            
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String did = request.getParameter("detailpid");
        String cid = request.getParameter("categoryid");
        int detailpid;
        int categorypid;
        try {
            detailpid = Integer.parseInt(request.getParameter("detailpid"));
            categorypid = Integer.parseInt(request.getParameter("categoryid"));
            List<Categories> listCate = d.loadCategory();
            List<Products> listCateID = d.loadProductByCID(categorypid);
            Products pro = d.loadProductByPID(detailpid);
            request.setAttribute("p", pro);
            request.setAttribute("tag", categorypid);
            request.setAttribute("category", listCate);
            request.setAttribute("pcateid", listCateID);
            request.getRequestDispatcher("Views/Shopdetail.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("/PRJ301_PROJECT/Home");
        }
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

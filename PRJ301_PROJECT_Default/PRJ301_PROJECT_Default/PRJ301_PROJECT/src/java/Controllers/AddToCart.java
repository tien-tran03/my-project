package Controllers;

import DAL.DAO;
import Models.Items;
import Models.Order;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Thành Vinh
 */
public class AddToCart extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pId = request.getParameter("pid");
        Products pro = d.loadProductByPID(Integer.parseInt(pId));
        int quantity = 1;
        int id;
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("cart");// luu tam vao session
        if (obj == null) {// tao moi
            // Tao mat hang
            Items it = new Items();
            it.setProduct(pro);
            it.setProductQuantity(quantity);
            it.setPrice(pro.getSellprice());
            // gio hang co nhieu mat hang
            Map<String, Items> map = new HashMap<>();
            map.put(pId, it);// them mat hang vao ds
            session.setAttribute("cart", map);// luu tam vao session
        } else {
            Map<String, Items> map = (Map<String, Items>) obj;

            Items item = map.get(pId);

            if (item == null) {
                item = new Items();

                int availableQuantity = pro.getStockQuantity();
                if (quantity > availableQuantity) {
                    response.sendRedirect(request.getContextPath() + "/Member/Cart");
                    return;
                } else {
                    item.setProduct(pro);
                    item.setProductQuantity(quantity);
                    item.setPrice(pro.getSellprice());
                    map.put(pId, item);
                }
                item.setProductQuantity(quantity);
                item.setPrice(pro.getSellprice());

                map.put(pId, item);
            } else {
                int availableQuantity = pro.getStockQuantity();
                if (quantity + 1 > availableQuantity) {
                    response.sendRedirect(request.getContextPath() + "/Member/Cart");
                    return;
                } else {
                    item.setProductQuantity(item.getProductQuantity() + 1);
                }
            }
            session.setAttribute("cart", map);// luu tam vao session
        }
        response.sendRedirect(request.getContextPath() + "/Home");
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

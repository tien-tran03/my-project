/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

/**
 *
 * @author Thành Vinh
 */
public class AddToOrder extends HttpServlet {

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
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("cart");

        if (obj != null) {//Check cart xem co san pham ko
            Map<String, Items> map = (Map<String, Items>) obj;

            //tao order de lay orderID
            Order od = new Order();

            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            od.setOrderDate(sdf.format(new Date()));
            Accounts a = (Accounts) session.getAttribute("acc");
            od.setUserID(a);
            d.addOrder(od);
            float total = 0;
            int orderId = d.getOrder();
            session.setAttribute("orderId", orderId);
            //lap cac phan tu trong cart da luu vao map
            for (Entry<String, Items> entry : map.entrySet()) {
                Items item = entry.getValue();
                int quantity;
                int stockquantity;
                if (item.getProduct().getStockQuantity() == 0
                        && item.getProductQuantity() > item.getProduct().getStockQuantity()) {
                    stockquantity = 0;
                    quantity = item.getProduct().getQuantity();
                } else {
                    stockquantity = item.getProduct().getStockQuantity() - item.getProductQuantity();
                    quantity = item.getProductQuantity() + item.getProduct().getQuantity();
                }
                d.updateQuantity(stockquantity, quantity, item.getProduct().getProductID());
                item.setOrder(od);// set orderID vao day
                d.addToOdItem(item, orderId);
                total += item.getProductQuantity() * item.getPrice();
            }
            //update lai gia
            od.setTotalAmount(total);
            d.updateOd(od, orderId);
            session.removeAttribute("cart");
            response.sendRedirect(request.getContextPath() + "/Member/Cart");
        } else {
            // day ve trang chu neu gio hang rong
            response.sendRedirect(request.getContextPath() + "/Home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

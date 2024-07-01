/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Categories;
import Models.Products;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class Edit extends HttpServlet {

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
        List<Products> listPro = d.loadProductOderBypIDcID();
        boolean isValidPid = false;
        if (type != null && type.matches("\\d+")) {
            int typeValue = Integer.parseInt(type);
            if (typeValue == 0) {
                if (pid != null && pid.matches("\\d+")) {
                    for (Products p : listPro) {
                        if (p.getProductID() == Integer.parseInt(pid)) {
                            isValidPid = true;
                            break;
                        }
                    }
                }
                if (isValidPid) {
                    request.setAttribute("update", pid);
                } else {
                    request.setAttribute("mess1", "pid invalid");
                }
            } else {
                request.setAttribute("mess2", "type invalid");
            }
        } else {
            request.setAttribute("mess3", "url invalid");
        }

        List<Categories> listCate = d.loadCategory();
        request.setAttribute("dao", d);
        request.setAttribute("products", listPro);
        request.setAttribute("category", listCate);
        request.getRequestDispatcher("../Views/Edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Object o1 = request.getParameter("save");
        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");
        String category = "";
        float price = Float.parseFloat(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        int categoryID = Integer.parseInt(request.getParameter("category"));
        for (Categories ca : d.loadCategory()) {
            if (categoryID == ca.getCategoryID()) {
                category = ca.getCategoryName();
            }
        }
       
        String imageURL = request.getParameter("imageURL");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float sellprice = Float.parseFloat(request.getParameter("sellprice"));
        if (o1 != null) {
            d.Update(productID, productName, category, price, stockQuantity, categoryID, 0, imageURL, quantity, sellprice);
        }
        response.sendRedirect("/PRJ301_PROJECT/Admin/ManagerProduct");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

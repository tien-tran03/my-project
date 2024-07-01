package Controllers;

import DAL.DAO;
import Models.Categories;
import Models.Products;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;
import java.util.List;

public class Add extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html ;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Object o1 = request.getParameter("add");
        int productID = Integer.parseInt(request.getParameter("productID"));
        request.setAttribute("id", productID);
        String productName = request.getParameter("productName");
        String category = "";
        String price = request.getParameter("price");
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
        int categoryID = Integer.parseInt(request.getParameter("category"));
        for (Categories ca : d.loadCategory()) {
            if (categoryID == ca.getCategoryID()) {
                category = ca.getCategoryName();
            }
        } 
        String imageURL = request.getParameter("imageURL");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String sellprice = request.getParameter("sellprice");
        if (o1 != null) {
            d.Insert(productID, productName, category, price, stockQuantity, categoryID, imageURL, quantity, sellprice);
        }
        response.sendRedirect("/PRJ301_PROJECT/Admin/ManagerProduct");
    }

    private boolean checkID(int id) {
        List<Products> listPro = d.loadProduct();
        for (Products product : listPro) {
            if (product.getProductID() == id) {
                return true;
            }
        }
        return false;
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

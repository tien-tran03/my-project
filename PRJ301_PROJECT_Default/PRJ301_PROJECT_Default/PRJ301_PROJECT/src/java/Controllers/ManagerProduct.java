package Controllers;

import DAL.DAO;
import Models.Accounts;
import Models.Categories;
import Models.Products;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class ManagerProduct extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    int[] nrppArr = {1, 2, 3, 5, 10, 15, 20, 50, 100, 200, 500, 1000, 2000};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index;
        try {
            index = Integer.parseInt(indexPage);
            int count = d.getTotalProduct(); // lay ra tat ca Student co trong data
            int endPage = count / 15; //sau do tinh trang cuoi cung 
            if (count % 15 != 0) {
                endPage++; // neu trang cuoi khong du 3 sinh vien thi van se tao 1 trang moi
            }
            List<Products> list = d.pagingProducts(index);
            request.setAttribute("products", list);
            List<Products> listPro = d.loadProduct();
            request.setAttribute("pro", listPro);
            request.setAttribute("endPage", endPage);
            request.setAttribute("index", index);
            String tableName = "ProductsHE172281";
            List<Categories> listCate = d.loadCategory();
            d.getAllColumnName(tableName);
            request.setAttribute("dao", d);
            request.setAttribute("category", listCate);
            request.setAttribute("columnName", d.getColumnName());
            request.getRequestDispatcher("../Views/ManagerProduct.jsp").forward(request, response);
        } catch (Exception e){
            response.sendRedirect(request.getContextPath() + "/Admin/ManagerProduct?index=1");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        int totalPage = Integer.parseInt(request.getParameter("totalPage"));
        if (request.getParameter("btnHome") != null) {
            index = 0;
        }
        if (request.getParameter("btnPre") != null) {
            index -= 1;
        }
        if (request.getParameter("btnNext") != null) {
            index += 1;
        }
        if (request.getParameter("btnEnd") != null) {
            index = totalPage;
        }
        for (int i = 0; i < totalPage; i++) {
            if (request.getParameter("btn" + i) != null) {
                index = i;
            }
        }
        int nrpp = Integer.parseInt(request.getParameter("nrpp"));
        request.setAttribute("nrpp", nrpp);
        request.setAttribute("index", index);
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

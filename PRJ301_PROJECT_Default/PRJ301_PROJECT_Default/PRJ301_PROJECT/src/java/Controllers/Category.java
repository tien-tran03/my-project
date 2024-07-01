/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
public class Category extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cateid = request.getParameter("cid");
        int cid = 0;
        try {
            cid = Integer.parseInt(cateid);
            List<Products> listPro = d.loadProductByCID(cid);
            List<Products> list = d.loadProductOderBypIDcID();
            List<Categories> listCate = d.loadCategory();
            request.setAttribute("products", listPro);
            if (cid == 0) {
                request.setAttribute("products", list);
            }
            request.setAttribute("tag", cid);
            request.setAttribute("category", listCate);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("Category?cid=" + cid);
        }

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

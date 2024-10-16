/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.product;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.CategoryDao;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.ProductDao;
import phuc.dev.data.model.Category;
import phuc.dev.data.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CreateProductServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();
        
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = new Product(name, description, thumbnail, price, quantity, categoryId);
        productDao.insert(product);
        
        response.sendRedirect("IndexProductServlet");
    }
}

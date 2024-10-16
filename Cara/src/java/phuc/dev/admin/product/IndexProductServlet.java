/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.product;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.ProductDao;
import phuc.dev.data.dao.DatabaseDao;
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
public class IndexProductServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao product = DatabaseDao.getInstance().getProductDao();
        List<Product> productList = product.findAll();

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("admin/product/index.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

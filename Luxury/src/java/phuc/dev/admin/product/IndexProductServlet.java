/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.ProductDao;
import phuc.dev.data.model.Product;



/**
 *
 * @author Admin
 */
public class IndexProductServlet  extends BaseAdminServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao productDao =DatabaseDao.getInstance().getProductDao();// lay ra toan bo product
        List<Product> productList = productDao.findAll();
        
        request.setAttribute("productList",productList);
        request.getRequestDispatcher("admin/product/index.jsp").include(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
    }

    

}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev;

import phuc.dev.data.dao.Database;
import phuc.dev.data.dao.ProductDao;
import phuc.dev.data.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SearchServlet extends BaseServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        ProductDao productDao = Database.getInstance().getProductDao();
        List<Product> productList = productDao.findByName(keyword);
        
        request.setAttribute("keyword", keyword);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("search.jsp").include(request, response);
        }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

}
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.category;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.CategoryDao;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class IndexCategoryServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDao category = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = category.findAll();

        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/category/index.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

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

/**
 *
 * @author Admin
 */
public class EditCategoryServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        Category category = categoryDao.find(categoryId);
        
        request.setAttribute("category", category);
        request.getRequestDispatcher("admin/category/edit.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        Category category = categoryDao.find(categoryId);
        
        String name = request.getParameter("name");
        String thumbnail = request.getParameter("thumbnail");
        category.setName(name);
        category.setThumbnail(thumbnail);
        
        categoryDao.update(category);
        response.sendRedirect("IndexCategoryServlet");
    }
}

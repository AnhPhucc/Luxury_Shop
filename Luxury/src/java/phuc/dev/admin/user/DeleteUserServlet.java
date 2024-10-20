/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.user;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class DeleteUserServlet extends BaseAdminServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDao userDao = DatabaseDao.getInstance().getUserDao();
        userDao.delete(userId);
        
        response.sendRedirect("IndexUserServlet");
}
}
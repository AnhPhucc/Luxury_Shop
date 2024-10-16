/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.order;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.CategoryDao;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.OrderDao;
import phuc.dev.data.model.Category;
import phuc.dev.data.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class EditOrderServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        Order order = orderDao.find(orderId);
        
        request.setAttribute("order", order);
        request.getRequestDispatcher("admin/order/edit.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        Order order = orderDao.find(orderId);
        
        String status = request.getParameter("status");
        order.setStatus(status);
        
        orderDao.update(order);
        response.sendRedirect("IndexOrderServlet");
    }
}

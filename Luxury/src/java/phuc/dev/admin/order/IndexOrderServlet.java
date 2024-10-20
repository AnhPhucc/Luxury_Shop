/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev.admin.order;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.OrderDao;
import phuc.dev.data.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class IndexOrderServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        List<Order> orderList = orderDao.findAll();

        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("admin/order/index.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

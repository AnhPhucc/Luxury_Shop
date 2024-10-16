/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package phuc.dev;

import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.OrderDao;
import phuc.dev.data.dao.OrderItemDao;
import phuc.dev.data.model.Order;
import phuc.dev.data.model.OrderItem;
import phuc.dev.data.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import phuc.dev.util.StringHelper;

/**
 *
 * @author Admin
 */
public class CheckoutServlet extends BaseServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("LoginServlet");
        } else {
            ProcessCheckout(request, user);
            response.sendRedirect("CartServlet");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

   private void ProcessCheckout(HttpServletRequest request, User user) throws ServletException {
    OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
    String code = StringHelper.randomString(10);
    Order order = new Order(code, "pending", user.getId());
    
    System.out.println("Inserting order with code: " + code);
    orderDao.insert(order);
    
    // Kiểm tra nếu quá trình insert thành công
    order = orderDao.findByCode(code);
    if (order == null) {
        throw new ServletException("Không tìm thấy thứ tự sau khi chèn");
    }
    
    System.out.println("Order found with ID: " + order.getId());
    
    HttpSession session = request.getSession();
    List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
    
    OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();
    if(cart != null){
        for(OrderItem orderItem : cart){
            orderItem.setOrderId(order.getId());
            orderItemDao.insert(orderItem);
        }
    }
    
    session.setAttribute("message", "Checkout Success");
    session.removeAttribute("cart");
}
}
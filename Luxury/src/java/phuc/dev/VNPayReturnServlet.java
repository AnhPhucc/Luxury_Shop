package phuc.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VNPayReturnServlet")
public class VNPayReturnServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý phản hồi từ VNPay
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        // Kiểm tra và xác thực chữ ký nếu cần
        // Có thể lấy thêm các tham số khác từ request để kiểm tra
        response.getWriter().write("Payment response received."); // Ghi phản hồi
    }
}

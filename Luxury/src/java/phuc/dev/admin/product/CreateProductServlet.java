package phuc.dev.admin.product;

import phuc.dev.admin.BaseAdminServlet;
import phuc.dev.data.dao.CategoryDao;
import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.ProductDao;
import phuc.dev.data.model.Category;
import phuc.dev.data.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CreateProductServlet extends BaseAdminServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();

        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");
        String categoryIdStr = request.getParameter("categoryId");

        // Kiểm tra các thông tin đầu vào
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Tên sản phẩm không được để trống.");
            doGet(request, response);
            return;
        }

        if (description == null || description.trim().isEmpty()) {
            request.setAttribute("error", "Mô tả sản phẩm không được để trống.");
            doGet(request, response);
            return;
        }

        if (thumbnail == null || thumbnail.trim().isEmpty()) {
            request.setAttribute("error", "Thumbnail không được để trống.");
            doGet(request, response);
            return;
        }

        double price;
        int quantity;
        int categoryId;

        try {
            price = Double.parseDouble(priceStr);
            quantity = Integer.parseInt(quantityStr);
            categoryId = Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Giá hoặc số lượng không hợp lệ.");
            doGet(request, response);
            return;
        }

        // Tạo đối tượng sản phẩm và thêm vào cơ sở dữ liệu
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = new Product(name, description, thumbnail, price, quantity, categoryId);
        productDao.insert(product);

        response.sendRedirect("IndexProductServlet");
    }
}

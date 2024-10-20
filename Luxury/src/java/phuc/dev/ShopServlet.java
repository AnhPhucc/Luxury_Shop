package phuc.dev;

import phuc.dev.data.dao.DatabaseDao;
import phuc.dev.data.dao.ProductDao;
import phuc.dev.data.model.Product;
import phuc.dev.util.Constants;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Servlet to handle product listing and pagination.
 */
public class ShopServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        
        // Initialize the ProductDao to interact with the database
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        
        // Retrieve all products from the database
        List<Product> productList = productDao.findAll();

        // Initialize pagination variables
        int page = 1; // Default page number
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // Default to the first page if there's a parsing error
            }
        }

        int total = productList.size();
        int numberPage = (int) Math.ceil((double) total / Constants.PER_PAGE); // Calculate total pages

        // Fetch products for the current page
        productList = productDao.getProducts((page - 1) * Constants.PER_PAGE, Constants.PER_PAGE);

        // Set attributes for the JSP
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("productList", productList);

        // Forward to the shop.jsp page for rendering
        request.getRequestDispatcher("shop.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement POST request handling if necessary
    }
}

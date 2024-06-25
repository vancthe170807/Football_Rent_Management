package controller.common;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

@WebServlet(name="ProductInfoServlet", urlPatterns={"/productinfo"})
public class ProductInfoServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ProductInfoServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String productCode = request.getParameter("ProductCode");
        LOGGER.log(Level.INFO, "ProductCode parameter: {0}", productCode);

        if (productCode == null || productCode.trim().isEmpty()) {
            request.setAttribute("error", "Product code is missing");
            request.getRequestDispatcher("ProductInfo.jsp").forward(request, response);
            return;
        }

        Product product = null;

        try {
            ProductDAO productDAO = new ProductDAO();
            product = productDAO.getInfomationProductDetail(productCode);
            LOGGER.log(Level.INFO, "Fetched product from DB: {0}", product);
            if (product != null) {
                session.setAttribute("product", product);
            } else {
                request.setAttribute("error", "Product not found");
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving product information", ex);
            request.setAttribute("error", "Error retrieving product information");
        }

        request.setAttribute("product", product);
        request.getRequestDispatcher("ProductInfo.jsp").forward(request, response);
    }
}

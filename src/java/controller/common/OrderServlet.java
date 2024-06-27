package controller.common;

import dal.OrdersDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrdersDAO ordersDAO;

    @Override
    public void init() {
        ordersDAO = new OrdersDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("checkOverlap".equals(action)) {
                checkOverlap(request, response);
            } else if ("createBooking".equals(action)) {
                createOrder(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (Exception ex) {
            throw new ServletException(ex); // Ensure exceptions are properly handled
        }
    }

    private void checkOverlap(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, Exception {
        String fieldCode = request.getParameter("fieldCode");
        String bookingDateStr = request.getParameter("bookingDate");
        String startTimeStr = request.getParameter("startTime");
        String endTimeStr = request.getParameter("endTime");

        // Parsing the LocalDateTime values from request parameters
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime bookingDate = LocalDateTime.parse(bookingDateStr, formatter);
        LocalDateTime startTime = LocalDateTime.parse(startTimeStr, formatter);
        LocalDateTime endTime = LocalDateTime.parse(endTimeStr, formatter);

        boolean overlap = ordersDAO.isBookingValid(fieldCode, bookingDate, startTime, endTime);

        // Constructing the JSON response manually
        String jsonResponse = "{ \"overlap\": " + overlap + " }";

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, Exception {
        String fieldCode = request.getParameter("fieldCode");
        String customerPhone = ""; // Add logic to get customer phone
        LocalDateTime bookingDate = LocalDateTime.parse(request.getParameter("bookingDate"));
        LocalDateTime startTime = LocalDateTime.parse(request.getParameter("startTime"));
        LocalDateTime endTime = LocalDateTime.parse(request.getParameter("endTime"));

        boolean inserted = ordersDAO.insertOrderbyCustomer(customerPhone, fieldCode, bookingDate, startTime, endTime);
        if (inserted) {
            response.setStatus(HttpServletResponse.SC_OK); // Success
            response.sendRedirect("Orders.jsp"); // Redirect to orders page
        } else {
            response.sendError(HttpServletResponse.SC_CONFLICT, "Order could not be created due to a conflict.");
        }
    }
}

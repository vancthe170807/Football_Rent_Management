package controller.common;

import dal.BookingFieldDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import model.BookingField;

@WebServlet("/bookingfield")
public class BookingFieldServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingFieldDAO bookingDAO;

    public void init() {
        bookingDAO = new BookingDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("checkOverlap".equals(action)) {
                checkOverlap(request, response);
            } else if ("createBooking".equals(action)) {
                createBooking(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void checkOverlap(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String fieldCode = request.getParameter("fieldCode");
        String bookingDate = request.getParameter("bookingDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        List<Booking> overlappingBookings = bookingDAO.checkOverlap(fieldCode, bookingDate, startTime, endTime);
        boolean overlap = !overlappingBookings.isEmpty();

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("overlap", overlap);

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }

    private void createBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String fieldCode = request.getParameter("fieldCode");
        String bookingDate = request.getParameter("bookingDate");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String userId = request.getParameter("userId");

        Booking newBooking = new Booking();
        newBooking.setFieldCode(fieldCode);
        newBooking.setBookingDate(bookingDate);
        newBooking.setStartTime(startTime);
        newBooking.setEndTime(endTime);
        newBooking.setUserId(userId);

        bookingDAO.createBooking(newBooking);
        response.sendRedirect("bookingSuccess.jsp");
    }
}

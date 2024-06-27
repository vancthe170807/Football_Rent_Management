package dal;

import java.time.LocalDateTime;
import java.sql.*;
import model.Orders;

public class OrdersDAO extends DBContext {

    // Method to check if a booking is valid (not overlapping with existing bookings)
    public boolean isBookingValid(String fieldCode, LocalDateTime bookingDate, LocalDateTime startTime, LocalDateTime endTime) throws Exception {
        String query = "SELECT COUNT(*) FROM Orders WHERE FieldCode = ? AND BookingDate = ? AND " +
                       "(StartTime < ? AND EndTime > ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, fieldCode);
            pstmt.setTimestamp(2, Timestamp.valueOf(bookingDate));
            pstmt.setTimestamp(3, Timestamp.valueOf(endTime));
            pstmt.setTimestamp(4, Timestamp.valueOf(startTime));
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) == 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to insert a new order
    public boolean insertOrderbyCustomer(String CustomerPhone, String FieldCode, LocalDateTime BookingDate, LocalDateTime StartTime, LocalDateTime EndTime) throws Exception {
        // Set the current date and time as the booking date
        Orders order = new Orders();
        order.setBookingDate(LocalDateTime.now());

        if (!isBookingValid(order.getFieldCode(), order.getBookingDate(), order.getStartTime(), order.getEndTime())) {
            return false;
        }

        String query = "INSERT INTO Orders (CustomerPhone, FieldCode, BookingDate, StartTime, EndTime) " +
                       "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, order.getCustomerPhone());
            pstmt.setString(2, order.getFieldCode());
            pstmt.setTimestamp(3, Timestamp.valueOf(order.getBookingDate()));
            pstmt.setTimestamp(4, Timestamp.valueOf(order.getStartTime()));
            pstmt.setTimestamp(5, Timestamp.valueOf(order.getEndTime()));

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    order.setOrderID(generatedKeys.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to insert a new order
    public boolean insertOrderbyEmployee(String CustomerPhone, String EmployeePhone, String FieldCode, LocalDateTime BookingDate, LocalDateTime StartTime, LocalDateTime EndTime) throws Exception {
        // Set the current date and time as the booking date
        Orders order = new Orders();
        order.setBookingDate(LocalDateTime.now());

        if (!isBookingValid(order.getFieldCode(), order.getBookingDate(), order.getStartTime(), order.getEndTime())) {
            return false;
        }

        String query = "INSERT INTO Orders (CustomerPhone, EmployeePhone, FieldCode, BookingDate, StartTime, EndTime, Status) " +
                       "VALUES (?, ?, ?, ?, ?, ?, 'Using')";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, order.getCustomerPhone());
            pstmt.setString(2, order.getEmployeePhone());
            pstmt.setString(3, order.getFieldCode());
            pstmt.setTimestamp(4, Timestamp.valueOf(order.getBookingDate()));
            pstmt.setTimestamp(5, Timestamp.valueOf(order.getStartTime()));
            pstmt.setTimestamp(6, Timestamp.valueOf(order.getEndTime()));

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    order.setOrderID(generatedKeys.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Cập nhật trạng thái đơn đặt thực hiện bởi Nhân viên (Pending -> Using, Pending -> Cancel)
    public boolean updateOrderStatusByEmployee(int orderID, String employeePhone, String newStatus) throws Exception {
        String query = "UPDATE Orders SET Status = ?, EmployeePhone = ? WHERE OrderID = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, newStatus);
            pstmt.setString(2, employeePhone);
            pstmt.setInt(3, orderID);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật trạng thái đơn đặt thực hiện bởi Khách hàng (Pending -> Cancel)
    public boolean updateOrderStatusByCustomer(int orderID, String newStatus) throws Exception {
        String query = "UPDATE Orders SET Status = ? WHERE OrderID = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            pstmt.setString(1, newStatus);
            pstmt.setInt(2, orderID);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Hiện danh sách đặt sân
    
    // Other methods for OrderDAO (update, delete, find, etc.) can be added here
}

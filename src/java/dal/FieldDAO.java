package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Field;

public class FieldDAO extends DBContext {

    // Xem toàn bộ sân
    public List<Field> getAllFields() throws Exception {
        List<Field> fields = new ArrayList<>();
        String query = "SELECT FieldCode, FieldName, FieldType, RentPrice, Image FROM FieldInfo ORDER BY FieldType ASC";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Field field = new Field();
                field.setFieldCode(rs.getString("FieldCode"));
                field.setFieldName(rs.getString("FieldName"));
                field.setFieldType(rs.getInt("FieldType"));
                field.setRentPrice(rs.getInt("RentPrice"));
                field.setImage(rs.getString("Image"));
                fields.add(field);
            }
        } catch (SQLException e) {
            throw new Exception("Error while fetching all fields", e);
        }
        return fields;
    }

    // Tìm kiếm sân
    public List<Field> searchFields(String keyword) throws Exception {
        List<Field> fields = new ArrayList<>();
        String query = "SELECT FieldCode, FieldName, FieldType, RentPrice, Image FROM FieldInfo " +
                       "WHERE FieldCode LIKE ? OR FieldName LIKE ? OR FieldType LIKE ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Field field = new Field();
                    field.setFieldCode(rs.getString("FieldCode"));
                    field.setFieldName(rs.getString("FieldName"));
                    field.setFieldType(rs.getInt("FieldType"));
                    field.setRentPrice(rs.getInt("RentPrice"));
                    field.setImage(rs.getString("Image"));
                    fields.add(field);
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while searching fields", e);
        }
        return fields;
    }

    // Xoá sân
    public boolean deleteField(String fieldCode) throws SQLException, Exception {
        String query = "DELETE FROM FieldInfo WHERE FieldCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, fieldCode);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            throw new Exception("Error while deleting field", e);
        }
    }

    // Update thông tin sân
    public boolean updateFieldInfo(String fieldName, int rentPrice, String fieldCode) throws SQLException, Exception {
        String query = "UPDATE FieldInfo SET FieldName = ?, RentPrice = ? WHERE FieldCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, fieldName);
            ps.setInt(2, rentPrice);
            ps.setString(3, fieldCode);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new Exception("Error while updating field information", e);
        }
    }

    // Mô tả chi tiết sân
    public Field getInfomationFieldDetail(String fieldCode) throws Exception {
        Field field = null;
        String query = "SELECT FieldCode, FieldName, FieldType, RentPrice, Image, Description FROM FieldInfo WHERE FieldCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, fieldCode);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    field = new Field();
                    field.setFieldCode(rs.getString("FieldCode"));
                    field.setFieldName(rs.getString("FieldName"));
                    field.setFieldType(rs.getInt("FieldType"));
                    field.setRentPrice(rs.getInt("RentPrice"));
                    field.setImage(rs.getString("Image"));
                    field.setDescription(rs.getString("Description"));
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while fetching field details", e);
        }
        return field;
    }
}

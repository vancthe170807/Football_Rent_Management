package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Equipment;

public class EquipmentDAO extends DBContext {

    // Xem toàn bộ danh sách dụng cụ cho thuê
    public List<Equipment> getAllEquipments() throws Exception {
        List<Equipment> equipments = new ArrayList<>();
        String query = "SELECT EquipmentCode, EquipmentName, RentPrice, image, Quantities FROM EquipmentInfo";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Equipment equip = new Equipment();
                equip.setEquipmentCode(rs.getString("EquipmentCode"));
                equip.setEquipmentName(rs.getString("EquipmentName"));
                equip.setRentPrice(rs.getInt("RentPrice"));
                equip.setImage(rs.getString("image"));
                equip.setQuantities(rs.getInt("Quantities"));
                equipments.add(equip);
            }
        } catch (SQLException e) {
            throw new Exception("Error while fetching all fields", e);
        }
        return equipments;
    }

    // Tìm kiếm dụng cụ cho thuê
    public List<Equipment> searchEquipments(String keyword) throws Exception {
        List<Equipment> equipments = new ArrayList<>();
        String query = "SELECT EquipmentCode, EquipmentName, RentPrice, Description, image, Quantities FROM EquipmentInfo " +
                       "WHERE EquipmentCode LIKE ? OR EquipmentName LIKE ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Equipment equip = new Equipment();
                    equip.setEquipmentCode(rs.getString("EquipmentCode"));
                    equip.setEquipmentName(rs.getString("EquipmentName"));
                    equip.setRentPrice(rs.getInt("RentPrice"));
                    equip.setDescription(rs.getString("Description"));
                    equip.setImage(rs.getString("image"));
                    equipments.add(equip);
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while searching fields", e);
        }
        return equipments;
    }

    // Xoá dụng cụ
    public boolean deleteEquipment(String equipmentCode) throws SQLException, Exception {
        String query = "DELETE FROM EquipmentInfo WHERE EquipmentCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, equipmentCode);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            throw new Exception("Error while deleting field", e);
        }
    }

    // Update thông tin sân
    public boolean updateEquipmentInfo(String equipmentName, int rentPrice, String equipmentCode, String Description) throws SQLException, Exception {
        String query = "UPDATE EquipmentInfo SET EquipmentName = ?, RentPrice = ?, Description = ? WHERE EquipmentCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, equipmentName);
            ps.setInt(2, rentPrice);
            ps.setString(3, Description);
            ps.setString(4, equipmentCode);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new Exception("Error while updating field information", e);
        }
    }

    // Mô tả chi tiết dụng cụ cho thuê
    public Equipment getInfomationEquipmentDetail(String equipmentCode) throws Exception {
        Equipment equip = null;
        String query = "SELECT EquipmentCode, EquipmentName, RentPrice, Description, image, Quantities FROM EquipmentInfo WHERE EquipmentCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, equipmentCode);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    equip = new Equipment();
                    equip.setEquipmentCode(rs.getString("EquipmentCode"));
                    equip.setEquipmentName(rs.getString("EquipmentName"));
                    equip.setRentPrice(rs.getInt("RentPrice"));
                    equip.setDescription(rs.getString("Description"));
                    equip.setImage(rs.getString("image"));
                    equip.setQuantities(rs.getInt("Quantities"));
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while fetching field details", e);
        }
        return equip;
    }
}

package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends DBContext {

    // Xem toàn bộ danh sách dụng cụ cho thuê
    public List<Product> getAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "SELECT image, ProductCode, ProductName, Quantities, ProductPrice FROM Product";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setImage(rs.getString("image"));
                product.setProductCode(rs.getString("ProductCode"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductPrice(rs.getInt("ProductPrice"));
                product.setQuantities(rs.getInt("Quantities"));
                products.add(product);
            }
        } catch (SQLException e) {
            throw new Exception("Error while fetching all fields", e);
        }
        return products;
    }

    // Tìm kiếm dụng cụ cho thuê
    public List<Product> searchProducts(String keyword) throws Exception {
        List<Product> products = new ArrayList<>();
        String query = "SELECT image, ProductCode, ProductName, Quantities, ProductPrice FROM Product " +
                       "WHERE ProductCode LIKE ? OR ProductName LIKE ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setImage(rs.getString("image"));
                    product.setProductCode(rs.getString("ProductCode"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setQuantities(rs.getInt("Quantities"));
                    product.setProductPrice(rs.getInt("RentPrice"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while searching fields", e);
        }
        return products;
    }

    // Xoá dụng cụ
    public boolean deleteProduct(String productCode) throws SQLException, Exception {
        String query = "DELETE FROM Product WHERE ProductCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, productCode);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            throw new Exception("Error while deleting product", e);
        }
    }

    // Update thông tin sân
    public boolean updateProductInfo(String productName, int productPrice, String productCode, int Quantities) throws SQLException, Exception {
        String query = "UPDATE ProductInfo SET ProductName = ?, RentPrice = ?, Description = ? WHERE ProductCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, productName);
            ps.setInt(2, productPrice);
            ps.setInt(3, Quantities);
            ps.setString(4, productCode);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new Exception("Error while updating product information", e);
        }
    }

    // Mô tả chi tiết dụng cụ cho thuê
    public Product getInfomationProductDetail(String productCode) throws Exception {
        Product product = null;
        String query = "SELECT image, ProductCode, ProductName, Quantities, ProductPrice FROM Product WHERE ProductCode = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, productCode);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setImage(rs.getString("image"));
                    product.setProductCode(rs.getString("ProductCode"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setQuantities(rs.getInt("Quantities"));
                    product.setProductPrice(rs.getInt("ProductPrice"));
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error while fetching field details", e);
        }
        return product;
    }
}

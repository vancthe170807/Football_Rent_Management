package dal;

import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterDAO {

    public boolean register(String fullname, String phone, String email, String password) throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            DBContext dbContext = new DBContext();
            conn = dbContext.getConnection();
            String query = "INSERT INTO [User] (fullname, phone, email, password) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, password);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            throw e;
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
}

package dal;

import model.Account;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public List<Account> getAllUsers() throws Exception {
        List<Account> users = new ArrayList<>();
        String query = "SELECT fullname, phone, email, rolecode FROM [User] order by rolecode asc, fullname asc";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Account account = new Account();
                account.setFullname(rs.getString("fullname"));
                account.setPhone(rs.getString("phone"));
                account.setEmail(rs.getString("email"));
                account.setRolecode(rs.getString("rolecode"));
                users.add(account);
            }
        }
        return users;
    }

    public List<Account> searchUsers(String keyword) throws Exception {
        List<Account> users = new ArrayList<>();
        String query = "SELECT fullname, phone, email, rolecode FROM [User] " +
                       "WHERE fullname LIKE ? OR phone LIKE ? OR email LIKE ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            // Set các tham số cho truy vấn
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);

            // Thực hiện truy vấn
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Account account = new Account();
                    account.setFullname(rs.getString("fullname"));
                    account.setPhone(rs.getString("phone"));
                    account.setEmail(rs.getString("email"));
                    account.setRolecode(rs.getString("rolecode"));
                    users.add(account);
                }
            }
        }
        return users;
    }

    public boolean deleteUser(String phone) throws SQLException, Exception {
        String query = "DELETE FROM [User] WHERE phone = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, phone);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        }
    }

    public boolean updateUserRole(String phone, String rolecode) throws SQLException, Exception {
        String query = "UPDATE [User] SET rolecode = ? WHERE phone = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, rolecode);
            ps.setString(2, phone);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }

    public Account authenticateUser(String phone, String password) throws Exception {
        String query = "SELECT fullname, phone, email, rolecode FROM [User] WHERE phone = ? AND password = ?";
        Account account = null;

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, phone);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    account = new Account();
                    account.setFullname(rs.getString("fullname"));
                    account.setPhone(rs.getString("phone"));
                    account.setEmail(rs.getString("email"));
                    account.setRolecode(rs.getString("rolecode"));
                }
            }
        }
        return account;
    }
    
    public boolean updatePassword(String phone, String newPassword) throws SQLException, Exception {
        String query = "UPDATE [User] SET password = ? WHERE phone = ?";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, newPassword);
            ps.setString(2, phone);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        }
    }
    
//    private String hashPassword(String password) throws NoSuchAlgorithmException {
//        MessageDigest md = MessageDigest.getInstance("SHA-256");
//        byte[] hash = md.digest(password.getBytes());
//        StringBuilder hexString = new StringBuilder();
//        for (byte b : hash) {
//            String hex = Integer.toHexString(0xff & b);
//            if (hex.length() == 1) hexString.append('0');
//            hexString.append(hex);
//        }
//        return hexString.toString();
//    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author chuth
 */
public class LoginDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public Account checkLogin(String phone, String password) {
        try {
            String query = "select phone, [password] from [User] where phone = ? and [password] = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()) {
                Account a = new Account(rs.getString(1), rs.getString(2));
                return a;
            }
            
            
        } catch (Exception e) {
        }
        return null;
    }
}

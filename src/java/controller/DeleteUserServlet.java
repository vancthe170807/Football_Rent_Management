package controller;

import dal.UserDAO;
import dal.AuthenticateDAO;
import model.Account;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/deleteuserservlet"})
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        Account adminUser = (Account) session.getAttribute("user");
        String adminPassword = request.getParameter("adminPassword");
        String phone = request.getParameter("phone");

        if (!"ADM".equals(adminUser.getRolecode())) {
            response.sendRedirect("Login.jsp");
            return;
        }

        AuthenticateDAO authDAO = new AuthenticateDAO();
        try {
            if (authDAO.verifyAdminPassword(adminUser.getPhone(), adminPassword)) {
                UserDAO userDAO = new UserDAO();
                try {
                    userDAO.deleteUser(phone);
                    response.sendRedirect("userlistservlet");
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect("UserList.jsp?error=Database+error");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("UserList.jsp?error=Unexpected+error");
                }
            } else {
                response.sendRedirect("UserList.jsp?error=Invalid+password");
            }
        } catch (Exception ex) {
            Logger.getLogger(DeleteUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

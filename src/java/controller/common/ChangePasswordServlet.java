package controller.common;

import dal.UserDAO;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/changepasswordservlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        Account user = (Account) session.getAttribute("user");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute("error", "New Password and Confirm Password do not match!");
            response.sendRedirect("UserInfo.jsp");
            return;
        }

        UserDAO userDAO = new UserDAO();

        try {
            if (userDAO.authenticateUser(user.getPhone(), currentPassword) != null) {
                try {
                    if (userDAO.updatePassword(user.getPhone(), newPassword)) {
                        session.setAttribute("message", "Password changed successfully!!");
                    } else {
                        session.setAttribute("error", "Failed to change password!");
                    }
                } catch (Exception e) {
                    session.setAttribute("error", "An error occurred while changing the password!");
                }
            } else {
                session.setAttribute("error", "Current password is incorrect!");
            }
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("error", "An error occurred during authentication!");
        }
        response.sendRedirect("userinfo");
    }
}

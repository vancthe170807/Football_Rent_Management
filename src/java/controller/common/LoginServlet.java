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

@WebServlet(name = "LoginServlet", urlPatterns = {"/loginservlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        HttpSession session = request.getSession();
        try {
            Account user = userDAO.authenticateUser(phone, password);
            if (user != null) {
                session.setAttribute("user", user);
                session.setAttribute("message", "Login successful!");
                response.sendRedirect("home"); // Redirect to the home page or dashboard
            } else {
                session.setAttribute("error", "Invalid phone or password");
                response.sendRedirect("Login.jsp");
            }
        } catch (Exception e) {
            throw new ServletException("Error during authentication", e);
        }
    }
}

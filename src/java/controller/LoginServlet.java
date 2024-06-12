package controller;

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
        try {
            Account user = userDAO.authenticateUser(phone, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("Home.jsp"); // Redirect to the home page or dashboard
            } else {
                request.setAttribute("error", "Invalid phone or password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error during authentication", e);
        }
    }
}

package controller;

import dal.RegisterDAO;
import validation.Validation;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet to handle user registration.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/registerservlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validation checks
        Map<String, String> errorMessages = new HashMap<>();
        if (!Validation.isValidName(fullname)) {
            errorMessages.put("fullnameError", "Name must be between 1 and 30 characters and contain only letters");
        }
        if (!Validation.isValidPhoneNumber(phone)) {
            errorMessages.put("phoneError", "Phone number must be 11 digits");
        }
        if (!Validation.isValidEmail(email)) {
            errorMessages.put("emailError", "Email should be valid and at most 30 characters long");
        }
        if (!Validation.isValidPassword(password)) {
            errorMessages.put("passwordError", "Password should have between 8 and 20 characters");
        }

        if (!errorMessages.isEmpty()) {
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            try {
                RegisterDAO registerDAO = new RegisterDAO();
                boolean isRegistered = registerDAO.register(fullname, phone, email, password);

                if (isRegistered) {
                    response.sendRedirect(request.getContextPath() + "/RegisterSuccess.jsp");
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration.";
    }
}

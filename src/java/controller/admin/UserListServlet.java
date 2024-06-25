package controller.admin;

import dal.UserDAO;
import model.Account;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "UserListServlet", urlPatterns = {"/userlist"})
public class UserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        try {
            String searchKeyword = request.getParameter("search");
            UserDAO userDAO = new UserDAO();
            List<Account> userList;

            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                userList = userDAO.searchUsers(searchKeyword);
            } else {
                userList = userDAO.getAllUsers();
            }

            request.setAttribute("userList", userList);
            request.getRequestDispatcher("UserList.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Unable to retrieve user data from the database", e);
        }
    }
}

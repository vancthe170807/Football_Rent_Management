package controller.common;

import dal.FieldDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Field;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String searchKeyword = request.getParameter("search");
            FieldDAO fieldDAO = new FieldDAO();
            List<Field> fieldList;

            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                fieldList = fieldDAO.searchFields(searchKeyword);
            } else {
                fieldList = fieldDAO.getAllFields();
            }

            request.setAttribute("fieldList", fieldList);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Unable to retrieve user data from the database", e);
        }
    }
}

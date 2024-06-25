package controller.common;

import dal.FieldDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Field;

@WebServlet(name="FieldInfoServlet", urlPatterns={"/fieldinfo"})
public class FieldInfoServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(FieldInfoServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String fieldCode = request.getParameter("FieldCode");
        LOGGER.log(Level.INFO, "FieldCode parameter: {0}", fieldCode);

        if (fieldCode == null || fieldCode.trim().isEmpty()) {
            request.setAttribute("error", "Field code is missing");
            request.getRequestDispatcher("FieldInfo.jsp").forward(request, response);
            return;
        }

        Field field = null;

        try {
            FieldDAO fieldDAO = new FieldDAO();
            field = fieldDAO.getInfomationFieldDetail(fieldCode);
            LOGGER.log(Level.INFO, "Fetched field from DB: {0}", field);
            if (field != null) {
                session.setAttribute("field", field);
            } else {
                request.setAttribute("error", "Field not found");
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving field information", ex);
            request.setAttribute("error", "Error retrieving field information");
        }

        request.setAttribute("field", field);
        request.getRequestDispatcher("FieldInfo.jsp").forward(request, response);
    }
}

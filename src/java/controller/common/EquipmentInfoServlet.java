package controller.common;

import dal.EquipmentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Equipment;

@WebServlet(name="EquipmentInfoServlet", urlPatterns={"/equipmentinfo"})
public class EquipmentInfoServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(EquipmentInfoServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String equipmentCode = request.getParameter("EquipmentCode");
        LOGGER.log(Level.INFO, "EquipmentCode parameter: {0}", equipmentCode);

        if (equipmentCode == null || equipmentCode.trim().isEmpty()) {
            request.setAttribute("error", "Equipment code is missing");
            request.getRequestDispatcher("EquipmentInfo.jsp").forward(request, response);
            return;
        }

        Equipment equip = null;

        try {
            EquipmentDAO equipDAO = new EquipmentDAO();
            equip = equipDAO.getInfomationEquipmentDetail(equipmentCode);
            LOGGER.log(Level.INFO, "Fetched equip from DB: {0}", equip);
            if (equip != null) {
                session.setAttribute("equip", equip);
            } else {
                request.setAttribute("error", "Equipment not found");
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error retrieving equip information", ex);
            request.setAttribute("error", "Error retrieving equip information");
        }

        request.setAttribute("equip", equip);
        request.getRequestDispatcher("EquipmentInfo.jsp").forward(request, response);
    }
}

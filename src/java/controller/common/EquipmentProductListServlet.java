/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.common;

import dal.EquipmentDAO;
import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Equipment;
import model.Product;

/**
 *
 * @author vanct
 */
@WebServlet(name="EquipmentProductListServlet", urlPatterns={"/equipmentproductlist"})
public class EquipmentProductListServlet extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            EquipmentDAO equipmentDAO = new EquipmentDAO();
            ProductDAO productDAO = new ProductDAO();
            
            List<Equipment> equipmentList = equipmentDAO.getAllEquipments();
            List<Product> productList = productDAO.getAllProducts();
            
            request.setAttribute("equipmentList", equipmentList);
            request.setAttribute("productList", productList);
            
            request.getRequestDispatcher("Equipment_Product_List.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving data", e);
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
        return "EquipmentProductListServlet";
    }
}

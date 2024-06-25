<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Account" %>
<%@ page import="model.Equipment" %>
<%@ page import="model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    Account user = (Account) session.getAttribute("user");
    List<Equipment> equipmentList = (List<Equipment>) request.getAttribute("equipmentList");
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    // Initialize NumberFormat for Vietnamese locale
    NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hola Field - Equipment & Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Header -->
        <%@ include file="Header.jsp" %>
        <div class="container mt-5">
            <h1>List of Equipment & Product</h1>
            <div class="accordion" id="accordionExample">
                <!-- Equipment Accordion Item -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingEquipment">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEquipment" aria-expanded="true" aria-controls="collapseEquipment">
                            Equipment for Rent
                        </button>
                    </h2>
                    <div id="collapseEquipment" class="accordion-collapse collapse show" aria-labelledby="headingEquipment" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Equipment Code</th>
                                        <th>Equipment Name</th>
                                        <th>Quantity</th>
                                        <th>Rent Price (VND/hour)</th>
                                        <th>View</th>
                                        <% if ("ADM".equals(user.getRolecode())) { %>
                                        <th>Action</th>
                                        <% } %>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Equipment equip : equipmentList) {
                                    %>
                                    <tr>
                                        <td><img src="<%= equip.getImage() %>" alt="Image" width="100"/></td>
                                        <td><%= equip.getEquipmentCode() %></td>
                                        <td><%= equip.getEquipmentName() %></td>
                                        <td><%= equip.getQuantities() %></td>
                                        <td><strong style="color: red"><%= numberFormat.format(equip.getRentPrice()) %></strong></td>
                                        <td><a href="equipmentinfo?EquipmentCode=<%=equip.getEquipmentCode()%>" style="text-decoration: none">View</a></td>
                                        <% if ("ADM".equals(user.getRolecode())) { %>
                                        <td>
                                            <div class="btn-group btn-block">
                                                <a href="#" class="btn btn-primary">Update</a>
                                                <a href="#" class="btn btn-danger">Delete</a>
                                            </div>
                                        </td>
                                        <% } %>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Product Accordion Item -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingProduct">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseProduct" aria-expanded="false" aria-controls="collapseProduct">
                            Products for Sale
                        </button>
                    </h2>
                    <div id="collapseProduct" class="accordion-collapse collapse" aria-labelledby="headingProduct" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Quantities</th>
                                        <th>Price (VND)</th>
                                        <th>View</th>
                                        <% if ("ADM".equals(user.getRolecode())) { %>
                                            <th>Action</th>
                                        <% } %>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (Product product : productList) {
                                    %>
                                    <tr>
                                        <td><img src="<%= product.getImage() %>" alt="Image" width="100"/></td>
                                        <td><%= product.getProductCode() %></td>
                                        <td><%= product.getProductName() %></td>
                                        <td><%= product.getQuantities() %></td>
                                        <td><strong style="color: red"><%= numberFormat.format(product.getProductPrice()) %></strong></td>
                                        <td><a href="productinfo?ProductCode=<%=product.getProductCode()%>" style="text-decoration: none">View</a></td>
                                        <% if ("ADM".equals(user.getRolecode())) { %>
                                        <td>
                                            <div class="btn-group btn-block">
                                                <a href="#" class="btn btn-primary">Update</a>
                                                <a href="#" class="btn btn-danger">Delete</a>
                                            </div>
                                        </td>
                                        <% } %>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="Footer.jsp" %>
        <!-- Bootstrap Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>

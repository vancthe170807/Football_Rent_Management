<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.Account" %>
<%@ page import="model.Equipment" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    Account user = (Account) session.getAttribute("user");
    Equipment equip = (Equipment) request.getAttribute("equip");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    if (equip == null) {
        out.println("<p>Equipment information is not available.</p>");
        return;
    }

    // Khởi tạo NumberFormat cho locale Việt Nam
    NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Hola Equipment - Equipment Information</title>
    <style>
        .equip-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
        }
        .equip-details {
            margin-top: 20px;
        }
        .equip-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-block {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .equip-description {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="Header.jsp" %>

    <!-- Main -->
    <div class="container mt-5">
        <h2>Chi Tiết Dụng cụ</h2>
        <div class="equip-container mt-4">
            <div class="row">
                <div class="col-md-6">
                    <div class="equip-image">
                        <img src="<%= equip.getImage() %>" alt="Equipment Image" class="img-fluid">
                    </div>
                </div>
                    <div class="col-md-6">
                        <div class="equip-details">
                            <h3>[<%= equip.getEquipmentCode() %>] <%= equip.getEquipmentName() %></h3>
                            <p>Giá thuê dụng cụ: <strong style="color: red"> <%= numberFormat.format(equip.getRentPrice()) %></strong> VNĐ/giờ</p>
                            <p>Số lượng hiện tại: <strong> <%= equip.getQuantities() %></strong></p>
                            <a href="#" class="btn btn-success w-100">ĐẶT THUÊ DỤNG CỤ NGAY</a>
                            <% if ("ADM".equals(user.getRolecode())) { %>
                                <div class="btn-group btn-block">
                                    <a href="#" class="btn btn-primary">Cập nhật</a>
                                    <a href="#" class="btn btn-danger">Xoá dụng cụ</a>
                                </div>
                            <% } %>
                        </div>
                    </div>
            </div>
            <div class="row">
                    <strong>Mô tả chi tiết:</strong>
                    <p><%= equip.getDescription() %></p>
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

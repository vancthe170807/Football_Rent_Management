<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.Account" %>
<%@ page import="model.Field" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    Account user = (Account) session.getAttribute("user");
    Field field = (Field) request.getAttribute("field");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    if (field == null) {
        out.println("<p>Field information is not available.</p>");
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
    <title>Hola Field - Field Information</title>
    <style>
        .field-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
        }
        .field-details {
            margin-top: 20px;
        }
        .field-container {
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
        .field-description {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="Header.jsp" %>

    <!-- Main -->
    <div class="container mt-5">
        <h2>Chi Tiết Sân Bóng</h2>
        <div class="field-container">
            <div class="row">
                <div class="col-md-6">
                    <div class="field-image">
                        <img src="<%= field.getImage() %>" alt="Field Image" class="img-fluid">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="field-details">
                        <h3>[<%= field.getFieldCode() %>] <%= field.getFieldName() %></h3>
                        <p>Giá thuê sân: <strong style="color: red"> <%= numberFormat.format(field.getRentPrice()) %></strong> VNĐ/giờ</p>
                        <p>Loại sân: <strong> <%= field.getFieldType() %></strong> người / đội</p>
                        <a href="#" class="btn btn-success w-100">ĐẶT SÂN NGAY</a>
                        <% if ("ADM".equals(user.getRolecode())) { %>
                            <div class="btn-block">
                                <a href="#" class="btn btn-primary flex-fill">Cập nhật</a>
                                <a href="#" class="btn btn-danger flex-fill">Xoá sân</a>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="row field-description">
                <div class="col-12">
                    <strong>Mô tả chi tiết:</strong>
                    <p><%= field.getDescription() %></p>
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

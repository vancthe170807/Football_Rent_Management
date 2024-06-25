<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.Account" %>
<%@ page import="model.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    Account user = (Account) session.getAttribute("user");
    Product product = (Product) request.getAttribute("product");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    if (product == null) {
        out.println("<p>Product information is not available.</p>");
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
    <title>Hola Product - Product Information</title>
    <style>
        .product-image img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
        }
        .product-details {
            margin-top: 20px;
        }
        .product-container {
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
        .product-description {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="Header.jsp" %>

    <!-- Main -->
    <div class="container mt-5">
        <h2>Chi Tiết Đồ ăn uống</h2>
        <div class="product-container mt-4">
            <div class="row">
                <div class="col-md-6">
                    <div class="product-image">
                        <img src="<%= product.getImage() %>" alt="Product Image" class="img-fluid">
                    </div>
                </div>
                    <div class="col-md-6">
                        <div class="product-details">
                            <h3>[<%= product.getProductCode() %>] <%= product.getProductName() %></h3>
                            <p>Giá bán: <strong style="color: red"> <%= numberFormat.format(product.getProductPrice()) %></strong> VNĐ</p>
                            <p>Số lượng hiện tại: <strong> <%= product.getQuantities() %></strong></p>
                            <a href="#" class="btn btn-success w-100">ĐẶT MUA NGAY</a>
                            <% if ("ADM".equals(user.getRolecode())) { %>
                                <div class="btn-group btn-block">
                                    <a href="#" class="btn btn-primary">Cập nhật</a>
                                    <a href="#" class="btn btn-danger">Xoá</a>
                                </div>
                            <% } %>
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

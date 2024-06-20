<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    Account user = (Account) session.getAttribute("user");
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Hola Field - Home</title>
    <style>
        body {
            background-image: url('image/Field/2.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .banner {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            background: rgba(0, 0, 0, 0.5);
        }
        .search-form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }
        .search-form {
            width: 100%;
            max-width: 500px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .stadium-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px;
        }
        .stadium-card {
            width: 300px;
            margin: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: white;
            text-align: center;
        }
        .stadium-card img {
            width: 100%;
            border-radius: 10px;
        }
        .stadium-card h4, .stadium-card p {
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="Header.jsp" %>

    <!-- Banner -->
    <section class="banner">
        <div class="container text-center">
            <h1>Cho thuê sân bóng đá chuyên nghiệp</h1>
            <p class="lead">Với các sân bóng hiện đại, đầy đủ tiện nghi và dịch vụ chất lượng</p>
            <a href="#" class="btn btn-primary btn-lg">Đặt sân ngay</a>
        </div>
    </section>

    <!-- Search Form -->
    <div class="search-form-container">
        <form id="searchForm" class="search-form">
            <div class="form-group">
                <input type="time" id="startTime" placeholder="Start time" class="form-control">
            </div>
            <div class="form-group">
                <input type="time" id="endTime" placeholder="End time" class="form-control">
            </div>
            <div class="form-group">
                <input type="date" id="searchDate" placeholder="Date" class="form-control">
            </div>
            <button type="button" id="searchButton" class="btn btn-primary btn-block">Search</button>
        </form>
    </div>

    <!-- Stadium List -->
    <div class="stadium-container">
        <div class="stadium-card">
            <img src="image/Field/san1.jpg" alt="Sân bóng 1">
            <h4>Tên sân: Sân bóng 1</h4>
            <p>Mô tả: Sân bóng đá tiêu chuẩn quốc tế.</p>
            <p>Giá tiền: 500,000 VND / giờ</p>
            <a href="#" class="btn btn-primary btn-block">Đặt sân</a>
        </div>
        <div class="stadium-card">
            <img src="image/Field/san2.jpg" alt="Sân bóng 2">
            <h4>Tên sân: Sân bóng 2</h4>
            <p>Mô tả: Sân bóng nhân tạo chất lượng cao.</p>
            <p>Giá tiền: 400,000 VND / giờ</p>
            <a href="#" class="btn btn-primary btn-block">Đặt sân</a>
        </div>
        <div class="stadium-card">
            <img src="image/Field/san3.jpg" alt="Sân bóng 3">
            <h4>Tên sân: Sân bóng 3</h4>
            <p>Mô tả: Sân bóng trong nhà với điều hòa.</p>
            <p>Giá tiền: 600,000 VND / giờ</p>
            <a href="#" class="btn btn-primary btn-block">Đặt sân</a>
        </div>
        <div class="stadium-card">
            <img src="image/Field/san4.jpg" alt="Sân bóng 4">
            <h4>Tên sân: Sân bóng 4</h4>
            <p>Mô tả: Sân bóng với khán đài lớn.</p>
            <p>Giá tiền: 700,000 VND / giờ</p>
            <a href="#" class="btn btn-primary btn-block">Đặt sân</a>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="Footer.jsp" %>

    <!-- Bootstrap Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>

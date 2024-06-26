<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <title>Hola Field - Login</title>
    <style>
        body {
            background-image: url("image/Field/2.jpeg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed; /* This keeps the background image fixed */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.8); /* White with 80% opacity */
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            max-width: 1200px; /* Set a maximum width */
            width: 100%; /* Make it responsive */
        }
        .login-header {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1 class="login-header text-center">Login</h1>
        <div class="row">
            <div class="col-md-6">
                <h5>Welcome to Hola Field</h5>
                <p>Hola Field là một sân bóng đá hiện đại tọa lạc tại trung tâm thành phố, nổi bật với cơ sở hạ tầng tiên tiến và không gian rộng rãi. Được trang bị hệ thống chiếu sáng chất lượng cao và mặt cỏ nhân tạo đạt chuẩn quốc tế, sân bóng này mang đến trải nghiệm thi đấu tuyệt vời cho các cầu thủ. Ngoài ra, Hola Field còn có khu vực khán đài thoải mái, phục vụ cho hàng ngàn khán giả cùng các tiện ích đi kèm như phòng thay đồ, khu vực vệ sinh và quầy bán đồ ăn uống. Đây là điểm đến lý tưởng cho các trận đấu bóng đá chuyên nghiệp lẫn các hoạt động thể thao cộng đồng.</p>
            </div>
            <div class="col-md-6">
                <form action="loginservlet" method="post">
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-success">Đăng nhập</button>
            </div>
        </form>
        <p class="text-center mt-3">If you don't have an account, you can <a href="Register.jsp">Register</a></p>
        <p class="text-center mt-3">Come back to <a href="home">Home</a></p>
            </div>
        </div>
        
    </div>
    
    <!-- Bootstrap Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        <% if (session.getAttribute("message") != null) { %>
            toastr.success("<%= session.getAttribute("message") %>");
            session.removeAttribute("message");
        <% } %>
        <% if (session.getAttribute("error") != null) { %>
            toastr.error("<%= session.getAttribute("error") %>");
            session.removeAttribute("error");
        <% } %>
    </script>
</body>
</html>

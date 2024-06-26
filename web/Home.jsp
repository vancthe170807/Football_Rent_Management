<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="model.Field"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    Account user = (Account) session.getAttribute("user");
    List<Field> fieldList = (List<Field>) request.getAttribute("fieldList");

    // Khởi tạo NumberFormat cho locale Việt Nam
    NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
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
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f8f9fa;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-block {
            width: 100%;
        }
        .search-form-container h2 {
            margin-bottom: 20px;
            color: #007bff;
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
                <label for="startTime">Start Time</label>
                <input type="time" id="startTime" placeholder="Start time" class="form-control">
            </div>
            <div class="form-group">
                <label for="endTime">End Time</label>
                <input type="time" id="endTime" placeholder="End time" class="form-control">
            </div>
            <div class="form-group">
                <label for="searchDate">Date</label>
                <input type="date" id="searchDate" placeholder="Date" class="form-control">
            </div>
            <button type="button" id="searchButton" class="btn btn-primary btn-block">Search</button>
        </form>
    </div>

    <!-- Field List -->
    <div class="stadium-container">
        <% if (fieldList != null && !fieldList.isEmpty()) { %>
            <% for (Field f : fieldList) { %>
                <div class="stadium-card">
                    <img src="<%= f.getImage() %>" alt="Sân bóng" style="height: 180px; width: 270px">
                    <a href="fieldinfo?FieldCode=<%=f.getFieldCode()%>" style="text-decoration: none"><h4><%= f.getFieldName() %></h4></a>
                    <p>Loại sân: <strong><%= f.getFieldType() %></strong> người / đội</p>
                    <p>Giá thuê: <strong style="color: red"><%= numberFormat.format(f.getRentPrice()) %></strong> VNĐ/giờ</p>
                    <button class="btn btn-success btn-block booking-button" data-fieldcode="<%= f.getFieldCode() %>" data-fieldname="<%= f.getFieldName() %>">Đặt sân</button>
                    <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                        <div class="btn-group btn-block">
                            <a href="#" class="btn btn-primary">Cập nhật</a>
                            <a href="#" class="btn btn-danger">Xoá sân</a>
                        </div>
                    <% } %>
                </div>
            <% } %>
        <% } else { %>
            <p style="text-align: center; font-style: italic; color: red">Không tìm thấy sân</p>
        <% } %>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bookingModalLabel">Đặt sân</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="bookingForm">
                        <div class="mb-3">
                            <label for="fieldCode" class="form-label">Mã sân</label>
                            <input type="text" class="form-control" id="fieldCode" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="fieldName" class="form-label">Tên sân</label>
                            <input type="text" class="form-control" id="fieldName" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="bookingDate" class="form-label">Chọn ngày</label>
                            <input type="date" class="form-control" id="bookingDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="startTime" class="form-label">Giờ bắt đầu</label>
                            <input type="time" class="form-control" id="startTime" required>
                        </div>
                        <div class="mb-3">
                            <label for="endTime" class="form-label">Giờ kết thúc</label>
                            <input type="time" class="form-control" id="endTime" required>
                        </div>
                        <div class="alert alert-danger d-none" id="bookingAlert">Hiện sân này đã có người đặt trong cùng giờ, vui lòng chọn sân hoặc giờ khác</div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="orderButton">Order</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="Footer.jsp" %>

    <!-- Bootstrap Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- JavaScript -->
    <script>
        var isLoggedIn = <%= (user != null) %>; // Kiểm tra người dùng đã đăng nhập hay chưa

        // Thêm sự kiện click cho tất cả các nút đặt sân
        document.querySelectorAll('.booking-button').forEach(function(button) {
            button.addEventListener('click', function(event) {
                if (!isLoggedIn) {
                    // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
                    window.location.href = 'Login.jsp';
                } else {
                    var fieldCode = button.getAttribute('data-fieldcode');
                    var fieldName = button.getAttribute('data-fieldname');
                    
                    var modalTitle = document.querySelector('#bookingModal .modal-title');
                    var modalFieldCode = document.querySelector('#fieldCode');
                    var modalFieldName = document.querySelector('#fieldName');
                    
                    modalTitle.textContent = 'Đặt sân: ' + fieldName;
                    modalFieldCode.value = fieldCode;
                    modalFieldName.value = fieldName;
                    
                    // Hiển thị modal
                    var bookingModal = new bootstrap.Modal(document.getElementById('bookingModal'));
                    bookingModal.show();
                }
            });
        });

        document.getElementById('orderButton').addEventListener('click', function () {
            var fieldCode = document.getElementById('fieldCode').value;
            var bookingDate = document.getElementById('bookingDate').value;
            var startTime = document.getElementById('startTime').value;
            var endTime = document.getElementById('endTime').value;

            var bookingAlert = document.getElementById('bookingAlert');

            // AJAX request to check for overlapping bookings
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'BookingServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function () {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.overlap) {
                        bookingAlert.classList.remove('d-none');
                    } else {
                        bookingAlert.classList.add('d-none');
                        // Proceed with booking creation
                        var bookingForm = document.getElementById('bookingForm');
                        bookingForm.submit();
                    }
                }
            };
            xhr.send('action=checkOverlap&fieldCode=' + fieldCode + '&bookingDate=' + bookingDate + '&startTime=' + startTime + '&endTime=' + endTime);
        });
    </script>
</body>
</html>

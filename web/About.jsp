<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%
    Account user = (Account) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hola Field - About</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            body {
                background-image: url("image/Field/2.jpeg");
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-color: #f8f9fa;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                margin: 0;
            }
            .container {
                margin-top: 20px;
            }
            .flex-grow-1 {
                flex-grow: 1;
            }
            .overlay {
                background: rgba(255, 255, 255, 0.8);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                margin-bottom: 20px;
                text-align: center;
                color: #007bff;
            }
            .table th, .table td {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <%@ include file="Header.jsp" %>
        <div class="flex-grow-1 d-flex justify-content-center align-items-center">
            <div class="container overlay">
                <h1>About</h1>
                <div class="card">
                    <div class="card-body">
                        <ul>
                            <li><strong>Hola Field</strong> là dự án ứng dụng web thuộc sở hữu của Sân Bóng đá Hoà Lạc, được các thành viên nhóm 5 môn <strong>PRJ301 (Phát triển ứng dụng Java Web) - SE1873</strong> chung tay thực hiện</li>
                            <li>Các công nghệ được sử dụng trong trang web:</li>
                            <ul>
                                <li>Front-end: JSP</li>
                                <li>Back-end: Java, Java Servlet by Apache NetBeans 17</li>
                                <li>Cơ sở dữ liệu: Microsoft SQL Server</li>
                            </ul>
                            <li>Link Github của dự án: <a href="https://github.com/vancthe170807fptu/Football_Rent_Management" target="_blank" style="text-decoration: none">Github</a></li>
                        </ul>
                        <h3 class="mt-4">Giới thiệu thành viên nhóm:</h3>
                        <table class="table table-bordered">
                            <thead class="table-light">
                                <tr>
                                    <th>STT</th>
                                    <th>Mã sinh viên</th>
                                    <th>Họ và tên</th>
                                    <th>Liên hệ qua email</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td><td>HE170807</td><td>Chu Thế Văn</td><td><a href="mailto: vancthe170807@fpt.edu.vn" class="btn btn-danger">Send Email</a></td>
                                </tr>
                                <tr>
                                    <td>2</td><td>HE173160</td><td>Vũ Quang Mạnh</td><td><a href="mailto: manhvqhe173160@fpt.edu.vn" class="btn btn-danger">Send Email</a></td>
                                </tr>
                                <tr>
                                    <td>3</td><td>HE176674</td><td>Bùi Văn Nguyện</td><td><a href="mailto: nguyenbvhe176674@fpt.edu.vn" class="btn btn-danger">Send Email</a></td>
                                </tr>
                                <tr>
                                    <td>4</td><td>HE180458</td><td>Nguyễn Quang Nghĩa</td><td><a href="mailto: nghianqhe180458@fpt.edu.vn" class="btn btn-danger">Send Email</a></td>
                                </tr>
                                <tr>
                                    <td>5</td><td>HE182413</td><td>Nguyễn Khang Linh</td><td><a href="mailto: linhnkhe182413@fpt.edu.vn" class="btn btn-danger">Send Email</a></td>
                                </tr>
                            </tbody>
                        </table>
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

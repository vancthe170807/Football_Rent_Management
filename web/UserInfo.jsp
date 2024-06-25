<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    Account user = (Account) session.getAttribute("user");

    String message = (String) session.getAttribute("message");
    String error = (String) session.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <title>Hola Field - User Info</title>
    <style>
        .avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <!-- Header -->
        <%@ include file="Header.jsp" %>

    <div class="container mt-5">
        <h1>User Information</h1>

        <div class="row">
            <div class="container">
                <table class="table table-bordered">
                    <tr>
                        <th>Fullname</th>
                        <td><%= user.getFullname() %></td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td><%= user.getPhone() %></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><%= user.getEmail() %></td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td>******** <button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#changePasswordModal">Change Password</button></td>
                    </tr>
                </table>
            </div>
        </div>
        <a href="home" class="btn btn-secondary mt-3">Back to Home</a>
    </div>

    <!-- Change Password Modal -->
    <div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="changepasswordservlet" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="currentPassword" class="form-label">Current Password</label>
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
        <%@ include file="Footer.jsp" %>

    <!-- Bootstrap Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        <% if (message != null) { %>
            toastr.success("<%= message %>");
            session.removeAttribute("message");
        <% } %>
        <% if (error != null) { %>
            toastr.error("<%= error %>");
            session.removeAttribute("error");
        <% } %>
    </script>
</body>
</html>

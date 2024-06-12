<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    Account user = (Account) session.getAttribute("user");
    List<Account> userList = (List<Account>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>User List</title>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }
        .avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="Home.jsp">MyWebsite</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Welcome, <%= user.getFullname() %>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="userinfoservlet">User Info</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logoutservlet">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1 class="mb-4 text-center">User List</h1>
        <form method="get" action="userlistservlet" class="mb-4">
            <div class="input-group">
                <input type="text" name="search" class="form-control" placeholder="Search users...">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Fullname</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Role Code</th>
                    <% if ("ADM".equals(user.getRolecode())) { %>
                        <th>Actions</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <% if (userList != null) {
                    for (Account account : userList) {
                %>
                <tr>
                    <td><%= account.getFullname() %></td>
                    <td><%= account.getPhone() %></td>
                    <td><%= account.getEmail() %></td>
                    <td><%= account.getRolecode() %></td>
                    <% if ("ADM".equals(user.getRolecode())) { %>
                        <td>
                            <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-phone="<%= account.getPhone() %>">Delete</button>
                            <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#changeRoleModal" data-phone="<%= account.getPhone() %>" data-current-role="<%= account.getRolecode() %>">Change Role</button>
                        </td>
                    <% } %>
                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="<%= "ADM".equals(user.getRolecode()) ? "7" : "6" %>" class="text-center">No users found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="deleteuserservlet">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="deletePhone" name="phone">
                        <p>Are you sure you want to delete this user?</p>
                        <div class="mb-3">
                            <label for="adminPassword" class="form-label">Admin Password</label>
                            <input type="password" class="form-control" id="adminPassword" name="adminPassword" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Change Role Modal -->
    <div class="modal fade" id="changeRoleModal" tabindex="-1" aria-labelledby="changeRoleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="changeroleservlet">
                    <div class="modal-header">
                        <h5 class="modal-title" id="changeRoleModalLabel">Change User Role</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="changeRolePhone" name="phone">
                        <div class="mb-3">
                            <label for="newRole" class="form-label">New Role</label>
                            <select class="form-control" id="newRole" name="newRole">
                                <option value="EMP">Employee</option>
                                <option value="CUS">Customer</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="adminPassword" class="form-label">Admin Password</label>
                            <input type="password" class="form-control" id="adminPassword" name="adminPassword" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-warning">Change Role</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <script>
        // Populate delete modal
        var deleteModal = document.getElementById('deleteModal');
        deleteModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var phone = button.getAttribute('data-phone');
            var deletePhoneInput = deleteModal.querySelector('#deletePhone');
            deletePhoneInput.value = phone;
        });

        // Populate change role modal
        var changeRoleModal = document.getElementById('changeRoleModal');
        changeRoleModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var phone = button.getAttribute('data-phone');
            var currentRole = button.getAttribute('data-current-role');
            var changeRolePhoneInput = changeRoleModal.querySelector('#changeRolePhone');
            var newRoleSelect = changeRoleModal.querySelector('#newRole');
            changeRolePhoneInput.value = phone;
            newRoleSelect.value = currentRole;
        });
    </script>
</body>
</html>

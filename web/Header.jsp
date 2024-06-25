<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Account" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    if (session != null) {
        user = (Account) session.getAttribute("user");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            padding-top: 56px; /* Offset for fixed navbar */
        }
        .btn-outline-success .bi-cart {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <header>
        <!-- Main Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="home" style="color: green; font-weight: bolder">Hola Field</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-none d-lg-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                        <li class="nav-item">
                            <a href="userlist" class="nav-link active" aria-current="page">
                                <i class="fas fa-users"></i> Manage User
                            </a>
                        </li>
                        <% } %>
                        <% if (user != null && "EMP".equals(user.getRolecode())) { %>
                        <li class="nav-item">
                            <a href="userlist" class="nav-link active" aria-current="page">
                                <i class="fas fa-users"></i> Manage User
                            </a>
                        </li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="equipmentproductlist">List Equipment & Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">FAQs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="About.jsp">About</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a href="#" class="btn btn-outline-success">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                            </svg>
                        </a>
                    </form>
                    <div class="d-flex ms-3">
                        <% if (user == null) { %>
                            <a href="Login.jsp" class="btn btn-outline-primary me-2">Login</a>
                            <a href="SignUp.jsp" class="btn btn-primary">Sign-up</a>
                        <% } else { %>
                            <div class="dropdown">
                                <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                                    <button class="btn btn-danger dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= user.getFullname()%>
                                    </button>
                                <% } %>
                                <% if (user != null && "EMP".equals(user.getRolecode())) { %>
                                    <button class="btn btn-success dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= user.getFullname()%>
                                    </button>
                                <% } %>
                                <% if (user != null && "CUS".equals(user.getRolecode())) { %>
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= user.getFullname()%>
                                    </button>
                                <% } %>
                                <ul class="dropdown-menu" aria-labelledby="userDropdown">
                                    <li><a class="dropdown-item" href="userinfo">
                                            <i class="fas fa-user"></i> Profile
                                        </a></li>
                                    <li><a class="dropdown-item" href="logout">
                                            <i class="fas fa-sign-out-alt"></i> Logout
                                        </a></li>
                                </ul>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </nav>
        
        <!-- Offcanvas Navbar -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home"> <i class="fas fa-home"></i> Home</a>
                    </li>
                    <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                        <li class="nav-item"><a href="userlist" class="nav-link active" aria-current="page"> <i class="fas fa-users"></i> Manage Users</a></li>
                    <% } %>
                    <% if (user != null && "EMP".equals(user.getRolecode())) { %>
                        <li class="nav-item"><a href="userlist" class="nav-link active" aria-current="page"> <i class="fas fa-users"></i> Manage Users</a></li>
                    <% } %>
                    <li class="nav-item">
                        <a class="nav-link" href="equipmentproductlist">List Equipment & Product</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.jsp">About</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="offcanvasDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="offcanvasDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex">
                        <a href="#" class="btn btn-outline-success">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                            </svg>
                        </a>
                    </form>
                <div class="d-flex mt-3">
                    <% if (user == null) { %>
                        <a href="Login.jsp" class="btn btn-outline-primary me-2">Login</a>
                        <a href="SignUp.jsp" class="btn btn-primary">Sign-up</a>
                    <% } else { %>
                        <div class="dropdown">
                            <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                                    <button class="btn btn-danger dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= user.getFullname()%>
                                    </button>
                                <% } %>
                                <% if (user != null && "EMP".equals(user.getRolecode())) { %>
                                    <button class="btn btn-success dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= user.getFullname()%>
                                    </button>
                                <% } %>
                                <% if (user != null && "CUS".equals(user.getRolecode())) { %>
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <%= user.getFullname()%>
                                    </button>
                                <% } %>
                            <ul class="dropdown-menu" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="userinfo">
                                        <i class="fas fa-user"></i> Profile
                                    </a></li>
                                <li><a class="dropdown-item" href="logout">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a></li>
                            </ul>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </header>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>

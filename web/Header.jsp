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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            padding-top: 56px; /* Offset for fixed navbar */
        }
    </style>
</head>
<body>
    <header>
        <!-- Main Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="Home.jsp" style="color: green; font-weight: bolder">Hola Field</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-none d-lg-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Home.jsp">Home</a>
                        </li>
                        <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                            <li class="nav-item"><a href="userlistservlet" class="nav-link active" aria-current="page">Manage Users</a></li>
                        <% } %>
                        <% if (user != null && "EMP".equals(user.getRolecode())) { %>
                            <li class="nav-item"><a href="userlistservlet" class="nav-link active" aria-current="page">Manage Users</a></li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">FAQs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="d-flex ms-3">
                        <%
                            if (user == null) {
                        %>
                            <a href="Login.jsp" class="btn btn-outline-primary me-2">Login</a>
                            <a href="SignUp.jsp" class="btn btn-primary">Sign-up</a>
                        <%
                            } else {
                        %>
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
                                    <li><a class="dropdown-item" href="userinfoservlet">Profile</a></li>
                                    <li><a class="dropdown-item" href="logoutservlet">Logout</a></li>
                                </ul>
                            </div>
                        <%
                            }
                        %>
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
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <% if (user != null && "ADM".equals(user.getRolecode())) { %>
                        <li class="nav-item"><a href="userlistservlet" class="nav-link active" aria-current="page">Manage Users</a></li>
                    <% } %>
                    <% if (user != null && "EMP".equals(user.getRolecode())) { %>
                        <li class="nav-item"><a href="userlistservlet" class="nav-link active" aria-current="page">Manage Users</a></li>
                    <% } %>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">FAQs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
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
                <form class="d-flex mt-3" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                <div class="d-flex mt-3">
                    <%
                        if (user == null) {
                    %>
                        <a href="Login.jsp" class="btn btn-outline-primary me-2">Login</a>
                        <a href="SignUp.jsp" class="btn btn-primary">Sign-up</a>
                    <%
                        } else {
                    %>
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
                            <ul class="dropdown-menu" aria-labelledby="userDropdownOffcanvas">
                                <li><a class="dropdown-item" href="userinfoservlet">
                                        Profile</a></li>
                                <li><a class="dropdown-item" href="logoutservlet">Logout</a></li>
                            </ul>
                        </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </header>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hola Field - Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
        }
        .register-container {
            background-color: rgba(255, 255, 255, 0.8); /* White with 80% opacity */
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
            width: 600px;
        }
        .register-header {
            margin-bottom: 1rem;
        }
        .error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1 class="register-header text-center">Register</h1>
        <form action="registerservlet" method="post" onsubmit="return validatePassword()">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="fullname" class="form-label">Fullname (*)</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" value="${param.fullname}" required>
                        <c:if test="${not empty errorMessages.fullnameError}">
                            <div class="error">${errorMessages.fullnameError}</div>
                        </c:if>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone (*)</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${param.phone}" required>
                        <c:if test="${not empty errorMessages.phoneError}">
                            <div class="error">${errorMessages.phoneError}</div>
                        </c:if>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}">
                        <c:if test="${not empty errorMessages.emailError}">
                            <div class="error">${errorMessages.emailError}</div>
                        </c:if>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="password" class="form-label">Password (*)</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <c:if test="${not empty errorMessages.passwordError}">
                            <div class="error">${errorMessages.passwordError}</div>
                        </c:if>
                     </div>
                     <div class="mb-3">
                        <label for="confirmpassword" class="form-label">Confirm Password (*)</label>
                        <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" required>
                        <div id="error-message" class="error" style="display: none;">Passwords do not match. Please try again.</div>
                     </div>     
                 </div>
            </div>
            
            
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
            <p class="text-center mt-3">If you have an account, you can <a href="Login.jsp">Login</a></p>
            <p class="text-center mt-3">(*): Thông tin bắt buộc phải điền</p>
        </form>
    </div>

    <!-- Bootstrap Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- Password Confirmation Script -->
    <script>
        function validatePassword() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmpassword').value;
            const errorMessage = document.getElementById('error-message');

            if (password !== confirmPassword) {
                errorMessage.style.display = 'block';
                return false;
            }

            errorMessage.style.display = 'none';
            return true;
        }
    </script>
</body>
</html>

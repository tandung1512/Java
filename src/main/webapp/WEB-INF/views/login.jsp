<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.container-fluid {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f8f9fa;
}

.row {
	height: 80%;
	width: 100%;
	max-width: 1200px; /* Adjust the maximum width */
}

.left {
	background-image: url('/images/xiaomi14-utral.png');
	background-size: cover;
	background-position: center;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

.right {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: white;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-form {
	width: 100%;
	max-width: 600px; /* Adjust the maximum width */
	padding: 40px; /* Increase padding */
}

.forgot-password, .register {
	color: black; /* Set text color to black */
}

label, .forgot-password, .register {
	color: #000080; /* Màu chữ tương tự màu chính của PNJ */
}
/* Thay đổi màu nền khi rê chuột vào và zoom mượt mà */
.btn-primary {
	transition: transform 0.3s, box-shadow 0.3s;
	background-color: white;
	color: black;
	"
}

.btn-primary:hover {
	transform: scale(1.05); /* Phóng to lên 105% kích thước ban đầu */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Hiệu ứng bóng đổ */
	background-color: #000080
}

/* Thay đổi màu chữ khi rê chuột vào */
.btn-primary:hover {
	color: white; /* Màu trắng */
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row no-gutters shadow-lg">
			<div class="col-md-6 left d-none d-md-block"></div>
			<div class="col-md-6 right">

				<div class="login-form">

					<h2 class="text-center mb-4" style="color: #4d4d4d;">
						<i class="fa-solid fa-backward" onclick="goBack()"
							style="width: 30px"></i><a href="/index"><img src="/images/logo-menu.png" style="width: 20%" alt="Logo"></a> Login
					</h2>

					<form action="/login/signin" method="POST">
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								id="username" name="username" class="form-control rounded-pill"
								placeholder="Fill your Username!" required value="${username}">
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								id="password" name="password" class="form-control rounded-pill"
								placeholder="Fill your Password!" required value="${password}">
						</div>
						<div class="form-group form-check">
							<input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
							<label class="form-check-label" for="rememberMe">Remember me</label>
						</div>
						<div class="form-group">
							<a href="/forgetpassword" class="forgot-password">Forget Password
								  |</a> <a href="/signup" class="register">SignUp</a>
						</div>
						<!-- Trong file login.html -->

				<!-- Trong file login.jsp -->
<c:if test="${not empty error}">
    <div style="color: red;">
        <p>${error}</p>
    </div>
</c:if>


						<button type="submit"
							class="btn btn-primary btn-block rounded-pill">Login</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	<script>
    function goBack() {
        window.history.back();
    }
</script>
	<!-- Bootstrap JS and dependencies -->
	<script src="https://kit.fontawesome.com/7ac34e99b9.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

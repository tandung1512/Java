<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">
<meta name="description" content="">
<meta name="keywords" content="bootstrap, bootstrap4">
<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<title>User Profile</title>

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">

<style>
form {
	margin-bottom: 30px;
}

.profile-container {
	background-color: #f8f9fa;
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	position: relative; /* Để tạo vị trí tương đối cho avatar */
}

.update-btn {
	border-radius: 20px;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	transition: all 0.3s ease;
	cursor: pointer;
}

.update-btn:hover {
	background-color: #0056b3;
}

.update-btn:active {
	transform: translateY(2px);
}

.edit-icon {
	color: #000;
	cursor: pointer;
}

/* Hiệu ứng góc bo */
input[type="text"], input[type="password"] {
	border-radius: 10px;
	padding: 8px 12px;
	width: 100%; /* Đảm bảo các trường input có chiều rộng bằng nhau */
}

/* Hiển thị avatar */
.avatar {
	position: absolute;
	top: 50px; /* Dịch avatar lên trên một chút */
	left: 20px; /* Dịch avatar sang phải một chút */
	width: 250px; /* Đặt chiều rộng của avatar */
	height: 250px; /* Đặt chiều cao của avatar */
	border-radius: 50%;
	border: 2px solid #fff;
	overflow: hidden;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.avatar img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.table-responsive table {
	width: 500px; /* Thiết lập chiều ngang của bảng */
	margin: 0 auto; /* Căn giữa bảng */
}

.password-container {
	position: relative;
	width: 100%;
}

.password-container input[type="password"], .password-container input[type="text"]
	{
	width: calc(100%); /* Chừa khoảng trống cho biểu tượng mắt */
}

.toggle-password {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #666;
}
</style>
</head>
<body>

	<!-- Start Header/Navigation -->
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- End Header/Navigation -->

	<!-- Start Profile Section -->
	<form action="/profile/update" method="post">
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-lg-10 profile-container">
					<!-- Hiển thị avatar -->

					<div class="table-responsive">
						<div class="avatar">
							<img
								src="${pageContext.request.contextPath}/images/${account.photo}"
								alt="Avatar" class="img-fluid">
						</div>
						<table class="table">
							<!-- Các dòng thông tin người dùng -->
							<tr>
								<td>Username</td>
								<td><input type="text" name="username"
									value="${account.username}"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td>
									<div class="password-container">
										<input type="password" id="password" name="password"
											value="${account.password}"> <i
											class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
									</div>
								</td>
							</tr>
							<tr>
								<td>Full Name</td>
								<td><input type="text" name="fullname"
									value="${account.fullname}"></td>
							</tr>
							<tr>
								<td>Phone Number</td>
								<td><input type="text" name="phonenumber"
									value="${account.phonenumber}"></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" name="email"
									value="${account.email}"></td>
							</tr>
							<!-- Các dòng khác -->
						</table>
					</div>
					<div class="text-center mt-3">
						<button type="submit" class="update-btn">Update Profile</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- End Profile Section -->

	<!-- Start Footer Section -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- End Footer Section -->

	<!-- Bootstrap Bundle JS -->
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<!-- Custom JS -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>

	<!-- JavaScript để ẩn/hiện mật khẩu -->
	<script>
		function togglePassword() {
			var passwordField = document.getElementById('password');
			var toggleIcon = document.querySelector('.toggle-password');
			if (passwordField.type === 'password') {
				passwordField.type = 'text';
				toggleIcon.classList.remove('fa-eye');
				toggleIcon.classList.add('fa-eye-slash');
			} else {
				passwordField.type = 'password';
				toggleIcon.classList.remove('fa-eye-slash');
				toggleIcon.classList.add('fa-eye');
			}
		}
	</script>
</body>
</html>

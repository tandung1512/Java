<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Khôi Phục Mật Khẩu</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
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
        background-image: url('/images/login.jpg');
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

    .register-form {
        width: 100%;
        max-width: 600px; /* Adjust the maximum width */
        padding: 40px; /* Increase padding */
    }

    .alert {
        margin-top: 20px;
    }

    label, .forgot-password, .register {
        color: #000080; /* Màu chữ tương tự màu chính của PNJ */
    }

    .btn-primary {
        transition: transform 0.3s, box-shadow 0.3s;
        background-color: white;
        color: black;
    }

    .btn-primary:hover {
        transform: scale(1.05); /* Phóng to lên 105% kích thước ban đầu */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Hiệu ứng bóng đổ */
        background-color: #000080;
    }

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
            <div class="register-form">
                <h2 class="text-center mb-4" style="color: #4d4d4d;">
                    <a href="/index"><img src="/images/logo-pnj-footer.png" style="width: 20%" alt="Logo"></a> Trang Sức Thời Thượng <br>Khôi Phục Mật Khẩu
                </h2>
                <form id="find-email-form" action="/forgetpassword/find-email" method="POST">
                    <div class="form-group">
                        <label for="username">Tài Khoản</label> <input type="text" id="username" name="username" class="form-control rounded-pill" placeholder="Nhập Tài Khoản Của Bạn" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block rounded-pill">Tìm Gmail</button>
                </form>

                <form id="reset-password-form" action="/forgetpassword/reset-password" method="POST" style="display: none;">
                    <div class="form-group">
                        <label for="username_reset">Tài Khoản</label>
                        <input type="text" id="username_reset" name="username_reset" class="form-control rounded-pill" placeholder="Nhập Tài Khoản Của Bạn" value="${usernamefgpw}" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Gmail</label>
                        <input type="text" id="email" name="email" class="form-control rounded-pill" value="${foundEmail}" readonly>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block rounded-pill">Khôi Phục Mật Khẩu</button>
                </form>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <div id="successAlert" class="alert alert-success" role="alert">
                        ${successMessage}
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script>
// Thực hiện điều khiển việc hiển thị form tìm kiếm email hoặc form khôi phục mật khẩu
var foundEmail = "${foundEmail}";
if (foundEmail !== '') {
    document.getElementById("find-email-form").style.display = "none";
    document.getElementById("reset-password-form").style.display = "block";
}
</script>
<script>
// Xác định thông báo thành công
var successAlert = document.getElementById("successAlert");

// Nếu có thông báo thành công, thực hiện chuyển hướng sau 5 giây
if (successAlert) {
    setTimeout(function(){
        window.location.href = "/login"; // Chuyển hướng về trang login
    }, 5000); // 5 giây
}
</script>
</body>
</html>

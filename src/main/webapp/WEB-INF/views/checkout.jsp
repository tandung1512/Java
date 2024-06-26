<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">
<meta name="description" content="">
<meta name="keywords" content="bootstrap, bootstrap4">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<!-- Tiny Slider CSS -->
<link href="${pageContext.request.contextPath}/css/tiny-slider.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">

<title>Checkout</title>
</head>

<body>
	<!-- Start Header/Navigation -->
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- End Header/Navigation -->

	<div class="container mt-5">
		<h2>Thanh toán</h2>
		<form action="${pageContext.request.contextPath}/checkout/process"
			method="post">
			
			<div class="form-group">
				<label for="fullName">Họ và Tên</label> <input type="text"
					class="form-control" id="fullName" name="fullName" required>
			</div>
			<div class="form-group">
				<label for="address">Địa chỉ</label> <input type="text"
					class="form-control" id="address" name="address" required>
			</div>
			<div class="form-group">
				<label for="phone">Số điện thoại</label> <input type="text"
					class="form-control" id="phone" name="phone" required>
			</div>
			<div class="form-group">
				<label for="orderNote">Ghi chú đơn hàng </label>
				<textarea class="form-control" id="orderNote" name="orderNote"></textarea>
			</div>
			<div class="form-group">
				<label for="totalPrice">Tổng tiền</label> <input type="text"
					class="form-control" id="totalPrice" name="totalPrice"
					value="<fmt:formatNumber value='${totalPrice}' pattern='###,###' /> VND"
					readonly>
			</div>
			<button type="submit" class="btn btn-primary"
				style="margin: 50px 50px 50px 80%;"  >Thanh toán</button>
		</form>
	</div>

	<!-- Start Footer Section -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- End Footer Section -->

	<!-- Bootstrap Bundle JS -->
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<!-- Tiny Slider JS -->
	<script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
	<!-- Custom JS -->
	<script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>

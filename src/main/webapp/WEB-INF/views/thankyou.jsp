<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
<title>Thank You</title>

<style>

</style>
</head>

<body>
	<!-- Start Header/Navigation -->
		<jsp:include page="menu.jsp"></jsp:include>
	<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>Cart</h1>
					</div>
				</div>
				<div class="col-lg-7"></div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->



	<div class="untree_co-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center pt-5">
					<span class="display-3 thankyou-icon text-primary"> <svg
							width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-cart-check mb-5" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd"
								d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z" />
              <path fill-rule="evenodd"
								d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
            </svg>
					</span>
					<h2 class="display-3 text-black">Cảm Ơn!</h2>
					<p class="lead mb-5">Thanh Toán Thành Công</p>
					<p>
						<a href="/shop" class="btn btn-sm btn-outline-black"> Quay Trở Lại Cửa Hàng
							</a>
					</p>
				<button type="submit" class="btn btn-primary" onclick="window.location='/orders'"
				   >Lịch Sử Mua Hàng</button>
				</div>
			</div>
		</div>
	</div>

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
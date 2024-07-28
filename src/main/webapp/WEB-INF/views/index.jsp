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

<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<title>Xiaomi-Home</title>

<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<title>Home Page</title>
</head>
<body>


	<jsp:include page="menu.jsp"></jsp:include>

	<div class="hero" style="background-color: white;">
		<div class="container">
			<div class="row justify-content-between">

				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1 style="color: black;">Xiaomi 14</h1>
						<p class="mb-4" style="font-weight: bold; color: black;">Skin
					artificially using Xiaomi's new nanotechnology</p>
						<p style="color: black;">Xiaomi 14 Ultra uses artificial leather
							The latest generation applies nanotechnology, with superior properties
							Outstanding features such as anti-fouling, antibacterial and environmentally friendly.
							In addition, the newly developed powerful anti-wear formula helps
							Increase the density of functional groups in the fecal chain reaction
							branch.</p>
						<p>

							<a href="/shop" class="btn btn-secondary me-2">Buy Now</a>

						</p>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="images/xiaomi14-utral.png" class="img-fluid"
							width="540px"
							style="padding-left: 80px; margin-top: 30px; margin-right: 20px">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->
	<hr width="100%" align="center" />
	<div class="hero">

		<img
		 src="images/banner-redmi.png" class="img-fluid" width="auto"
			style="margin-top: 0px; margin-bottom: 0px;"
			
			>
	
	</div>
	<hr width="100%" align="center" />


	<!-- Start Why Choose Us Section -->
	<div class="why-choose-section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-6">
					<h2 class="section-title">Why Choose Us</h2>
					<p>Discover the sophisticated beauty and elegance of Xiaomi. Every product
						All products bring uniqueness and strength to users.</p>

					<div class="row my-5">
						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/truck.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Fast Shipping &amp; Free</h3>
								<p>Guaranteed fast and free delivery nationwide
									for all Xiaomi orders.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/bag.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Easy Shopping</h3>
								<p>Experience convenient online shopping with interface
									Friendly and dedicated service from Xiaomi.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/support.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Support 24/7</h3>
								<p>Xiaomi's customer support team is always ready to solve the problem
									answer all your questions 24/7.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/return.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Easy Returns</h3>
								<p>Flexible return policy helps you feel secure when shopping
									at Xiaomi.</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-lg-5">
					<div class="img-wrap">
						<img src="images/xiaomi14-utral.png" alt="Image" class="img-fluid">
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End Why Choose Us Section -->

	<hr width="100%" align="center" />


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
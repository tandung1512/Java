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
<title>home</title>

<link rel="shortcut icon" type="image/png" href="images/favicon.png" />
<title>Trang chủ</title>
</head>
<body>

	
	<jsp:include page="menu.jsp"></jsp:include>
	
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">

				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>Trang Sức PNJ</h1>
						<p class="mb-4">Khám phá vẻ đẹp tinh tế và sang trọng của bộ
							sưu tập trang sức PNJ. Mỗi sản phẩm đều mang đến sự độc đáo và
							quý phái cho người đeo.</p>
						<p>

						

							<a href="/shop" class="btn btn-secondary me-2">Mua Ngay</a><a
								href="/blog" class="btn btn-white-outline">Khám Phá</a>

						</p>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="images/home.png" class="img-fluid" width="540px"
							style="padding-left: 80px">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->



	<!-- Start Why Choose Us Section -->
	<div class="why-choose-section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-6">
					<h2 class="section-title">Tại Sao Chọn Chúng Tôi</h2>
					<p>Khám phá vẻ đẹp tinh tế và sang trọng của trang sức PNJ. Mỗi
						sản phẩm đều mang đến sự độc đáo và quý phái cho người đeo.</p>

					<div class="row my-5">
						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/truck.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Vận Chuyển Nhanh &amp; Miễn Phí</h3>
								<p>Đảm bảo giao hàng nhanh chóng và miễn phí trên toàn quốc
									cho mọi đơn hàng của PNJ.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/bag.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Dễ Dàng Mua Sắm</h3>
								<p>Trải nghiệm mua sắm trực tuyến thuận tiện với giao diện
									thân thiện và dịch vụ tận tâm từ PNJ.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/support.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Hỗ Trợ 24/7</h3>
								<p>Đội ngũ hỗ trợ khách hàng của PNJ luôn sẵn sàng giải đáp
									mọi thắc mắc của bạn 24/7.</p>
							</div>
						</div>

						<div class="col-6 col-md-6">
							<div class="feature">
								<div class="icon">
									<img src="images/return.svg" alt="Image" class="img-fluid">
								</div>
								<h3>Đổi Trả Dễ Dàng</h3>
								<p>Chính sách đổi trả linh hoạt giúp bạn yên tâm khi mua sắm
									tại PNJ.</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-lg-5">
					<div class="img-wrap">
						<img src="images/trangchu.png" alt="Image" class="img-fluid">
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- End Why Choose Us Section -->

	<!-- Start We Help Section -->
	<div class="we-help-section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-7 mb-5 mb-lg-0">
					<div class="imgs-grid">
						<div class="grid grid-1">
							<img src="images/trangchu1.jpg" alt="Untree.co">
						</div>
						<div class="grid grid-2">
							<img src="images/trangchu2.jpg" alt="Untree.co">
						</div>
						<div class="grid grid-3">
							<img src="images/trangchu3.jpg" alt="Untree.co">
						</div>
					</div>
				</div>
				<div class="col-lg-5 ps-lg-5">
					<h2 class="section-title mb-4">Chúng Tôi Giúp Bạn Chọn Trang
						Sức Hoàn Hảo</h2>
					<p>PNJ mang đến những mẫu trang sức hiện đại, tinh tế và đẳng
						cấp. Khám phá sự đa dạng và chất lượng tuyệt vời từ bộ sưu tập của
						chúng tôi.</p>

					<ul class="list-unstyled custom-list my-4">
						<li>Trang sức được chế tác từ những chất liệu quý hiếm</li>
						<li>Thiết kế độc đáo, phù hợp với xu hướng thời trang</li>
						<li>Dịch vụ chăm sóc khách hàng tận tâm và chuyên nghiệp</li>
						<li>Cam kết chất lượng và giá trị bền vững</li>
					</ul>
					<p>
						<a href="#" class="btn">Khám Phá</a>
					</p>
				</div>
			</div>
		</div>
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
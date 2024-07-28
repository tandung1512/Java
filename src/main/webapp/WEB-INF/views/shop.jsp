<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<!-- Tiny Slider CSS -->
<link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<title>Shop</title>
<style>
    .search-section {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-bottom: 20px;
        flex-wrap: wrap;
    }
    .search-bar {
        position: relative;
        width: 300px;
    }
    .search-bar input {
        width: 100%;
        padding: 10px 40px 10px 10px;
        border-radius: 20px;
        border: 1px solid #ccc;
    }
    .search-bar button {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        cursor: pointer;
    }
    .search-bar i {
        font-size: 18px;
    }
    .filter-section {
        display: flex;
        align-items: center;
        gap: 20px;
        flex-wrap: wrap;
    }
    .category-list select, .price-range input {
        padding: 10px;
        border-radius: 20px;
        border: 1px solid #ccc;
    }
    .category-list, .price-range, .sort-options, .color-section {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .color-options {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .color-options input[type="checkbox"] {
        display: none;
    }
    .color-options input[type="checkbox"]:checked + label {
        transform: scale(1.2);
    }
    .color-options label {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        cursor: pointer;
    }
    .color-options label[for="color-white"] {
        background-color: white;
        border: 1px solid #ccc;
    }
    .color-options label[for="color-black"] {
        background-color: black;
    }
    .sort-options button {
        background: none;
        border: 1px solid #ccc;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        font-size: 20px;
        padding: 0;
    }
    .sort-options button:hover {
        transform: scale(1.2);
    }
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        margin-top: 20px;
    }
    .pagination a {
        padding: 10px 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-decoration: none;
        color: #000;
    }
    .pagination a.active {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
    }
    .pagination a:hover {
        background-color: #0056b3;
        color: white;
        border-color: #0056b3;
    }
      .product-thumbnail {
        width: 100%;
        height: 250px; /* Adjust the height as needed */
        object-fit: cover; /* Ensures the image covers the area, maintaining aspect ratio */
    }
    .add-to-cart-button {
        margin-top: 10px;
    }
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
                        <h1 style="color: black;">Shop</h1>
                        <p style="color: black; class="mb-4">Let's shopping at Xiaomi.</p>
                    </div>
                </div>
               
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <!-- Start Search Section -->
    <div class="container search-section mt-4">
        <form method="get" action="/shop" class="search-bar">
            <input type="text" name="keywords" value="${keywords}" placeholder="Tìm kiếm sản phẩm...">
            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
        <form method="get" action="/shop" class="filter-section">
            <div class="category-list">
                <select name="category">
                    <option value="">All Category</option>
                    <option value="Nhẫn" ${param.category == 'Xiaomi' ? 'selected' : ''}>Xiaomi</option>
                    <option value="Dây chuyền" ${param.category == 'Redmi' ? 'selected' : ''}>Redmi</option>
                    <option value="Bông tai" ${param.category == 'Poco' ? 'selected' : ''}>Poco</option>
                </select>
            </div>
            <div class="price-range">
                <input type="number" name="minPrice" placeholder="Min" min="0" value="${param.minPrice}">
                <input type="number" name="maxPrice" placeholder="Max" min="0" value="${param.maxPrice}">
            </div>
            <div class="sort-options">
                <button type="submit" name="sortOrder" value="asc">
                    <i class="fa-solid fa-arrow-up fa-bounce"></i>
                </button>
                <button type="submit" name="sortOrder" value="desc">
                    <i class="fa-solid fa-arrow-down fa-bounce"></i>
                </button>
            </div>
             <div class="color-section">
        <label>Color</label>
        <div class="color-options">
            <input type="checkbox" id="color-white" name="color" value="white" ${param.color.contains('white') ? 'checked' : ''}>
            <label for="color-white"></label>
            <input type="checkbox" id="color-black" name="color" value="black" ${param.color.contains('black') ? 'checked' : ''}>
            <label for="color-black"></label>
        </div>
    </div>
            <button type="submit"><i class="fa-solid fa-filter"></i></button>
        </form>
    </div>
    <!-- End Search Section -->

   <div class="untree_co-section product-section before-footer-section">
    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${page.content}">
                <div class="col-12 col-md-6 col-lg-4 mb-5 text-center">
                    <a class="product-item" href="${pageContext.request.contextPath}/product/${product.productId}">
                        <img src="/images/${product.image1}" class="img-fluid product-thumbnail">
                        <h3 class="product-title">${product.name}</h3>
                        <strong class="product-price">
                            <fmt:formatNumber value="${product.price}" pattern="###,###" /> VND
                        </strong>
                    </a>
                    <form action="${pageContext.request.contextPath}/cart/add" method="post">
                        <input type="hidden" name="productId" value="${product.productId}" />
                        <input type="hidden" name="quantity" value="1" />
                        <button type="submit" class="btn btn-primary add-to-cart-button">Add to shopping cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

    
    <!-- Pagination Section -->
    <div class="pagination">
            <a href="/shop?page=0">First</a>
            <a href="/shop?page=${page.number-1}">Previous</a>
            <a href="/shop?page=${page.number+1}">Next</a>
            <a href="/shop?page=${page.totalPages-1}">Last</a>
        </div>
    <!-- End Pagination Section -->

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- End Footer Section -->

    <!-- Bootstrap Bundle JS -->
    <script src="https://kit.fontawesome.com/7ac34e99b9.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <!-- Tiny Slider JS -->
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>

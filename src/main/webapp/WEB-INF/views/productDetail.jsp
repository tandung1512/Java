<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Detail</title>
    
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        .product-image {
            position: relative;
            overflow: hidden;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 5px;
            background-color: #f8f8f8;
            width: 100%;
            height: 400px; /* Fixed height for main product image */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .product-image img {
            max-width: 100%;
            max-height: 100%;
            transition: transform 0.5s ease;
        }

        .product-image:hover img {
            transform: scale(1.3);
        }

        .thumbnail-images img {
            cursor: pointer;
            transition: transform 0.3s ease;
            margin: 5px;
            width: 60px;
            height: 60px; /* Fixed size for thumbnails */
        }

        .thumbnail-images img:hover {
            transform: scale(1.3);
        }

        .product-details {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-details h2 {
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }

        .product-details p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }

        .product-details p strong {
            color: #333;
        }

        .btn-animated {
            position: relative;
            transition: background-color 0.3s, transform 0.3s;
        }

        .btn-animated:active {
            transform: scale(0.95);
            background-color: #0056b3;
        }
    </style>
</head>
<body>
  <jsp:include page="menu.jsp"></jsp:include>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-6">
                <div class="product-image">
                    <img src="${pageContext.request.contextPath}/images/${product.image1}" alt="Product Image" class="img-fluid">
                </div>
                <div class="d-flex justify-content-center mt-3 thumbnail-images">
                    <c:if test="${not empty product.image2}">
                        <img src="${pageContext.request.contextPath}/images/${product.image2}" class="rounded-2" alt="Thumbnail">
                    </c:if>
                    <c:if test="${not empty product.image3}">
                        <img src="${pageContext.request.contextPath}/images/${product.image3}" class="rounded-2" alt="Thumbnail">
                    </c:if>
                    <c:if test="${not empty product.image4}">
                        <img src="${pageContext.request.contextPath}/images/${product.image4}" class="rounded-2" alt="Thumbnail">
                    </c:if>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-details">
                   
                    <h2>${product.name}</h2>
                    <p><strong>Price:</strong> ${product.price} đ</p>
                    <p><strong>Quantity:</strong> ${product.quantity}</p>
                    <p><strong>Color:</strong> ${product.color}</p>
                    <p><strong>Manufactor:</strong> ${product.manufactor}</p>
                    <p><strong>Desc:</strong> ${product.description}</p>
                    <form action="${pageContext.request.contextPath}/cart/add" method="post">
                        <input type="hidden" name="productId" value="${product.productId}" />
                        <input type="hidden" name="quantity" value="1" />
                        <!-- Giá trị mặc định là 1, bạn có thể thêm input để người dùng chọn số lượng -->
                        <button type="submit" class="btn btn-primary btn-animated" style="margin-left: 50px">Add to shopping cart</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Các đoạn mã JavaScript hoặc thư viện khác nếu cần -->
    <jsp:include page="footer.jsp"></jsp:include>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const thumbnails = document.querySelectorAll(".thumbnail-images img");
            const mainImage = document.querySelector(".product-image img");

            thumbnails.forEach(thumbnail => {
                thumbnail.addEventListener("click", function() {
                    mainImage.src = this.src;
                });
            });
        });
    </script>
    <!-- Bootstrap Bundle JS hoặc các JS khác nếu cần -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>

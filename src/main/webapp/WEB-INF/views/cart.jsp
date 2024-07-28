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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<!-- Tiny Slider CSS -->
<link href="${pageContext.request.contextPath}/css/tiny-slider.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<title>Shopping Cart</title>
</head>

<body>
    <!-- Start Header/Navigation -->
    <jsp:include page="menu.jsp"></jsp:include>
    <!-- End Header/Navigation -->

    <div class="container mt-5">
        <h1>Your shopping cart</h1>
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Act</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cart}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart/update"
                                method="post" class="form-inline">
                                <input type="hidden" name="productId"
                                    value="${item.product.productId}" /> <input type="number"
                                    name="quantity" value="${item.quantity}" class="form-control"
                                    style="width: 60px; display: inline-block; margin-right: 5px;"
                                    min="1" />
                                <button type="submit" class="btn btn-primary" style="float: right">Update</button>
                            </form>
                        </td>
                        <td><fmt:formatNumber value="${item.product.price}"
                                pattern="###,###" /> VND</td>
                        <td><fmt:formatNumber
                                value="${item.product.price * item.quantity}" pattern="###,###" />
                            VND</td>
                        <td><a
                            href="${pageContext.request.contextPath}/cart/delete?productId=${item.product.productId}"
                            class="btn btn-danger">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-right">
            <strong>Total: <fmt:formatNumber value="${totalPrice}" pattern="###,###" /> VND</strong>
        </div>
        <form action="${pageContext.request.contextPath}/checkout" method="get">
            <div class="text-right mt-3">
                <button type="submit" class="btn btn-success" style="float: right; margin-top: -50px;">Proceed to payment</button>
            </div>
        </form>
    </div>

    <!-- Start Footer Section -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- End Footer Section -->

    <!-- Bootstrap Bundle JS -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <!-- Tiny Slider JS -->
    <script src="${pageContext.request.contextPath}/js/tiny-slider.js"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/custom.js"></script>
</body>
</html>

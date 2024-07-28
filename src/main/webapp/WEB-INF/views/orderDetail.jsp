<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/png" href="images/logo-tiltle.png" />
<title>Order Detail</title>

<style>
    body {
        background-color: #f8f9fa; /* Màu xám nhẹ */
    }

    .container {
        background-color: #fff; /* Màu nền trắng */
        padding: 20px; /* Khoảng cách lề */
        border-radius: 5px; /* Bo góc */
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
    }

    h2 {
        color: #007bff; /* Màu văn bản xanh dương */
    }

    table {
        background-color: #fff; /* Màu nền trắng */
    }

    th, td {
        text-align: center; /* Canh giữa nội dung trong cột */
    }

    th {
        background-color: #007bff; /* Màu nền xanh dương */
         /* Màu văn bản trắng */
    }
	.title-table{
		text-align: center;
	}
</style>
<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <h2>Order Detail</h2>
        <p> ID  order: ${order.id}</p>
        <p>Order date : <fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy" /></p>
        <p>Total<fmt:formatNumber value="${order.price}" pattern="###,###" /> VND</p>
        <p>Order note: ${order.orderNote}</p>
         <p>Status: ${order.orderStatus == 0 ?  "Order Not Confirmed" : "Order Confirmed"}</p>  

        <h3>Items</h3>
        <table class="table table-bordered">
            <thead>
                <tr >
                    <th class="title-table">Product</th>
                    <th class="title-table">Quantity</th>
                    <th class="title-table">Price</th>
                    <th class="title-table">Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${order.orderItems}">
                    <tr>
                        <td>${item.product.name}</td>
                        <td>${item.quantity}</td>
                        <td><fmt:formatNumber value="${item.product.price}" pattern="###,###" /> VND</td>
                        <td><fmt:formatNumber value="${item.product.price * item.quantity}" pattern="###,###" /> VND</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>

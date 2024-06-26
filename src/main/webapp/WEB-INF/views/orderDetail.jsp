<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        <h2>Chi Tiết Đặt Hàng</h2>
        <p> ID  Đơn Hàng: ${order.id}</p>
        <p>Ngày Đặt Hàng : <fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy" /></p>
        <p>Tổng Tiền<fmt:formatNumber value="${order.price}" pattern="###,###" /> VND</p>
        <p> Ghi Chú Đặt Hàng: ${order.orderNote}</p>
       <%--  <p> Tình trạng: ${order.orderStatus == 0 ?  "Chưa Xác Nhận Đơn Hàng" : "Xác Nhận Đơn Hàng"}</p> --%>

        <h3>Mặt hàng	</h3>
        <table class="table table-bordered">
            <thead>
                <tr >
                    <th class="title-table">Sản phẩm</th>
                    <th class="title-table">Số lượng</th>
                    <th class="title-table">Giá</th>
                    <th class="title-table">Tổng cộng</th>
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

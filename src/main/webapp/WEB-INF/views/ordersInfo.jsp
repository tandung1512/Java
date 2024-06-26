<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="${pageContext.request.contextPath}/css/tiny-slider.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-5">
        <h2>Đơn hàng của tôi</h2>
        <c:forEach var="order" items="${orders}">
            <div class="card mb-3">
                <div class="card-header">
                     ID Đơn Hàng: ${order.id}
                </div>
                <div class="card-body">
                    <h5 class="card-title">Tổng Giá: <fmt:formatNumber value="${order.price}" pattern="###,###" /> VND</h5>
                    <p class="card-text"> Ngày đặt hàng: <fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy" /></p>
                    <%-- <p class="card-text">Tình trạng: ${order.orderStatus == 0 ? "Chưa Xác Nhận Đơn Hàng" : "Xác Nhận Đơn Hàng"}</p> --%>
                 
                    <a href="${pageContext.request.contextPath}/order?orderId=${order.id}" class="btn btn-primary">Xem Chi Tiết Đơn Hàng</a>
                </div>
            </div>
        </c:forEach>
    </div>
<jsp:include page="footer.jsp"></jsp:include>
    <!-- Bootstrap Bundle JS -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>

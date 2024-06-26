<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<%-- Store the current request URI --%>
<c:set var="currentURI" value="${pageContext.request.requestURI}" />

<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
	<div class="container">
		<a class="navbar-brand" href="/index">
			<img src="/images/logo-pnj-footer.png" style="width: 20%" alt="Logo">
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
			aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsFurni">
			<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
				<li class="nav-item ${currentURI eq '/index' ? 'active' : ''}">
					<a class="nav-link" href="/index"><s:message code="menu.home"/></a>
				</li>
				<li class="nav-item ${currentURI eq '/shop' ? 'active' : ''}">
					<a class="nav-link" href="/shop"><s:message code="menu.shop"/></a>
				</li>
				
				<li class="nav-item ${currentURI eq '/ordersInfo' ? 'active' : ''}">
					<a class="nav-link" href="/orders"><s:message code="menu.lsmh"/></a>
				</li>
			</ul>

			<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
				<c:if test="${sessionScope.loggedIn != true}">
					<li><a class="nav-link" href="/login"><img src="/images/user.svg"></a></li>
				</c:if>
				<c:if test="${sessionScope.loggedIn == true}">
					<li><a class="nav-link" href="/profile"><img src="/images/user.svg"></a></li>
				</c:if>
				<li><a class="nav-link" href="/cart"><img src="/images/cart.svg"></a></li>
				<c:if test="${sessionScope.loggedIn == true}">
					<li><a class="nav-link" href="/logout"><s:message code="menu.dx"/></a></li>
				</c:if>
				
			</ul>
		 <div class="dropdown ms-3">
                <button class="btn btn-dark dropdown-toggle" type="button" id="languageDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <s:message code="menu.language"/>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="languageDropdown">
                    <li><a class="dropdown-item" href="?lang=vi"><s:message code="menu.vi"/></a></li>
                    <li><a class="dropdown-item" href="?lang=en"><s:message code="menu.en"/></a></li>
                    <li><a class="dropdown-item" href="?lang=ko"><s:message code="menu.ko"/></a></li>
                </ul>
            </div>
		</div>
	</div>
</nav>
<script>
	$(document).ready(function() {
		$("a[href*=lang]").on("click", function() {
			var param = $(this).attr("href");
			$.ajax({
				url : "/home/index" + param,
				success : function() {
					location.reload();
				}
			});
			return false;
		})
	})
</script>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
	 <!doctype html>
	<html lang="en">
	
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Language" content="en">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>- This is an example dashboard created using build-in
		elements and components.</title>
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
	<meta name="description"
		content="This is an example dashboard created using build-in elements and components.">
	<meta name="msapplication-tap-highlight" content="no">
	<link
		href="https://demo.dashboardpack.com/architectui-html-free/main.css"
		rel="stylesheet">
	</head>
	
	<body>
		<div
			class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
			<div class="app-header header-shadow">
				<!-- <div class="app-header__logo">
	                <div class="logo-src"></div>
	                <div class="header__pane ml-auto">
	                    <div>
	                        <button type="button" class="hamburger close-sidebar-btn hamburger--elastic"
	                            data-class="closed-sidebar">
	                            <span class="hamburger-box">
	                                <span class="hamburger-inner"></span>
	                            </span>
	                        </button>
	                    </div>
	                </div>
	            </div> -->
				<div class="app-header__mobile-menu">
					<div>
						<button type="button"
							class="hamburger hamburger--elastic mobile-toggle-nav">
							<span class="hamburger-box"> <span class="hamburger-inner"></span>
							</span>
						</button>
					</div>
				</div>
				<div class="app-header__menu">
					<span>
						<button type="button"
							class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
							<span class="btn-icon-wrapper"> <i
								class="fa fa-ellipsis-v fa-w-6"></i>
							</span>
						</button>
					</span>
				</div>
				<div class="app-header__content">
					<div class="app-header-left">
						<a class="navbar-brand" href="/admin">
			<img src="/images/logo-pnj-footer.png" style="width: 20%" alt="Logo">
					</div>
					<div class="app-header-right">
						<div class="header-btn-lg pr-0">
							<div class="widget-content p-0">
								<div class="widget-content-wrapper">
									<div class="widget-content-left">
										<div class="btn-group">
											<a data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false" class="p-0 btn"> <img width="42"
												class="rounded-circle" src="/images/person_1.jpg"
												alt=""> <i class="fa fa-angle-down ml-2 opacity-8"></i>
											</a>
											<div tabindex="-1" role="menu" aria-hidden="true"
												class="dropdown-menu dropdown-menu-right">
												<button type="button" tabindex="0" class="dropdown-item">User
													Account</button>
												<button type="button" tabindex="0" class="dropdown-item">Settings</button>
												<h6 tabindex="-1" class="dropdown-header">Header</h6>
												<button type="button" tabindex="0" class="dropdown-item">Actions</button>
												<div tabindex="-1" class="dropdown-divider"></div>
												<button type="button" tabindex="0" class="dropdown-item">Dividers</button>
												<c:if test="${sessionScope.loggedIn == true}">
												<li><a class="dropdown-item" href="/logout">Logout</a></li>
											</c:if>
											</div>
										</div>
									</div>
	
	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<div class="app-main">
				<div class="app-sidebar sidebar-shadow">
					<div class="app-header__logo">
						<div class="logo-src"></div>
						<div class="header__pane ml-auto">
							<div>
								<button type="button"
									class="hamburger close-sidebar-btn hamburger--elastic"
									data-class="closed-sidebar">
									<span class="hamburger-box"> <span
										class="hamburger-inner"></span>
									</span>
								</button>
							</div>
						</div>
					</div>
					<div class="app-header__mobile-menu">
						<div>
							<button type="button"
								class="hamburger hamburger--elastic mobile-toggle-nav">
								<span class="hamburger-box"> <span class="hamburger-inner"></span>
								</span>
							</button>
						</div>
					</div>
					<div class="app-header__menu">
						<span>
							<button type="button"
								class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
								<span class="btn-icon-wrapper"> <i
									class="fa fa-ellipsis-v fa-w-6"></i>
								</span>
							</button>
						</span>
					</div>
					<div class="scrollbar-sidebar">
						<div class="app-sidebar__inner">
							<ul class="vertical-nav-menu">
								<li class="app-sidebar__heading">Home</li>
								<li><a href="/admin" class="mm-active"> <i
										class="metismenu-icon pe-7s-rocket"></i> Home
								</a></li>
								<li class="app-sidebar__heading">System Management</li>
								<li><a href="#"> <i class="metismenu-icon pe-7s-diamond"></i>
										Management<i
										class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
								</a>
									<ul>
										<li><a href="/admin/ProductManagement"> <i
												class="metismenu-icon"></i> Product Management
										</a></li>
										<li><a href="/admin/CategoryManagement"> <i
												class="metismenu-icon"> </i>Category Management
							
										</a></li>
										<li><a href="/admin/UserManagement"> <i
												class="metismenu-icon"> </i>User Management
										</a></li>
	
	
	
	
									</ul></li>
								<li class="app-sidebar__heading">Reports System</li>
							<li><a href="/admin/Report" target=""> <i
									> </i> Reports
							</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="app-main__outer">
					<div class="app-main__inner">
				
	
	
	
						<div class="row">
							<div class="col-md-12">
								<div class="main-card mb-3 card">
									<div class="card-header">Category Management</div>
									<div class="table-responsive">
										
										<div class="table-responsive">
										<jsp:include page="formCategoryManagement.jsp"></jsp:include>
										</div>
										<table
											class="align-middle mb-0 table table-borderless table-striped table-hover">
											<thead>
												<tr>
													<th class="text-center">Id</th>
													<th class="">Name</th>
													<th>Create Date</th>
												</tr>
											</thead>
											<c:forEach var="category" items="${cateitems}">
												<tr>
													<td>${category.category_id}</td>
													<td>${category.name}</td>
	
													<td><fmt:formatDate value="${category.createDate}"
															pattern="dd/MM/yyyy" /></td>
	
	
													<td><a
														href="/admin/CategoryManagement/edit/${category.category_id}">Edit</a>
														<a
														href="/admin/CategoryManagement/delete/${category.category_id}">Delete</a></td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div class="d-block text-center card-footer">
	
										<button class="btn-wide btn btn-success">Last</button>
										<button class="btn-wide btn btn-success">Back</button>
										<button class="btn-wide btn btn-success">Next</button>
										<button class="btn-wide btn btn-success">First</button>
									</div>
								</div>
							</div>
						</div>
	
					</div>
	
	
				</div>
				<script type="text/javascript"
					src="https://demo.dashboardpack.com/architectui-html-free/assets/scripts/main.js"></script>
	</body>
	
	</html>
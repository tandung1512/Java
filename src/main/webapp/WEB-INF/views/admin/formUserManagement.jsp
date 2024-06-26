<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<style>
    /* CSS tùy chỉnh cho form */
    .custom-form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        background-color: #f9f9f9;
    }

    .custom-input {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #fff;
        font-size: 16px;
    }

    .custom-button {
        width: 48%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50; /* Màu xanh lá cây */
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s; /* Thêm transition cho hiệu ứng */
    }

    .custom-button:hover {
        background-color: #45a049; /* Màu xanh lá cây nhạt */
        transform: scale(1.05); /* Phóng to nút khi hover */
    }
</style>

<form:form action="/admin/SearchUserManagement" modelAttribute="accitem" method="post" class="custom-form">
    <form:input path="username" placeholder="Tài Khoản" class="custom-input"/>
     <form:input path="password" placeholder="Mật Khẩu" class="custom-input"/> 
    <form:input path="fullname" placeholder="Họ và tên" class="custom-input"/>
    <form:input path="phonenumber"  placeholder="Số điện thoại" class="custom-input"/>
    <form:input path="email"  placeholder="Email" class="custom-input"/>
    
    <input formaction="/admin/UserManagement/create" type="submit" class="custom-button" value="Add Product">
    <input formaction="/admin/UserManagement/create" type="submit" class="custom-button" value="Update Product">
    <hr>
</form:form>

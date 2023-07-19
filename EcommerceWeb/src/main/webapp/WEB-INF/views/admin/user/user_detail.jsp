<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%! int i; %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Thêm người dùng</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">
    <link rel="shortcut icon" href="favicon.ico">

    <!-- App CSS -->
    <link id="theme-style" rel="stylesheet" href="/ecommerce/admin/css/portal.css">

</head>
<body class="app">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"></jsp:include>

<div class="app-wrapper">

        <div class="app-content pt-3 p-md-3 p-lg-4">
            <ul class="list-group">
                <li class="list-group-item">Họ và tên: ${user.userFullName}</li>
                <li class="list-group-item">UserName: ${user.userName}</li>
                <li class="list-group-item">Email: ${user.userEmail}</li>
                <li class="list-group-item">Địa chỉ: ${user.userAddress}</li>
                <li class="list-group-item">Số điện thoại: ${user.userPhone}</li>
                <li class="list-group-item">Ảnh:
                    <c:if test = "${not empty user.userImage}">
                        <img src="data:image/jpg;base64,${user.userImage}" alt="avatar"
                              width="100" height="100">
                    </c:if>
                    <c:if test = "${empty user.userImage}">
                        <img src="https://img.wattpad.com/8f19b412f2223afe4288ed0904120a48b7a38ce1/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f5650722d38464e2d744a515349673d3d2d3234323931353831302e313434336539633161633764383437652e6a7067?s=fit&w=720&h=720" alt="avatar"
                              width="100" height="100">
                    </c:if>
<%--                    <img  width="100" height="100" src="data:image/jpg;base64,${user.userImage}">--%>
                </li>
            </ul>
        </div>

    <%--</form>--%>
    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"></jsp:include>

</div><!--//app-wrapper-->

<script defer src="/ecommerce/admin/plugins/fontawesome/js/all.min.js"></script>
<script src="/ecommerce/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="/ecommerce/paging/jquery.twbsPagination.js"></script>
<!-- Javascript -->
<script src="/ecommerce/admin/plugins/popper.min.js"></script>


<!-- Page Specific JS -->
<script src="/ecommerce/admin/js/app.js"></script>
</body>
</html>
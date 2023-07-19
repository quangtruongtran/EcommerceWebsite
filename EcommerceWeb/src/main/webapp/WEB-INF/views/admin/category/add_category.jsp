
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url value="${pageContext.request.contextPath}" var="base" />
<!DOCTYPE HTML>
<html>
<head>
    <title>Thêm Mặt hàng</title>

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
        <form method="POST"
                   action="/ecommerce/admin/category">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Mã mặt hàng</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="categoryCode" value="${category.categoryCode}"/>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Tên mặt hàng</label>
                <input type="text" class="form-control" id="exampleInputPassword1" name="categoryName" value="${category.categoryName}"/>
            </div>
            <input type="hidden"  path="id"/>
            <button type="submit" class="btn btn-primary">Thêm</button>
        </form>
    </div>

    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"></jsp:include>

</div>


<!-- Javascript -->
<script defer src="/ecommerce/admin/plugins/fontawesome/js/all.min.js"></script>
<script src="/ecommerce/admin/plugins/popper.min.js"></script>
<script src="/ecommerce/admin/plugins/bootstrap/js/bootstrap.min.js"></script>



<!-- Page Specific JS -->
<script src="/ecommerce/admin/js/app.js"></script>

</body>
</html>
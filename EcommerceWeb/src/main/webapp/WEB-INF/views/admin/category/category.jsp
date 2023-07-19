<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />

<!DOCTYPE HTML>
<html>
<head>
    <title>Mặt hàng</title>

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
        <c:if test = "${not empty message}">
            <div class="alert alert-danger">
                <strong>${message}</strong>
            </div>
        </c:if>
        <c:if test = "${size < 1}">
        <p>No category<p>
        </c:if>
            <a class="btn btn-primary" href="/ecommerce/admin/category/add" role="button">Tạo mới mặt hàng</a>
            <c:if test = "${size > 0}">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên mặt hàng</th>
                    <th scope="col">Thay đổi</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${categories}" varStatus="loop">
                    <tr>
                        <td>${loop.index+1}</td>
                        <td>${item.categoryName}</td>
                        <td>
                            <c:if test = "${item.categoryActive == true}">
                                <a class="btn btn-primary" href="/ecommerce/admin/category/disable/${item.id}" role="button">Dừng kích họat</a>
                            </c:if>
                            <c:if test = "${item.categoryActive == false}">
                                <a class="btn btn-primary" href="/ecommerce/admin/category/enable/${item.id}" role="button">Kích hoạt</a>
                            </c:if>
                            <a class="btn btn-primary" href="/ecommerce/admin/category/edit/${item.id}" role="button">Cập nhập</a>
                            <a class="btn btn-primary" href="/ecommerce/admin/category/delete/${item.id}" role="button">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            </c:if>

    </div><!--//app-content-->

    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"></jsp:include>

</div><!--//app-wrapper-->

<script defer src="/ecommerce/admin/plugins/fontawesome/js/all.min.js"></script>
<!-- Javascript -->
<script src="/ecommerce/admin/plugins/popper.min.js"></script>
<script src="/ecommerce/admin/plugins/bootstrap/js/bootstrap.min.js"></script>


<!-- Page Specific JS -->
<script src="/ecommerce/admin/js/app.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Liên hệ</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">
    <link rel="shortcut icon" href="favicon.ico">
    <!-- App CSS -->

    <link id="theme-style" rel="stylesheet" href="/ecommerce/admin/css/portal.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"></jsp:include>

<div class="app-wrapper" style="margin-top: 50px">
    <%--    <form action="/ecommerce/admin/product" id="formSubmit" method="get">--%>
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <c:if test = "${size < 1}">
        <p>Không có liên hệ nào hiển thị!<p>
        </c:if>
        <c:if test = "${size > 0}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Email</th>
                <th scope="col">Số điện thoại</th>
                <th scope="col">Chủ đề</th>
                <th scope="col">Chi tiết</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${contacts}" varStatus="loop">
                <tr>
                    <td>${loop.index+1}</td>
                    <td>${item.contactCustomerEmail}</td>
                    <td>${item.contactCustomerPhone}</td>
                    <td>${item.contactSubject}</td>
                    <td>
                        <a class="btn btn-primary" href="/ecommerce/admin/contact/${item.id}" role="button">Chi tiết</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </c:if>

    </div>
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

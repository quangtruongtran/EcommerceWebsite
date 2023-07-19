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
    <title>Hóa đơn</title>

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
    <%--    <form action="/ecommerce/admin/product" id="formSubmit" method="get">--%>
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <form action="/ecommerce/admin/bill/search" method="POST">
            <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="billCode"/>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
        <c:if test = "${not empty message}">
            <div class="alert alert-danger">
                <strong>${message}</strong>
            </div>
        </c:if>
        <c:if test = "${size < 1}">
        <p>Không có bill nào hiển thị!<p>
        </c:if>
        <c:if test = "${size > 0}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Mã hóa đơn</th>
                <th scope="col">Ngày đặt hàng</th>
                <th scope="col">Ngày nhận hàng</th>
                <th scope="col">Tổng tiền</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Chi tiết</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${bills}" varStatus="loop">
                <tr>
                    <td>${loop.index+1}</td>
                    <td>${item.billCode}</td>
                    <td>${item.billOrderDate}</td>
                    <td>
                        <c:if test = "${empty item.billDeliveryDate}">
                        <p>Chờ xử lý<p>
                        </c:if>
                            <c:if test = "${not empty item.billDeliveryDate}">
                            <p>${item.billDeliveryDate}<p>
                            </c:if>
                    </td>
                    <td><fmt:formatNumber type = "number"
                                          maxFractionDigits = "3" value = "${item.billTotalPrice}" />đ</td>
                    <td>
                            <c:if test = "${item.billOrderStatus}">
                            <span style="background-color: #38e138;color: red; font-weight: bold;">Đã được xử lý<span>
                             </c:if>
                            <c:if test = "${not item.billOrderStatus}">
                            <p style="font-weight: bold;">Chờ xử lý<p>
                            </c:if>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="/ecommerce/admin/bill/${item.id}" role="button">Chi tiết</a>
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
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
    <title>Người dùng</title>

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
        <c:if test = "${size < 1}">
        <p>No user<p>
        </c:if>
        <c:if test = "${size > 0}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">UserName</th>
                <th scope="col">Họ và tên</th>
                <th scope="col">Thay đổi</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${users}" varStatus="loop">
                <tr>
                    <td>${loop.index+1}</td>
                    <td>${item.userName}</td>
                    <td>${item.userFullName}</td>
                    <td>
                        <a class="btn btn-primary" href="/ecommerce/admin/user/${item.id}" role="button">Chi tiết</a>
                        <a class="btn btn-primary" href="#" role="button">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        </c:if>

    </div>
        <form
        <c:if test = "${not empty search}">
            action="/ecommerce/admin/user/search" id="formSubmit"
            method="POST">
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="page" name="page"/>
            <input type="hidden" value="${truong}" name="param"/>
        </c:if>
        <c:if test = "${empty search}">
            action="/ecommerce/admin/user" id="formSubmit"
            method="get">
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="page" name="page"/>
        </c:if>
</form>
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
<script type="text/javascript">
    var totalPages = ${totalPages};
    var currentPage = ${page};
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {

                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });
</script>
</body>
</html>
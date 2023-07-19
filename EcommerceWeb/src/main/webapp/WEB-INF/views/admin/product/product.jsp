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
    <title>Sản phẩm</title>

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
        <form action="/ecommerce/admin/product/search" method="POST">
            <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="param" placeholder="Nhập tên sản phẩm"/>
            <input type="hidden" value="1" name="page"/>
            <button type="submit" class="btn btn-primary" style="margin-top: 5px">Search</button>
        </form>
        <c:if test = "${not empty message}">
            <div class="alert alert-danger">
                <strong>${message}</strong>
            </div>
        </c:if>
        <c:if test = "${size < 1}">
        <p>No product<p>
        </c:if>
        <a class="btn btn-primary" href="/ecommerce/admin/product/add" role="button">Tạo mới sản phẩm</a>
        <c:if test = "${size > 0}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Giá</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Ảnh</th>
                <th scope="col">Thay đổi</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${products}" varStatus="loop">
                <tr>
                    <td>${loop.index+1}</td>
                    <td>${item.productName}</td>
                    <td><fmt:formatNumber type = "number"
                                          maxFractionDigits = "3" value = "${item.productPrice}" /></td>
<%--                    <td>${item.productPrice}</td>--%>
                    <td>${item.productQuantity}</td>
<%--                    <td>${item.image}</td>--%>
                    <td><img  width="40" height="40" src="data:image/jpg;base64,${item.image}"></td>
                    <td>
                        <c:if test = "${item.productActive == true}">
                            <a class="btn btn-primary" href="/ecommerce/admin/product/disable/${item.id}" role="button">Ngừng kích hoạt</a>
                        </c:if>
                        <c:if test = "${item.productActive == false}">
                            <a class="btn btn-primary" href="/ecommerce/admin/product/enable/${item.id}" role="button">Kích hoạt</a>
                        </c:if>
                        <c:if test = "${item.productHot == false}">
                            <a class="btn btn-primary" href="/ecommerce/admin/product/hot/${item.id}" role="button">Hot</a>
                        </c:if>
                        <c:if test = "${item.productHot == true}">
                            <a class="btn btn-primary" href="/ecommerce/admin/product/cancelHot/${item.id}" role="button">Tắt Hot</a>
                        </c:if>
                        <a class="btn btn-primary" href="/ecommerce/admin/product/edit/${item.id}" role="button">Cập nhập</a>
                        <a class="btn btn-primary" href="/ecommerce/admin/product/delete/${item.id}" role="button">Xóa</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        </c:if>

    </div>
    <form
    <c:if test = "${not empty search}">
        action="/ecommerce/admin/product/search" id="formSubmit"
        method="POST">
        <ul class="pagination" id="pagination"></ul>
        <input type="hidden" value="" id="page" name="page"/>
        <input type="hidden" value="${truong}" name="param"/>
    </c:if>
        <c:if test = "${empty search}">
            action="/ecommerce/admin/product" id="formSubmit"
            method="get">
            <ul class="pagination" id="pagination" style="margin-left: 40%"></ul>
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
    var totalPages = ${tolalPages};
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
<!DOCTYPE HTML>
<html>
<head>
    <title>Thêm sản phẩm</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="Portal - Bootstrap 5 Admin Dashboard Template For Developers">
    <meta name="author" content="Xiaoying Riley at 3rd Wave Media">
    <link rel="shortcut icon" href="favicon.ico">
    <!-- App CSS -->
    <link id="theme-style" rel="stylesheet" href="/ecommerce/admin/css/portal.css">
    <link rel="icon" href="data:,">
</head>
<body class="app">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"></jsp:include>

<div class="app-wrapper">

    <div class="app-content pt-3 p-md-3 p-lg-4">
        <form method="POST"
                   action="/ecommerce/admin/product" enctype="multipart/form-data">

            <div class="mb-3">
                <label for="name" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="productName" value="${product.productName}"/>
            </div>
            <div class="mb-3">
                <label for="Title" class="form-label">Tiêu đề</label>
                <input type="text" class="form-control" id="Title" aria-describedby="emailHelp" name="productTitle" value="${product.productTitle}"/>
            </div>
            <div class="mb-3">
                <label for="Description" class="form-label">Mô tả</label>
                <textarea type="text" class="form-control" id="Description" aria-describedby="emailHelp" name="productDescription">${product.productDescription}</textarea>
            </div>
            <div class="mb-3">
                <label for="detail" class="form-label">Chi tiết</label>
                <textarea  type="text" class="form-control" id="detail" aria-describedby="emailHelp" name="productDetail">${product.productDetail} </textarea>
            </div>
            <div class="mb-3">
                <label for="Price" class="form-label">Giá</label>
                <input type="text" class="form-control" id="Price" aria-describedby="emailHelp" name="productPrice" value="${product.productPrice}"/>
            </div>
            <div class="mb-3">
                <label for="Quantity" class="form-label">Số lượng</label>
                <input type="text" class="form-control" id="Quantity" aria-describedby="emailHelp" name="productQuantity" value="${product.productQuantity}"/>
            </div>
            <div class="mb-3">
                <label for="Image" class="form-label">Ảnh</label>
                <c:if test = "${not empty product.image}">
                    <img  width="40" height="40" src="data:image/jpg;base64,${product.image}">
                </c:if>

                <input type="file" id="Image" class="form-control" name="productImage"/>
            </div>
            <div class="mb-3">
                <label for="categoryCode" class="form-label">Loại mặt hàng</label>
                <select name="categoryCode" id="categoryCode">
                    <option value="">Chọn mặt hàng</option>
                    <c:forEach var="item" items="${categories}" varStatus="loop">
                        <option value="${item.categoryCode}">${item.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="branchName" class="form-label">Hãng</label>
                <select name="branchCode" id="branchName">
                    <option value="">Chọn hãng</option>
                    <c:forEach var="item" items="${branch}" varStatus="loop">
                        <option value="${item.branchCode}" >${item.branchName}</option>
                    </c:forEach>
                </select>
            </div>

            <input type="hidden"  name="id" value="${product.id}"/>
            <button type="submit" class="btn btn-primary">Thêm</button>
        </form>

    </div>

    <jsp:include page="/WEB-INF/views/common/admin/footer.jsp"></jsp:include>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script defer src="/ecommerce/admin/plugins/fontawesome/js/all.min.js"></script>
<!-- Javascript -->
<script src="/ecommerce/admin/plugins/popper.min.js"></script>
<script src="/ecommerce/admin/plugins/bootstrap/js/bootstrap.min.js"></script>


<!-- Page Specific JS -->
<script src="/ecommerce/admin/js/app.js"></script>
<script src="/ecommerce/ckeditor/ckeditor.js"></script>
<script>
    var editor1 = '';
    var editor2 = '';
    $(document).ready(function(){
        editor1 = CKEDITOR.replace( 'detail');
        editor2 = CKEDITOR.replace( 'Description');
    });
</script>
</body>
</html>
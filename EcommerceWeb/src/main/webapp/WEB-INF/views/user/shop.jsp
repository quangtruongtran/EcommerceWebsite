<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Shop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/ecommerce/user/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/ecommerce/user/css/style.css" rel="stylesheet">

</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<!-- Shop Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <form action="/ecommerce/product/filter" method="POST">
                    <h5 class="font-weight-semi-bold mb-4">Lọc theo giá
                        <button type="Submit" class="btn btn-primary" style="margin-left: 15px; border-radius: 5px; width: 60px">Lọc</button>
                    </h5>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" id="5tr" name="price" value="1">
                        <label for="5tr">Dưới 5 triệu</label><br>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" id="5den10" name="price" value="2">
                        <label for="5den10">5 triệu đến 10 triệu</label><br>                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" id="10den15" name="price" value="3">
                        <label for="10den15">10 triệu đến 15 triệu</label><br>                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" id="15den20" name="price" value="4">
                        <label for="15den20">15 triệu đến 20 triệu</label><br>                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" id="20den25" name="price" value="5">
                        <label for="20den25">20 triệu đến 25 triệu </label><br>                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="radio" id="25den30" name="price" value="6">
                        <label for="25den30">25 triệu đến 30 triệu</label><br>
                    </div>

            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Chọn theo hãng</h5>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="SAMSUNG" name="branch" value="SAMSUNG">
                    <label for="SAMSUNG">Hãng SamSung</label><br>
                </div>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="DELL" name="branch" value="DELL">
                    <label for="DELL">Hãng Dell</label><br>
                </div>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="ASUS" name="branch" value="ASUS">
                    <label for="ASUS">Hãng Asus</label><br>
                </div>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="HP" name="branch" value="HP">
                    <label for="HP">Hãng HP</label><br>
                </div>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="LG" name="branch" value="LG">
                    <label for="LG">Hãng LG</label><br>
                </div>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="LOGITECH" name="branch" value="LOGITECH">
                    <label for="LOGITECH">Hãng Logitech</label><br>
                </div>
                <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                    <input type="radio" id="APPLE" name="branch" value="APPLE">
                    <label for="APPLE">Hãng Apple</label><br>
                </div>
            </div>
                    <input type="hidden" value="${categoryId}" name="categoryId"/>
                </form>
        </div>
        <!-- Shop Sidebar End -->
        </div>

        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="/ecommerce/product/search" method="POST" >
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Tìm kiếm theo tên sản phẩm" name="param" style="width: 400px">
                                <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                </div>
                            </div>
                            <input type="hidden" value="1" name="page"/>
                            <button type="submit" class="btn btn-primary" style="border-radius: 25px; margin-top: 10px">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
                <c:forEach var="item" items="${products}">
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="data:image/jpg;base64,${item.image}" alt="" style="height: 176px">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${item.productName}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6><fmt:formatNumber type = "number"
                                                          maxFractionDigits = "3" value = "${item.productPrice}" />đ</h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="/ecommerce/product/${item.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a data-value="${item.id}" class="btn btn-sm text-dark p-0 btnAddToCart"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <form
                    <c:if test = "${not empty price || not empty branch }">
                        action="/ecommerce/product/filter" id="formSubmit"
                        method="POST">
                        <ul class="pagination" id="pagination"></ul>
                        <input type="hidden" value="" id="page" name="page"/>
                        <input type="hidden" value="${price}" name="price"/>
                        <input type="hidden" value="${branch}" name="branch"/>
                        <input type="hidden" value="${categoryId}" name="categoryId"/>
                    </c:if>
            <c:if test = "${empty price && empty branch }">
                    action="/ecommerce/category" id="formSubmit"
                    method="GET">
                <ul class="pagination" id="pagination"></ul>
                <input type="hidden" value="" id="page" name="page"/>
                <input type="hidden" value="${categoryId}" id="category" name="categoryId"/>
            </c:if>
            </form>

        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->

<form
        <c:if test = "${not empty search}">
            action="/ecommerce/product/search" id="formSubmitSearch"
            method="POST">
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="page" name="page"/>
            <input type="hidden" value="${truong}" name="param"/>
        </c:if>
        <c:if test = "${empty search}">
            action="/ecommerce/category" id="formSubmit"
            method="GET">
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="page" name="page"/>
            <input type="hidden" value="${categoryId}" id="category" name="categoryId"/>
        </c:if>


</form>
<!-- Footer Start -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- JavaScript Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ecommerce/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/ecommerce/user/lib/easing/easing.min.js"></script>
<script src="/ecommerce/user/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/ecommerce/paging/jquery.twbsPagination.js"></script>
<script src="/ecommerce/user/js/main.js"></script>
<script type="text/javascript">
    if(${not empty search}){
        var totalPages = ${toltalPages};
        var currentPage = ${page};
        $(function () {
            window.pagObj = $('#pagination').twbsPagination({
                totalPages: totalPages,
                visiblePages: 5,
                startPage: currentPage,
                onPageClick: function (event, page) {
                    if (currentPage != page) {

                        $('#page').val(page);
                        $('#formSubmitSearch').submit();
                    }
                }
            });
        });
    } else {
        var totalPages = ${toltalPages};
        var currentPage = ${page};
        $(function () {
            window.pagObj = $('#pagination').twbsPagination({
                totalPages: totalPages,
                visiblePages: 5,
                startPage: currentPage,
                onPageClick: function (event, page) {
                    if (currentPage != page) {

                        $('#page').val(page);
                        $('#formSubmit').submit();
                    }
                }
            });
        });
    }

</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('.btnAddToCart').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                url: 'http://localhost:8080/ecommerce/cart',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify($(this).data("value")),
                dataType: 'json',
                success: function (data, textStatus) {
                    document.getElementById("SLGH").innerText = data;
                    console.log(data);
                },
                error: function (data) {
                    if(data.statusText === "parsererror"){
                        window.location.href = "http://localhost:8080/ecommerce/login";
                    }
                }
            });
        });
    });

</script>
</body>

</html>
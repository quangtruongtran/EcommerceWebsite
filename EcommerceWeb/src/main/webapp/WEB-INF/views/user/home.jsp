<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
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
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--%>
    <!-- Customized Bootstrap Stylesheet -->
    <link href="/ecommerce/user/css/style.css" rel="stylesheet">
</head>
<body>
<!-- Topbar Start -->
<%--<%@include file="/common/header.jsp" %>--%>
<!-- Navbar End -->
<div class="container-fluid">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">Câu hỏi</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Giúp đỡ</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Hỗ trợ</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <security:authorize access = "isAnonymous()">
                <div class="d-inline-flex align-items-center">
                    <a class="nav-item nav-link" href="/ecommerce/login">Đăng nhập</a>
                    <a class="nav-item nav-link" href="/ecommerce/register">Đăng ký</a>
                </div>
            </security:authorize>
            <security:authorize access = "isAuthenticated()">
                <div class="d-inline-flex align-items-center">
                    <a class="nav-item nav-link" href="/ecommerce/user-profile">Xin chào <security:authentication property="principal.username"/></a></li>
                    <a class="nav-item nav-link" href="/ecommerce/logout">Thoát</a>
                </div>
            </security:authorize>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
            </a>
        </div>
        <security:authorize access = "isAuthenticated()">
            <div class="col-lg-6 col-6 text-right">
                <a href="" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge" id="SLGH">${sessionScope.cartQuantity}</span>
                </a>
            </div>
        </security:authorize>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Chọn mặt hàng</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <div class="collapse navbar show navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                <div class="navbar-nav w-100 overflow-hidden" id="clickhere" >
                    <c:forEach var="item" items="${categories}">
                        <a href="/ecommerce/category?categoryId=${item.id}" class="nav-item nav-link">${item.categoryName}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/ecommerce" class="nav-item nav-link active">Trang chủ</a>
                        <a href="/ecommerce/category?categoryId=9" class="nav-item nav-link">Shop</a>
                        <a href="/ecommerce/cart" class="nav-item nav-link">Giỏ hàng</a>
                        <a href="/ecommerce/order-detail" class="nav-item nav-link">Đơn đặt hàng</a>
                        <a href="/ecommerce/contact" class="nav-item nav-link">Liên hệ</a>
                    </div>
                </div>
            </nav>
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" style="height: 410px;">
                        <img class="img-fluid" src="https://laptops.vn/uploads/1920_x_659_1614062618.jpg" alt="Image">
                    </div>
                    <div class="carousel-item" style="height: 410px;">
                        <img class="img-fluid" src="https://cdn.tgdd.vn/Files/2012/10/04/534097/ImageAttach/banner_kmlatop10_775x295.jpg" alt="Image">
                    </div>
                    <div class="carousel-item" style="height: 410px;">
                        <img class="img-fluid" src="https://cdn.fastcare.vn/fastcare/2023/05/banner-mainslide-fastcare-chao-he-sua-laptop-giam-het-co-1280x542.jpg" alt="Image">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Chất lượng tốt</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Tư vấn miễn phí</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14 Ngày đổi trả</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
            </div>
        </div>
    </div>
</div>


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Sản phẩm nổi bật</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
    <c:forEach var="item" items="${products}">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0" style="height: 313.65px" >
                        <img class="img-fluid w-100" src="data:image/jpg;base64,${item.image}" alt="" >
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${item.productName}</h6>
                        <div class="d-flex justify-content-center">
                            <h6> <fmt:formatNumber type = "number"
                                              maxFractionDigits = "3" value = "${item.productPrice}"/>đ</h6>
                        </div>
                    </div>
                    <input type="hidden" value="${item.id}" id="idProduct" name="id"/>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                        <a href="/ecommerce/product/${item.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết</a>
                        <a  data-value="${item.id}" class="btn btn-sm text-dark p-0 btnAddToCart" ><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
                    </div>
                </div>
            </div>
    </c:forEach>
    </div>
    <form
                action="/ecommerce" id="formSubmit"
                method="GET">
                <ul class="pagination" id="pagination" style="margin-left: 40%"></ul>
                <input type="hidden" value="" id="page" name="page"/>
    </form>
</div>

<!-- Products End -->



<!-- Vendor Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel vendor-carousel">
                <div class="vendor-item border p-4">
                    <img src="https://www.lg.com/vn/ZEE%20x%20LG/Retailer/logo.jpg" alt="" height="150px">
                </div>
                <div class="vendor-item border p-4">
                    <img src="https://cdn.tgdd.vn/Files/2018/06/17/1095910/dien-thoai-asus-la-thuong-hieu-cua-nuoc-nao-san-xuat-o-dau--8.jpg" alt="" height="150px">
                </div>
                <div class="vendor-item border p-4">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/48/Dell_Logo.svg" alt="" height="150px">
                </div>
                <div class="vendor-item border p-4">
                    <img src="data:image/png;base64,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" alt="" height="150px">
                </div>
                <div class="vendor-item border p-4">
                    <img src="https://cdn11.dienmaycholon.vn/filewebdmclnew/public//userupload/images/nhung-quy-dinh-ve-bao-hanh-san-pham-tivi-samsung-b%E1%BA%A1n-nen-biet-1.png" alt="" height="150px">
                </div>
                <div class="vendor-item border p-4">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Apple_logo_grey.svg/1200px-Apple_logo_grey.svg.png" alt="" height="150px">
                </div>
                <div class="vendor-item border p-4">
                    <img src="data:image/png;base64,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" alt="" height="150px">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Vendor End -->


<!-- Footer Start -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- JavaScript Libraries -->
<%--<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ecommerce/user/lib/easing/easing.min.js"></script>
<script src="/ecommerce/user/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/ecommerce/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/ecommerce/paging/jquery.twbsPagination.js"></script>
<!-- Template Javascript -->
<script src="/ecommerce/user/js/main.js" type="text/javascript"></script>

<script type="text/javascript">
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
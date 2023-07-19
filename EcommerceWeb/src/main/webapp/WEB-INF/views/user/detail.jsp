<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết sản phẩm</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <link href="/ecommerce/user/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <link href="/ecommerce/user/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="/ecommerce/user/css/style.css" rel="stylesheet">
</head>

<body>
<!-- Topbar Start -->
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- Navbar End -->



<!-- Shop Detail Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col-lg-5 pb-5">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner border">
                    <div class="carousel-item active">
                        <img class="w-100 h-100" src="data:image/jpg;base64,${product.image}" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-7 pb-5">
            <h3 class="font-weight-semi-bold">${product.productTitle}</h3>
            <div class="d-flex mb-3">
                <div class="text-primary mr-2">
                    <small class="fas fa-star"></small>
                    <small class="fas fa-star"></small>
                    <small class="fas fa-star"></small>
                    <small class="fas fa-star-half-alt"></small>
                    <small class="far fa-star"></small>
                </div>
                <small class="pt-1">(50 Đánh giá)</small>
            </div>
            <h3 class="font-weight-semi-bold mb-4">
                <fmt:formatNumber type = "number"
                                  maxFractionDigits = "3" value = "${product.productPrice}" />
            </h3>
            <p class="mb-4">
                ${product.productDescription}
            </p>
            <div class="d-flex align-items-center mb-4 pt-2">
                <a data-value="${product.id}" class="btn btn-primary px-3 btnAddToCart"><i class="fa fa-shopping-cart mr-1" href=""></i>Thêm vào giỏ</a>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            ${product.productDetail}
        </div>
    </div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <c:forEach var="item" items="${relatedProducts}">
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="data:image/jpg;base64,${item.image}" alt="" style="height: 176px">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3">${item.productName}</h6>
                            <div class="d-flex justify-content-center">
<%--                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>--%>
                                <h6><fmt:formatNumber type = "number"
                                                      maxFractionDigits = "3" value = "${item.productPrice}" />đ</h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="/ecommerce/product/${item.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Xem chi tiết</a>
                            <a data-value="${item.id}" class="btn btn-sm text-dark p-0 btnAddToCart"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->


<!-- Footer Start -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ecommerce/user/lib/easing/easing.min.js"></script>
<script src="/ecommerce/user/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/ecommerce/user/js/main.js"></script>
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
                // header:('Content-Type: text/javascript'),

                success: function (data, textStatus) {
                    // $("#SLGH").text(result);
                    // console.log(result);
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
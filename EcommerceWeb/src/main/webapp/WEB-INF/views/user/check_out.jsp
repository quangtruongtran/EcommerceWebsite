<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
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

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/ecommerce/user/css/style.css" rel="stylesheet">
</head>

<body>
<!-- Topbar Start -->
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- Navbar End -->


<!-- Checkout Start -->
<div class="container-fluid pt-5">
    <c:if test = "${not empty noCart}">
        <div class="alert alert-warning" role="alert">
                ${noCart}
        </div>
    </c:if>
    <c:if test = "${empty noCart}">
    <form action="/ecommerce/order" method="post">
    <div class="row px-xl-5">
        <div class="col-lg-6">
            <div class="mb-4">
                <h4 class="font-weight-semi-bold mb-4">Thông tin đặt hàng</h4>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Tên người nhận</label>
                        <input class="form-control" type="text" name="userFullName" readonly value="${user.userFullName}">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Số điện thoại</label>
                        <input class="form-control" type="text" name="billPhone" value="${user.userPhone}">
                    </div>
                    <div class="col-md-12 form-group">
                        <label>Địa chỉ nhận hàng</label>
                        <input class="form-control" type="text" name="billAddress" value="${user.userAddress}">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Thông tin hóa đơn</h4>
                </div>
                <div class="card-body">
                    <h5 class="font-weight-medium mb-3">Sản phẩm</h5>
                    <c:forEach var="item" items="${cartItems}">
                        <div class="d-flex justify-content-between">
                            <p style="width: 350px;">${item.product.productName}</p>
                            <p>Số lượng: ${item.cartQuantity}</p>
                            <p><fmt:formatNumber type = "number"
                                                 maxFractionDigits = "3" value = "${item.product.productPrice}" />đ</p>
                        </div>
                    </c:forEach>
                    <hr class="mt-0">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Tổng tiền sản phẩm</h6>
                        <h6 class="font-weight-medium"><fmt:formatNumber type = "number"
                                                                         maxFractionDigits = "3" value = "${subTotal}" />đ</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">50.000đ</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Tổng tiền</h5>
                        <h5 class="font-weight-bold"><fmt:formatNumber type = "number"
                                                                       maxFractionDigits = "3" value = "${subTotal + 50000}" />đ</h5>
                    </div>
                </div>
            </div>
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Phương thức thanh toán</h4>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="directcheck" checked>
                            <label class="custom-control-label" for="directcheck">Thanh toán khi nhận hàng</label>
                        </div>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <button type="Submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Đặt hàng</button>
                </div>
            </div>
        </div>
    </div>
    </form>
    </c:if>
</div>
<!-- Checkout End -->


<!-- Footer Start -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ecommerce/user/lib/easing/easing.min.js"></script>
<script src="/ecommerce/user/lib/owlcarousel/owl.carousel.min.js"></script>


<!-- Template Javascript -->
<script src="/ecommerce/user/js/main.js"></script>
</body>

</html>
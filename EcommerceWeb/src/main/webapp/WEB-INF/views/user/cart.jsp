<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng</title>
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



<!-- Cart Start -->
<div class="container-fluid pt-5">
    <c:if test = "${not empty mess}">
        <div class="alert alert-warning" role="alert">
                ${mess}
        </div>
    </c:if>
    <c:if test = "${not empty noCart}">
        <div class="alert alert-warning" role="alert" style="width: 400px; margin-left: 40%">
                ${noCart}
        </div>
    </c:if>
    <c:if test = "${empty noCart}">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                <tr>
                    <th>Mặt hàng</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Xóa</th>
                    <th>Cập nhập</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <form action="/ecommerce/cart/update" method="post">
                        <td class="d-flex justify-content-start"><img src="data:image/jpg;base64,${item.product.productImage}" alt="" style="width: 50px;">${item.product.productName}</td>
                        <td class="align-middle"><fmt:formatNumber type = "number"
                                                                   maxFractionDigits = "3" value = "${item.product.productPrice}" />đ</td>
                        <td class="align-middle">
                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-primary btn-minus" type="button" >
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm bg-secondary text-center" name="quantity" value="${item.cartQuantity}">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-primary btn-plus" type="button">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>

                            </div>
                        </td>
                            <input type="hidden" value="${item.product.id}" name="productId"/>
                        <td class="align-middle"><fmt:formatNumber type = "number"
                                                                   maxFractionDigits = "3" value = "${item.cartTotalPrice}" />đ</td>
                        <td class="align-middle"><button  type="button" data-value="${item.product.id}" class="btn btn-sm btn-primary delete"><i class="fa fa-times"></i></button></td>
                        <td class="align-middle"><button type="Submit" class="btn btn-sm btn-primary" style="border-radius:15px">Cập nhập</button></td>
                        </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Tổng tiền</h4>
                </div>
                <div class="card-body">
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
                        <h5 class="font-weight-bold">Tổng cộng</h5>
                        <h5 class="font-weight-bold"><fmt:formatNumber type = "number"
                                                                       maxFractionDigits = "3" value = "${subTotal + 50000}" />đ</h5>
                    </div>
                    <a class="btn btn-block btn-primary my-3 py-3" href="/ecommerce/order">Tiến hành đặt hàng</a>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</div>
<!-- Cart End -->


<!-- Footer Start -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<!-- JavaScript Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/ecommerce/admin/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/ecommerce/user/lib/easing/easing.min.js"></script>
<script src="/ecommerce/user/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/ecommerce/user/js/main.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.delete').on('click', function (e) {
            $.ajax({
                url: 'http://localhost:8080/ecommerce/cart/delete',
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify($(this).data("value")),
                dataType: 'json',

                success: function (result) {
                    window.location.href = "http://localhost:8080/ecommerce/cart";
                },
                error: function (data) {

                }
            });
        });
    });
</script>
</body>
</html>
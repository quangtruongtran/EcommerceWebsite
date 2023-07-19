<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Đơn hàng</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/ecommerce/user/img/favicon.ico" rel="icon">

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
<div class="app-wrapper">
        <div class="app-content pt-3 p-md-3 p-lg-4">
            <table class="table">
                <thead>
                <tr style="text-align: center">
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Ngày đặt hàng</th>
                    <th scope="col">Ngày nhận hàng</th>
                    <th scope="col">Tổng tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${bills}" varStatus="loop">
                <c:forEach var="item1" items="${item.billDetails}" varStatus="loop">
                    <tr style="text-align: center">
                        <td class="d-flex justify-content-start"><img src="data:image/jpg;base64,${item1.product.productImage}" alt="" style="width: 50px; height: 50px">${item1.product.productName}</td>
<%--                        <td>${item1.product.productName}</td>--%>
                        <td>
                            <c:if test = "${item.billOrderStatus}">
                            <p style="background-color: #38e138;color: red; font-weight: bold;">Đã được xử lý<p>
                            </c:if>
                            <c:if test = "${not item.billOrderStatus}">
                            <p style="font-weight: bold;">Chờ xử lý<p>
                            </c:if>
                        </td>
                        <td>${item1.billDetailQuantity}</td>
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
                                              maxFractionDigits = "3" value = "${item1.billDetailTotalPrice}" />đ</td>
                    </tr>
                </c:forEach>
                    <tr style="text-align: center">
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col">Tổng tiền hóa đơn: <fmt:formatNumber type = "number"
                                                                             maxFractionDigits = "3" value = "${item.billTotalPrice}" />đ</th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    <%--</form>--%>
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
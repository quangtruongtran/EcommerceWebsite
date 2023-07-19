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


    <link id="theme-style" rel="stylesheet" href="/ecommerce/admin/css/portal.css">

</head>
<body class="app">
<jsp:include page="/WEB-INF/views/common/admin/header.jsp"></jsp:include>

<div class="app-wrapper">
        <form action="/ecommerce/admin/complete_bill" method="post">
    <div class="app-content pt-3 p-md-3 p-lg-4">
        <div id="print_div">
            <h3 style="margin-left: 35%">Mã hóa đơn: ${bill.billCode}</h3>
        <ul class="list-group">
            <li class="list-group-item">Họ và tên: ${bill.user.userFullName}</li>
            <li class="list-group-item">UserName: ${bill.user.userName}</li>
            <li class="list-group-item">Số điện thoại đặt hàng: ${bill.billPhone}</li>
            <li class="list-group-item">Địa chỉ nhận hàng: ${bill.billAddress}</li>
            <li class="list-group-item">Ngày nhận hàng:
                <c:if test = "${bill.billOrderStatus}">
                    <li class="list-group-item">Ngày nhận hàng: ${bill.billDeliveryDate}</li>
                    </c:if>
            <c:if test = "${!bill.billOrderStatus}">
                <input type="date" data-date="" data-date-format="YYYY MM DD" name="billDeliveryDate">
            </c:if>
            </li>
        </ul>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Tên sản phẩm</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${bill.billDetails}" varStatus="loop">
                <tr>
                    <td>${item.product.productName}</td>
                    <td>${item.billDetailQuantity}</td>
                    <td><fmt:formatNumber type = "number"
                                          maxFractionDigits = "3" value = "${item.billDetailTotalPrice}" />đ</td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td></td>
                <td style="margin-left: 70%">Tổng tiền: <fmt:formatNumber type = "number"
                                                                          maxFractionDigits = "3" value = "${bill.billTotalPrice}" />đ</td>
            </tr>
            </tbody>
        </table>
        </div>
        <input type="hidden" name="id" value="${bill.id}">
        <c:if test = "${bill.billOrderStatus}">
            <button type="submit" class="btn btn-primary" disabled >Đã Hoàn thành</button>
        </c:if>
        <c:if test = "${!bill.billOrderStatus}">
            <button type="submit" class="btn btn-primary" >Hoàn thành</button>
        </c:if>
        <a type="button" class="btn btn-primary" onclick="printdiv('print_div')">In hóa đơn</a>
    </div>
        </form>
    <%--</form>--%>
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
     function printdiv(printpage) {
        var content = document.all.item(printpage).innerHTML;
        document.body.innerHTML = content;
        window.print();
    }
</script>
</body>
</html>
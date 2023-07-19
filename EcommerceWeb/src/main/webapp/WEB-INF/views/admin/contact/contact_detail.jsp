<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="${pageContext.request.contextPath}" var="base" />
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
                <ul class="list-group">
                    <li class="list-group-item">Email: ${contact.contactCustomerEmail}</li>
                    <li class="list-group-item">Số điện thoại: ${contact.contactCustomerPhone}</li>
                    <li class="list-group-item">Chủ đề: ${contact.contactSubject}</li>
                    <li class="list-group-item">Nội dung: ${contact.contactContent}</li>
                </ul>
            </div>
<%--            <input type="hidden" name="id" value="${bill.id}">--%>
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
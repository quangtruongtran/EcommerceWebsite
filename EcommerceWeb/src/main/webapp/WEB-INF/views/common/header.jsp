<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


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
                    <span class="badge" id="SLGH">
                            ${sessionScope.cartQuantity}
                    </span>
                </a>
            </div>
        </security:authorize>
    </div>
</div>




<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Chọn mặt hàng</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <div class="collapse navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
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
        </div>
    </div>
</div>



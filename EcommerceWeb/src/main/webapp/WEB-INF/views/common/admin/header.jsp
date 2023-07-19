<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<header class="app-header fixed-top">
    <div class="app-header-inner">
        <div class="container-fluid py-2">
            <div class="app-header-content">
                <div class="row justify-content-between align-items-center">

                    <div class="app-utilities col-auto " style="margin-left:75%; margin-top: 10px">
                            <div class="d-inline-flex align-items-center">
                                <a class="nav-item nav-link" href="" style="margin-right:20px">Xin chào <security:authentication property="principal.username"/></a></li>
                                <a class="nav-item nav-link" href="/ecommerce/logout">Thoát</a>
                            </div>
                    </div><!--//app-utilities-->
                </div><!--//row-->
            </div><!--//app-header-content-->
        </div><!--//container-fluid-->
    </div><!--//app-header-inner-->
    <div id="app-sidepanel" class="app-sidepanel">
        <div id="sidepanel-drop" class="sidepanel-drop"></div>
        <div class="sidepanel-inner d-flex flex-column">
            <a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
            <div class="app-branding">
                <a class="app-logo" href="index.html"><span class="logo-text">ECommerce</span></a>

            </div><!--//app-branding-->

            <nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
                <ul class="app-menu list-unstyled accordion" id="menu-accordion">
                    <li class="nav-item">
                        <a class="nav-link active" href="/ecommerce/admin">
                            Thống kê
                        </a><!--//nav-link-->
                    </li><!--//nav-item-->
                    <li class="nav-item">

                        <a class="nav-link" href="/ecommerce/admin/category">
						        Mặt hàng
                        </a><!--//nav-link-->
                    </li><!--//nav-item-->
                    <li class="nav-item">

                        <a class="nav-link" href="/ecommerce/admin/product?page=1">
						        Sản phẩm
                        </a><!--//nav-link-->
                    </li><!--//nav-item-->
                    <li class="nav-item has-submenu">

                        <a class="nav-link submenu-toggle" href="/ecommerce/admin/bill" >
						        Hóa đơn
                        </a><!--//nav-link-->
                    </li><!--//nav-item-->
                    <li class="nav-item has-submenu">

                        <a class="nav-link submenu-toggle" href="/ecommerce/admin/user?page=1">
						        Tài khoản
                        </a><!--//nav-link-->
                    </li><!--//nav-item-->

                    <li class="nav-item">
                        <a class="nav-link" href="/ecommerce/admin/contact?page=1">
						        Liên hệ
                        </a><!--//nav-link-->
                    </li><!--//nav-item-->

                </ul><!--//app-menu-->
            </nav><!--//app-nav-->

        </div><!--//sidepanel-inner-->
    </div><!--//app-sidepanel-->
</header><!--//app-header-->

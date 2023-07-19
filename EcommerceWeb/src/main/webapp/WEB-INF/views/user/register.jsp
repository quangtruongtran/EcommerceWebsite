<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/ecommerce/user/css/register.css">
</head>
<body>
<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Tạo tài khoản</h2>

                            <form action="/ecommerce/register" method="post">

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="name">Họ và tên</label>
                                    <input type="text" id="name" class="form-control form-control-lg" name="userFullName" />
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="email">Email</label>
                                    <input type="text" id="email" class="form-control form-control-lg" name="userEmail"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="userName">Tên người dùng</label>
                                    <input type="text" id="userName" class="form-control form-control-lg" name="userName"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="pass">Mật khẩu</label>
                                    <input type="password" id="pass" class="form-control form-control-lg" name="userPassWord"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="repeatPass">Lặp lại mật khẩu</label>
                                    <input type="password" id="repeatPass" class="form-control form-control-lg" name="userPassWordRepeat" />
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="address">Địa chỉ</label>
                                    <input type="text" id="address" class="form-control form-control-lg" name="userAddress"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="phone">Số điện thoại</label>
                                    <input type="text" id="phone" class="form-control form-control-lg"  name="userPhone"/>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <button type="Submit"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng ký</button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Bạn đã có tài khoản? <a href="/ecommerce/login"
                                                                                                        class="fw-bold text-body"><u>Đăng nhập</u></a></p>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
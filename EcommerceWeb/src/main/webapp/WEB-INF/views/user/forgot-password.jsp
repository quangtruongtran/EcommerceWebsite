<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<section class="vh-100" style="background-color: #9A616D;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block" style="margin-right: 50px">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                        </div>
                        <div class="col-md-6 col-lg-6 d-flex align-items-center">
                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <div class="mb-4">
                                                    <c:if test = "${not empty err}">
                                                        <script type="text/javascript">
                                                            window.alert("${err}");
                                                        </script>
                                                    </c:if>
                                                    <c:if test = "${not empty mess}">
                                                        <script type="text/javascript">
                                                            window.alert("${mess}");
                                                        </script>
                                                    </c:if>
                                                    <h5>Quên mật khẩu?</h5>
                                                    <p class="mb-2">Nhập vào Email của bạn để đặt lại mật khẩu
                                                    </p>
                                                </div>
                                                <form action="/ecommerce/forgot-password" method="post">
                                                    <div class="mb-3">
                                                        <label for="email" class="form-label">Email</label>
                                                        <input type="email" id="email" class="form-control" name="email" placeholder="Enter Your Email">
                                                    </div>
                                                    <div class="mb-3 d-grid">
                                                        <button type="submit" class="btn btn-primary">
                                                            Đặt lại mật khẩu
                                                        </button>
                                                    </div>
                                                    <span>Không có tài khoản? <a href="/ecommerce/register">Đăng ký!</a></span>

                                                </form>
                                            </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
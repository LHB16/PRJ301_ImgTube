<%-- 
    Document   : login
    Created on : Mar 17, 2026, 8:36:15 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập - ImgTube</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            .login-section {
                background-color: #f8f9fa;
                padding: 30px;
                border-radius: 8px;
                margin: 20px 0;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-white border-bottom py-3 sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold fs-4" href="home"><i class="bi bi-camera-reels"></i> ImgTube</a>
                <div class="d-flex align-items-center">
                    <a href="login" class="btn btn-outline-primary btn-sm me-2">Đăng nhập</a>
                    <a href="register" class="btn btn-primary btn-sm">Đăng ký</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-section">
                        <div class="text-center mb-4">
                            <i class="bi bi-person-circle" style="font-size: 3rem; color: #007bff;"></i>
                            <h3 class="mt-2">Đăng nhập</h3>
                            <p class="text-muted">Chào mừng quay trở lại ImgTube</p>
                        </div>

                        <!-- thông báo lỗi -->
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger" role="alert">
                                <i class="bi bi-exclamation-triangle"></i> ${errorMsg}
                            </div>
                        </c:if>

                        <form method="post" action="login">
                            <input type="hidden" name="redirect" value="<c:out value="${param.redirect}"/>">
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    <i class="bi bi-envelope"></i> Email
                                </label>
                                <input type="email" class="form-control" id="email" name="email" required 
                                       placeholder="Nhập email của bạn">
                            </div>
                            
                            <div class="mb-3">
                                <label for="pass" class="form-label">
                                    <i class="bi bi-lock"></i> Mật khẩu
                                </label>
                                <input type="password" class="form-control" id="pass" name="pass" required 
                                       placeholder="Nhập mật khẩu">
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
                                </button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <p class="mb-0">Chưa có tài khoản? 
                                <a href="register" class="text-decoration-none">Đăng ký ngay</a>
                            </p>
                            <a href="home" class="text-decoration-none text-muted">
                                <i class="bi bi-house"></i> Về trang chủ
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
    </body>
</html>

<%-- 
    Document   : register
    Created on : Mar 17, 2026, 8:36:30 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng ký - ImgTube</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            .register-section {
                background-color: #d4edda;
                padding: 30px;
                border-radius: 8px;
                margin: 20px 0;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .form-control:focus {
                border-color: #28a745;
                box-shadow: 0 0 0 0.2rem rgba(40,167,69,.25);
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
                    <div class="register-section">
                        <div class="text-center mb-4">
                            <i class="bi bi-person-plus" style="font-size: 3rem; color: #28a745;"></i>
                            <h3 class="mt-2">Đăng ký</h3>
                            <p class="text-muted">Tạo tài khoản ImgTube mới</p>
                        </div>

                        <!-- thông báo lỗi -->
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger" role="alert">
                                <i class="bi bi-exclamation-triangle"></i> ${error}
                            </div>
                        </c:if>

                        <form method="post" action="register">
                            <div class="mb-3">
                                <label for="username" class="form-label">
                                    <i class="bi bi-person"></i> Tên người dùng
                                </label>
                                <input type="text" class="form-control" id="username" name="username" required 
                                       placeholder="Nhập tên người dùng">
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label">
                                    <i class="bi bi-lock"></i> Mật khẩu
                                </label>
                                <input type="password" class="form-control" id="password" name="password" required 
                                       placeholder="Nhập mật khẩu">
                            </div>
                            
                            <div class="mb-3">
                                <label for="fullName" class="form-label">
                                    <i class="bi bi-person-badge"></i> Họ và tên
                                </label>
                                <input type="text" class="form-control" id="fullName" name="fullName" 
                                       placeholder="Nhập họ và tên đầy đủ">
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    <i class="bi bi-envelope"></i> Email
                                </label>
                                <input type="email" class="form-control" id="email" name="email" required 
                                       placeholder="Nhập email của bạn">
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">
                                    <i class="bi bi-person-plus"></i> Đăng ký
                                </button>
                            </div>
                        </form>

                        <div class="text-center mt-3">
                            <p class="mb-0">Đã có tài khoản? 
                                <a href="login" class="text-decoration-none">Đăng nhập ngay</a>
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

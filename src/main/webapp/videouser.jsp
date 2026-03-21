<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ImgTube - Xem video trực tuyến</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-white border-bottom py-3 sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold fs-4" href="home"><i class="bi bi-camera-reels"></i> ImgTube</a>
                <div class="d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">

                            <a href="video?id=${sessionScope.user.userId}" class="text-decoration-none">
                                <span class="me-3 text-dark fw-bold">${sessionScope.user.username}</span>
                            </a>
                            <a href="logout" class="btn btn-outline-danger btn-sm">Đăng xuất</a>
                        </c:when>
                        <c:otherwise>
                            <a href="login" class="btn btn-outline-primary btn-sm me-2">Đăng nhập</a>
                            <a href="register" class="btn btn-primary btn-sm">Đăng ký</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>

        <!-- Nội dung chính -->
        <div class="container-fluid mt-3">
            <div class="row">

                <!-- Video display -->
                <div class="col-md-10 col-lg-10">
                    <h2>
                        Video của bạn | <a href="video?action=add" class="btn btn-secondary">Thêm video</a>
                        <hr class="border-dark border-3 opacity-100">
                    </h2>
                    <div class="row g-3">
                        <c:choose>
                            <c:when test="${not empty videos}">
                                <c:forEach items="${videos}" var="video">
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <div class="video-card" onclick="location.href = 'videodetail?id=${video.videoId}';">
                                            <div class="p-2">
                                                <img src="https://i.ytimg.com/vi/${video.urlVideo}/hqdefault.jpg" width="100%">
                                                <h3 class="video-title">
                                                    <a href="videodetail?id=${video.videoId}" class="text-decoration-none text-dark">
                                                        ${video.title}
                                                    </a>
                                                </h3>
                                                <div class="video-channel">
                                                    <i class="bi bi-person-circle"></i> ${video.user.fullName}
                                                </div>
                                                <div class="video-meta">
                                                    <i class="bi bi-calendar3"></i> ${video.uploadDate}
                                                    <br>
                                                    <a href="video?action=update&videoid=${video.videoId}" class="btn btn-warning btn-sm">
                                                        <i class="bi bi-brush me-1">Chỉnh sửa</i>
                                                    </a>
                                                    <a href="video?action=delete&videoid=${video.videoId}">
                                                        <i class="btn btn-outline-danger">Xóa</i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12 text-center py-5 text-secondary">
                                    <i class="bi bi-camera-video-off" style="font-size: 3rem;"></i>
                                    <p class="mt-3">Chưa có video nào.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
    </body>
</html>
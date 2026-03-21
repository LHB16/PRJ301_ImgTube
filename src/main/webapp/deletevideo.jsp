<%-- Document : addvideo Created on : Mar 17, 2026, 8:35:43 PM Author : luuhu --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    </head>

    <body>
        <nav class="navbar navbar-expand-lg bg-white border-bottom py-0 sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="home"><i class="bi bi-camera-reels"></i> ImgTube</a>
                <div class="d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <span class="me-3 text-dark fw-bold">${sessionScope.user.username}</span>
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

        <div class="container mt-5">
            <h2>Xóa Video</h2>
            <hr>

            <form action="video?action=delete&videoid=${video.videoId}" method="post">

                <div class="mb-3">
                    <label class="form-label">Tiêu đề video:</label>
                    <input readonly type="text" class="form-control" name="title" value="${video.title}">
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả:</label>
                    <input readonly type="text" class="form-control" name="description" value="${video.description}">
                </div>

                <div class="mb-3">
                    <label class="form-label">URL(Internet link):</label>
                    <input readonly type="text" class="form-control" name="urlVideo" value="${video.urlVideo}">
                </div>

                <div class="mb-3">
                    <label class="form-label">Category Name</label>
                    <input hidden="" readonly type="text" class="form-control" name="categoryId" value="${video.category.categoryId}">
                    <input readonly type="text" class="form-control" value="${video.category.categoryName}">
                </div>

                <button type="submit" class="btn btn-primary">Xóa Video</button>
                <a href="video?id=${sessionScope.user.userId}" class="btn btn-secondary">Quay lại</a>
            </form>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"
                integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y"
        crossorigin="anonymous"></script>

    </body>

</html>
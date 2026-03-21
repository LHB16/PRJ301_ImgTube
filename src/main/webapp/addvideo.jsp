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

        <div class="container mt-5">
            <h2>Thêm Video Mới</h2>
            <hr>

            <form action="video?action=add" method="POST">

                <div class="mb-3">
                    <label class="form-label">Tiêu đề video:</label>
                    <input type="text" name="title" class="form-control" placeholder="Nhập tiêu đề..."
                           required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Mô tả:</label>
                    <textarea name="description" class="form-control" rows="3"
                              placeholder="Nhập mô tả video..."></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">URL(Internet link):</label>
                    <input name="urlVideo" class="form-control"
                           placeholder="Ví dụ: aIeUfTg2T4o" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Category ID</label>
                    <select class="form-select" name="categoryId" required>
                        <option value="" selected disabled hidden>--Chọn một--</option>
                        <c:forEach items="${listCate}" var="cate">
                            <option value="${cate.categoryId}">${cate.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Đăng Video</button>
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
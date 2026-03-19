<%-- 
    Document   : videodetail
    Created on : Mar 17, 2026, 8:36:38 PM
    Author     : luuhu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${video.title} - ImgTube</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; }
        .video-thumb { aspect-ratio: 16/9; object-fit: cover; }
    </style>
</head>
<body class="bg-light text-dark">

<!-- NAVBAR -->
<nav class="navbar sticky-top bg-white border-bottom shadow-sm px-4">
    <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="home">
        <span class="bg-danger text-white fw-bold px-2 py-1 rounded" style="font-size:13px;">▶</span>
        <span class="fw-bold fs-5 text-dark">ImgTube</span>
    </a>
    <div class="ms-auto d-flex align-items-center gap-2">
        <c:choose>
            <c:when test="${sessionScope.account != null}">
                <div class="rounded-circle bg-danger text-white fw-bold d-flex align-items-center justify-content-center"
                     style="width:34px;height:34px;font-size:14px;">
                    ${fn:substring(sessionScope.account.fullName,0,1)}
                </div>
                <span class="text-secondary small">${sessionScope.account.fullName}</span>
                <a href="logout" class="btn btn-sm btn-link text-secondary text-decoration-none">Đăng xuất</a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="btn btn-sm btn-outline-primary rounded-pill px-3">Đăng nhập</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<div class="container py-4" style="max-width:860px;">

    <!-- THUMBNAIL -->
    <img src="${video.urlThumbnail}"
         class="video-thumb w-100 rounded-3 shadow-sm"
         onerror="this.src='https://via.placeholder.com/860x484/dee2e6/6c757d?text=No+Thumbnail'"
         alt="${video.title}"/>

    <!-- TIÊU ĐỀ -->
    <h1 class="fs-4 fw-bold mt-3 mb-2">${video.title}</h1>

    <!-- CHANNEL + SUBSCRIBE -->
    <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 py-3 border-top border-bottom">
        <div class="d-flex align-items-center gap-3">
            <div class="rounded-circle bg-danger text-white fw-bold d-flex align-items-center justify-content-center flex-shrink-0"
                 style="width:42px;height:42px;font-size:18px;">
                ${fn:substring(video.user.fullName,0,1)}
            </div>
            <div>
                <div class="fw-semibold">${video.user.fullName}</div>
                <div class="text-secondary small">${subscriberCount} người đăng ký</div>
            </div>
        </div>

        <c:choose>
            <c:when test="${sessionScope.account == null}">
                <a href="login.jsp" class="btn btn-dark rounded-pill px-4">Đăng ký</a>
            </c:when>
            <c:when test="${sessionScope.account.userId == video.user.userId}">
                <span class="badge bg-secondary rounded-pill px-3 py-2 fs-6">Kênh của bạn</span>
            </c:when>
            <c:otherwise>
                <form action="subscribe" method="post" class="m-0">
                    <input type="hidden" name="channelOwnerId" value="${video.user.userId}"/>
                    <input type="hidden" name="videoId"        value="${video.videoId}"/>
                    <c:choose>
                        <c:when test="${isSubscribed}">
                            <button type="submit" class="btn btn-secondary rounded-pill px-4">✓ Đã đăng ký</button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit" class="btn btn-dark rounded-pill px-4">Đăng ký</button>
                        </c:otherwise>
                    </c:choose>
                </form>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- MÔ TẢ -->
    <div class="bg-white rounded-3 p-3 mt-3 mb-4 shadow-sm">
        <div class="text-secondary small mb-2">
            📅 <fmt:formatDate value="${video.uploadDate}" pattern="dd/MM/yyyy"/>
            &nbsp;
            <span class="badge bg-danger rounded-pill">${video.category.categoryName}</span>
        </div>
        <p class="mb-0 text-secondary small">${video.description}</p>
    </div>

    <!-- COMMENT SECTION -->
    <h6 class="fw-bold mb-3">💬 ${comments.size()} bình luận</h6>

    <!-- Form thêm comment -->
    <c:choose>
        <c:when test="${sessionScope.account != null}">
            <form action="videodetail" method="post" class="mb-4">
                <input type="hidden" name="videoId" value="${video.videoId}"/>
                <textarea name="content" rows="2"
                          class="form-control mb-2"
                          placeholder="Thêm bình luận..."></textarea>
                <div class="text-end">
                    <button type="submit" class="btn btn-dark btn-sm rounded-pill px-4">Bình luận</button>
                </div>
            </form>
        </c:when>
        <c:otherwise>
            <div class="alert alert-light border small mb-4">
                <a href="login.jsp" class="text-primary fw-medium text-decoration-none">Đăng nhập</a>
                để thêm bình luận.
            </div>
        </c:otherwise>
    </c:choose>

    <!-- Danh sách comment -->
    <c:choose>
        <c:when test="${empty comments}">
            <p class="text-secondary small">Chưa có bình luận nào. Hãy là người đầu tiên!</p>
        </c:when>
        <c:otherwise>
            <c:forEach var="cmt" items="${comments}">
                <div class="d-flex gap-3 py-3 border-bottom">
                    <div class="rounded-circle bg-primary text-white fw-bold d-flex align-items-center justify-content-center flex-shrink-0"
                         style="width:36px;height:36px;font-size:14px;">
                        ${fn:substring(cmt.user.fullName,0,1)}
                    </div>
                    <div>
                        <span class="fw-medium small">${cmt.user.fullName}</span>
                        <span class="text-secondary ms-2" style="font-size:12px;">
                            <fmt:formatDate value="${cmt.commentDate}" pattern="dd/MM/yyyy HH:mm"/>
                        </span>
                        <p class="mb-0 small text-dark mt-1">${cmt.content}</p>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
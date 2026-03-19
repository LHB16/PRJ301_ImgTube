<%-- 
    Document   : home
    Created on : Mar 17, 2026, 8:36:07 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ImgTube</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; }
        .thumb-wrap img { transition: transform .3s ease; }
        .video-card:hover .thumb-wrap img { transform: scale(1.04); }
        .card-title-text { display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
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
                    ${sessionScope.account.fullName.substring(0,1)}
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

<!-- CONTENT -->
<div class="container-fluid px-4">
    <p class="fw-bold mt-4 mb-3">🎬 Video nổi bật</p>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4 pb-5">
        <c:forEach var="v" items="${videos}">
            <div class="col">
                <a href="videodetail?id=${v.videoId}" class="video-card text-decoration-none text-dark d-block">

                    <!-- THUMBNAIL -->
                    <div class="thumb-wrap ratio ratio-16x9 rounded-3 overflow-hidden bg-secondary bg-opacity-10">
                        <c:choose>
                            <c:when test="${not empty v.urlThumbnail}">
                                <img src="${v.urlThumbnail}" alt="${v.title}"
                                     class="w-100 h-100 object-fit-cover"
                                     onerror="this.parentElement.innerHTML='<div class=\'d-flex align-items-center justify-content-center h-100 text-secondary fs-1\'>🎬</div>'"/>
                            </c:when>
                            <c:otherwise>
                                <div class="d-flex align-items-center justify-content-center h-100 text-secondary fs-1">🎬</div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- INFO -->
                    <div class="d-flex gap-2 mt-2">
                        <div class="rounded-circle bg-danger text-white fw-bold d-flex align-items-center justify-content-center flex-shrink-0"
                             style="width:34px;height:34px;font-size:13px;">
                            ${v.user.fullName.substring(0,1)}
                        </div>
                        <div class="overflow-hidden">
                            <div class="card-title-text small fw-medium lh-sm">${v.title}</div>
                            <div class="text-secondary" style="font-size:12px;">${v.user.fullName}</div>
                            <span class="badge rounded-pill bg-light border text-secondary mt-1"
                                  style="font-size:11px;">
                                ${v.category.categoryName}
                            </span>
                        </div>
                    </div>

                </a>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
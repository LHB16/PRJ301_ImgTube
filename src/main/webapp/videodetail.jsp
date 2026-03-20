<%-- 
    Document   : videodetail
    Created on : Mar 17, 2026, 8:36:38 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${video.title} - ImgTube</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            .description-section {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 8px;
                margin: 20px 0;
            }

            .comment-section {
                background-color: #fff3cd;
                padding: 15px;
                border-radius: 8px;
                margin: 10px 0;
            }

            .comment-item {
                background-color: #ffffff;
                padding: 15px;
                border-radius: 6px;
                margin: 10px 0;
                border: 1px solid #e9ecef;
            }

            .title-section {
                background-color: #e7f3ff;
                padding: 20px;
                border-radius: 8px;
                margin: 20px 0;
            }

            .title-section h2 {
                color: #0056b3;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .title-section p {
                color: #6c757d;
                margin-bottom: 5px;
            }
        </style>
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
        <div class="container mt-4">

            <div class="text-center">
                <img src="${video.urlThumbnail}" width="50%" alt="Video thumbnail">
            </div>

            <div class="title-section">
                <h2>${video.title}</h2>
                <p><i class="bi bi-folder"></i> ${video.category.categoryName} | <i class="bi bi-calendar"></i> <fmt:formatDate value="${video.uploadDate}" pattern="dd/MM/yyyy"/></p>
            </div>
            
            <div>
                Kênh: <strong>${video.user.fullName}</strong> | ${subscriberCount} người đăng ký
                &nbsp;
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <a href="login">[Đăng ký]</a>
                    </c:when>
                    <c:when test="${sessionScope.user.userId == video.user.userId}">
                        [Kênh của bạn]
                    </c:when>
                    <c:otherwise>
                        <form action="subscribe" method="post" style="display:inline">
                            <input type="hidden" name="channelOwnerId" value="${video.user.userId}"/>
                            <input type="hidden" name="videoId"        value="${video.videoId}"/>
                            <button type="submit">${isSubscribed ? 'Hủy đăng ký' : 'Đăng ký'}</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>

            <hr>

            <!-- Phần mô tả -->
            <div class="description-section">
                <h3>Mô tả</h3>
                <p>${video.description}</p>
            </div>
            <hr>

            <!-- Phần bình luận -->
            <div class="comment-section">
                <h3>Bình luận (${comments.size()})</h3>

                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <form action="videodetail" method="post">
                            <input type="hidden" name="videoId" value="${video.videoId}"/>
                            <textarea name="content" rows="3" cols="60" placeholder="Viết bình luận..."></textarea>
                            <br>
                            <button type="submit" class="btn btn-primary mt-2">Gửi</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p><a href="login">Đăng nhập</a> để bình luận.</p>
                    </c:otherwise>
                </c:choose>

                <hr>

                <c:forEach var="cmt" items="${comments}">
                    <div class="comment-item">
                        <p>
                            <b>${cmt.user.fullName}</b>
                            <small class="text-muted"> (<fmt:formatDate value="${cmt.commentDate}" pattern="dd/MM/yyyy HH:mm"/>)</small>
                            <br>${cmt.content}
                        </p>

                        <c:if test="${sessionScope.user != null &&
                                      sessionScope.user.userId == cmt.user.userId}">
                              <button class="btn btn-sm btn-outline-primary" onclick="toggleEdit(${cmt.commentId})">Chỉnh sửa</button>
                              <form action="videodetail" method="post" style="display:inline"
                                    onsubmit="return confirm('Xóa bình luận này?\n${cmt.content}')">
                                  <input type="hidden" name="action"    value="deleteComment"/>
                                  <input type="hidden" name="videoId"   value="${video.videoId}"/>
                                  <input type="hidden" name="commentId" value="${cmt.commentId}"/>
                                  <button type="submit" class="btn btn-sm btn-outline-danger">Xóa</button>
                              </form>

                              <div id="editForm${cmt.commentId}" style="display:none;">
                                  <form action="videodetail" method="post">
                                      <input type="hidden" name="action"    value="editComment"/>
                                      <input type="hidden" name="videoId"   value="${video.videoId}"/>
                                      <input type="hidden" name="commentId" value="${cmt.commentId}"/>
                                      <textarea name="content" rows="2" cols="60">${cmt.content}</textarea>
                                      <br>
                                      <button type="submit">Lưu</button>
                                      <button type="button" onclick="toggleEdit(${cmt.commentId})">Hủy</button>
                                  </form>
                              </div>
                        </c:if>
                    </div>
                    <hr>
                </c:forEach>
            </div>
            <script>
                function toggleEdit(id) {
                    var form = document.getElementById("editForm" + id);
                    form.style.display = (form.style.display === "none") ? "block" : "none";
                }
            </script>
        </div>
    </body>
</html>
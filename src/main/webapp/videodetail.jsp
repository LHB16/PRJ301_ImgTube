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
    </head>
    <body>

        <a href="home">Trang chủ</a>
        <hr>

        <img src="${video.urlThumbnail}" width="800">

        <h2>${video.title}</h2>
        <p>${video.category.categoryName} | <fmt:formatDate value="${video.uploadDate}" pattern="dd/MM/yyyy"/></p>
        <p>${video.description}</p>

        <hr>

        <p>
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
    </p>

    <hr>

    <h3>Bình luận (${comments.size()})</h3>

    <c:choose>
        <c:when test="${sessionScope.user != null}">
            <form action="videodetail" method="post">
                <input type="hidden" name="videoId" value="${video.videoId}"/>
                <textarea name="content" rows="3" cols="60" placeholder="Viết bình luận..."></textarea>
                <br>
                <button type="submit">Gửi</button>
            </form>
        </c:when>
        <c:otherwise>
            <p><a href="login">Đăng nhập</a> để bình luận.</p>
        </c:otherwise>
    </c:choose>

    <hr>

    <c:forEach var="cmt" items="${comments}">
        <p>
            <b>${cmt.user.fullName}</b>
            <small>(<fmt:formatDate value="${cmt.commentDate}" pattern="dd/MM/yyyy HH:mm"/>)</small>
            <br>${cmt.content}
        </p>

        <c:if test="${sessionScope.user != null &&
                      sessionScope.user.userId == cmt.user.userId}">
              <button onclick="toggleEdit(${cmt.commentId})">Chỉnh sửa</button>
              <form action="videodetail" method="post" style="display:inline"
                    onsubmit="return confirm('Xóa bình luận này?')">
                  <input type="hidden" name="action"    value="deleteComment"/>
                  <input type="hidden" name="videoId"   value="${video.videoId}"/>
                  <input type="hidden" name="commentId" value="${cmt.commentId}"/>
                  <button type="submit">Xóa</button>
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

        <hr>
    </c:forEach>

    <script>
        function toggleEdit(id) {
            var form = document.getElementById("editForm" + id);
            form.style.display = (form.style.display === "none") ? "block" : "none";
        }
    </script>

</body>
</html>
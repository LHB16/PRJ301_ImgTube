<%-- 
    Document   : videodetail
    Created on : Mar 17, 2026, 8:36:38 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${video.title} - ImgTube</title>
    </head>
    <body>

        <a href="home">← Trang chủ</a>
        <hr>

        <iframe src="${video.urlThumbnail}" width="800" height="450" allowfullscreen></iframe>

        <h2>${video.title}</h2>
        <p>${video.category.categoryName} | <fmt:formatDate value="${video.uploadDate}" pattern="dd/MM/yyyy"/></p>
<p>${video.description}</p>

<hr>

<p>
    Kênh: <strong>${video.user.fullName}</strong> | ${subscriberCount} người đăng ký
    &nbsp;
    <c:choose>
        <c:when test="${sessionScope.account == null}">
            <a href="login.jsp">[Đăng ký]</a>
        </c:when>
        <c:when test="${sessionScope.account.userId == video.user.userId}">
            [Kênh của bạn]
        </c:when>
        <c:otherwise>
        <form action="subscribe" method="post" style="display:inline">
            <input type="hidden" name="channelOwnerId" value="${video.user.userId}"/>
            <input type="hidden" name="videoId" value="${video.videoId}"/>
            <button type="submit">${isSubscribed ? 'Hủy đăng ký' : 'Đăng ký'}</button>
        </form>
    </c:otherwise>
</c:choose>
</p>

<hr>

<h3>Bình luận (${comments.size()})</h3>

<c:choose>
    <c:when test="${sessionScope.account != null}">
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
    <hr>
</c:forEach>

</body>
</html>
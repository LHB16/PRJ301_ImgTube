<%-- 
    Document   : manageVideos
    Created on : Mar 18, 2026, 12:11:40 AM
    Author     : Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Video</title>
    </head>
    <body>
        <h1>Quản lý Video</h1>
        
        <c:if test="${not empty param.msg}">
            <c:if test="${param.msg == 'success'}">
                <p style="color: green;">Thao tác thành công!</p>
            </c:if>
            <c:if test="${param.msg == 'error'}">
                <p style="color: red;">Thao tác thất bại!</p>
            </c:if>
        </c:if>
        
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Mô tả</th>
                <th>Ngày đăng</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach items="${videos}" var="video">
                <tr>
                    <td>${video.videoId}</td>
                    <td>${video.title}</td>
                    <td>${video.description}</td>
                    <td>${video.uploadDate}</td>
                    <td>
                        <c:if test="${video.status == 1}">
                            <span style="color: green;">Hiện</span>
                        </c:if>
                        <c:if test="${video.status == 0}">
                            <span style="color: red;">Ẩn</span>
                        </c:if>
                    </td>
                    <td>
                        <a href="admin?action=toggleVideoStatus&videoId=${video.videoId}&currentStatus=${video.status}">
                            <c:if test="${video.status == 1}">Ẩn</c:if>
                            <c:if test="${video.status == 0}">Hiện</c:if>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

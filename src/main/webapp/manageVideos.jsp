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
        <meta charset="UTF-8">
        <title>Quản lý Video</title>
        <style>
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                border-bottom: 1px solid #ddd;
            }
            .logout-btn {
                background-color: #dc3545;
                color: white;
                padding: 8px 16px;
                text-decoration: none;
                border-radius: 4px;
                border: none;
                cursor: pointer;
            }
            .logout-btn:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div style="display: flex; align-items: center; gap: 20px;">
                <h1 style="margin: 0;">Quản lý Video</h1>
            </div>
            <div style="display: flex; align-items: center; gap: 40px;">
                <a href="admin" style="text-decoration: none; color: #007bff; font-size: 16px;">← Back</a>
                <a href="admin?action=logout" class="logout-btn">Logout</a>
            </div>
        </div>
        
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
                <th>Thumbnail</th>
                <th>Tiêu đề</th>
                <th>Mô tả</th>
                <th>Ngày đăng</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach items="${videos}" var="video">
                <tr>
                    <td>${video.videoId}</td>
                    <td>
                        <img iframe src="${video.urlThumbnail}" width="150" ></iframe>
                    </td>
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

<%-- 
    Document   : manageUsers
    Created on : Mar 18, 2026, 12:22:46 AM
    Author     : Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Quản lý Người Dùng</title>
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
                <h1 style="margin: 0;">Quản lý Người Dùng</h1>
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
            <c:if test="${param.msg == 'cannot_ban_admin'}">
                <p style="color: orange;">Không thể ban tài khoản admin khác!</p>
            </c:if>
            <c:if test="${param.msg == 'cannot_ban_self'}">
                <p style="color: orange;">Không thể ban chính mình!</p>
            </c:if>
        </c:if>
        
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Vai trò</th>
                <th>Trạng thái</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.username}</td>
                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>
                        <c:if test="${user.role == 1}">Admin</c:if>
                        <c:if test="${user.role == 0}">User</c:if>
                    </td>
                    <td>
                        <c:if test="${user.status == 1}">
                            <span style="color: green;">Hoạt động</span>
                        </c:if>
                        <c:if test="${user.status == 0}">
                            <span style="color: red;">Đã ban</span>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${user.role == 1}">
                            <span style="color: gray;">Admin</span>
                        </c:if>
                        <c:if test="${user.role == 0}">
                            <a href="admin?action=toggleUserStatus&userId=${user.userId}&currentStatus=${user.status}">
                                <c:if test="${user.status == 1}">Ban</c:if>
                                <c:if test="${user.status == 0}">Unban</c:if>
                            </a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

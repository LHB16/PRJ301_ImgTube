<%-- 
    Document   : dashboard
    Created on : Mar 18, 2026, 12:23:12 AM
    Author     : Phat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
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
            <h1>Admin Dashboard</h1>
            <a href="admin?action=logout" class="logout-btn">Logout</a>
        </div>
        <ul>
            <li><a href="admin?action=manageVideos">Quản lý Video</a></li>
            <li><a href="admin?action=manageUsers">Quản lý Người Dùng</a></li>
        </ul>
    </body>
</html>

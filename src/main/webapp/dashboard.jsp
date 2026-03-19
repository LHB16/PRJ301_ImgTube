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
        <title>Admin Dashboard</title>
    </head>
    <body>
        <h1>Admin Dashboard</h1>
        <ul>
            <li><a href="admin?action=manageVideos">Quản lý Video</a></li>
            <li><a href="admin?action=manageUsers">Quản lý Người Dùng</a></li>
        </ul>
    </body>
</html>

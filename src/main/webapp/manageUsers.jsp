<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                height: 100vh;
                overflow: hidden;
            }
            
            /* Header Styles */
            .header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 15px 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                height: 70px;
            }
            
            .header h1 {
                font-size: 24px;
                font-weight: 600;
                margin: 0;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            
            .header-actions {
                display: flex;
                align-items: center;
                gap: 20px;
            }
            
            .user-info {
                display: flex;
                align-items: center;
                gap: 10px;
                font-size: 14px;
            }
            
            .logout-btn {
                background-color: rgba(255,255,255,0.2);
                color: white;
                padding: 8px 16px;
                text-decoration: none;
                border-radius: 25px;
                border: 1px solid rgba(255,255,255,0.3);
                cursor: pointer;
                transition: all 0.3s ease;
                font-size: 14px;
            }
            
            .logout-btn:hover {
                background-color: rgba(255,255,255,0.3);
                color: white;
                transform: translateY(-1px);
            }
            
            /* Container Layout */
            .main-container {
                display: flex;
                margin-top: 70px;
                height: calc(100vh - 70px);
            }
            
            /* Sidebar Styles */
            .sidebar {
                width: 250px;
                background: #2c3e50;
                color: white;
                padding: 20px 0;
                box-shadow: 2px 0 10px rgba(0,0,0,0.1);
                overflow-y: auto;
                transition: all 0.3s ease;
            }
            
            .sidebar-menu {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            
            .sidebar-menu li {
                margin-bottom: 5px;
            }
            
            .sidebar-menu a {
                display: flex;
                align-items: center;
                gap: 12px;
                padding: 12px 25px;
                color: #ecf0f1;
                text-decoration: none;
                transition: all 0.3s ease;
                font-size: 15px;
                border-left: 3px solid transparent;
            }
            
            .sidebar-menu a:hover {
                background-color: #34495e;
                color: #3498db;
                border-left-color: #3498db;
            }
            
            .sidebar-menu a.active {
                background-color: #34495e;
                color: #3498db;
                border-left-color: #3498db;
            }
            
            .sidebar-menu i {
                font-size: 18px;
                width: 20px;
                text-align: center;
            }
            
            /* Main Content Styles */
            .main-content {
                flex: 1;
                background: #f8f9fa;
                padding: 30px;
                overflow-y: auto;
            }
            
            .content-header {
                margin-bottom: 30px;
            }
            
            .content-header h2 {
                color: #2c3e50;
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 10px;
            }
            
            /* Responsive Design */
            @media (max-width: 768px) {
                .sidebar {
                    width: 70px;
                }
                
                .sidebar-menu a span {
                    display: none;
                }
                
                .sidebar-menu a {
                    justify-content: center;
                    padding: 15px;
                }
                
                .sidebar-menu i {
                    font-size: 20px;
                }
                
                .main-content {
                    padding: 20px;
                }
                
                .header h1 {
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <h1>
                <i class="bi bi-speedometer2"></i>
                Admin Dashboard
            </h1>
            <div class="header-actions">
                <div class="user-info">
                    <i class="bi bi-person-circle"></i>
                    <span>Admin</span>
                </div>
                <a href="admin?action=logout" class="logout-btn">
                    <i class="bi bi-box-arrow-right"></i>
                    Logout
                </a>
            </div>
        </header>

        <!-- Main Container -->
        <div class="main-container">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="menu-section">
                    <ul class="sidebar-menu">
                        <li>
                            <a href="admin?action=manageVideos">
                                <i class="bi bi-play-circle"></i>
                                <span>Quản lý Video</span>
                            </a>
                        </li>
                        <li>
                            <a href="admin?action=manageUsers" class="active">
                                <i class="bi bi-people"></i>
                                <span>Quản lý Người Dùng</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="main-content">
                <div class="content-header">
                    <h2>Quản lý Người Dùng</h2>
                </div>

                <!-- Alert Messages -->
                <c:if test="${not empty param.msg}">
                    <c:if test="${param.msg == 'success'}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle"></i> Thao tác thành công!
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    <c:if test="${param.msg == 'error'}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-circle"></i> Thao tác thất bại!
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    <c:if test="${param.msg == 'cannot_ban_admin'}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle"></i> Không thể ban tài khoản admin khác!
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    <c:if test="${param.msg == 'cannot_ban_self'}">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle"></i> Không thể ban chính mình!
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                </c:if>

                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên đăng nhập</th>
                                        <th>Họ tên</th>
                                        <th>Email</th>
                                        <th>Vai trò</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="user">
                                        <tr>
                                            <td>${user.userId}</td>
                                            <td>${user.username}</td>
                                            <td>${user.fullName}</td>
                                            <td>${user.email}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.role == 1}">
                                                        <span class="badge bg-danger">Admin</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-primary">User</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.status == 1}">
                                                        <span class="badge bg-success">Hoạt động</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Khóa</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.role == 1}">
                                                        <span class="text-muted">Admin</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:choose>
                                                            <c:when test="${user.status == 1}">
                                                                <a href="admin?action=toggleUserStatus&userId=${user.userId}&currentStatus=${user.status}" class="btn btn-sm btn-outline-success">
                                                                    <i class="bi bi-unlock"></i> Unban
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="admin?action=toggleUserStatus&userId=${user.userId}&currentStatus=${user.status}" class="btn btn-sm btn-outline-warning">
                                                                    <i class="bi bi-lock"></i> Ban
                                                                </a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"></script>
    </body>
</html>

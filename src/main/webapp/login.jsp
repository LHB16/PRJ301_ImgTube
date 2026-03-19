<%-- 
    Document   : login
<<<<<<< HEAD
    Created on : Mar 17, 2026, 8:36:15?PM
    Author     : luuhu
--%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<nav class="navbar sticky-top bg-white border-bottom shadow-sm px-4">
    <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="home">
        <span class="bg-danger text-white fw-bold px-2 py-1 rounded" style="font-size:13px;">?</span>
        <span class="fw-bold fs-5 text-dark">ImgTube</span>
    </a>
    <div class="ms-auto d-flex align-items-center gap-2">
        <c:choose>
            <c:when test="${sessionScope.account != null}">
                <div class="rounded-circle bg-danger text-white fw-bold d-flex align-items-center justify-content-center"
                     style="width:34px;height:34px;font-size:14px;">
                    ${fn:substring(sessionScope.account.fullName,0,1)}
                </div>
                <span class="text-secondary small">${sessionScope.account.fullName}</span>
                <a href="logout" class="btn btn-sm btn-link text-secondary text-decoration-none">??ng xu?t</a>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="btn btn-sm btn-outline-primary rounded-pill px-3">??ng nh?p</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>
=======
    Created on : Mar 17, 2026, 8:36:15 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body>

        <div class="container">

            <nav class="navbar navbar-light bg-light px-3">
                <a class="navbar-brand" href="home">ImgTube</a>
                <div class="navbar-left">
                    <a class="text-dark me-3 text-decoration-none" href="login">Login</a>
                    <a class="text-dark text-decoration-none" href="register">Register</a>
                </div>
            </nav>


            <div class="container d-flex justify-content-center align-items-center">
                <div class="w-50">
                    <h1>Login</h1>
                    <form method="post" action="login">
                        <input type="hidden" name="redirect" value="<c:out value="${param.redirect}"/>
                        <div>
                            <label>Email:</label><br>
                            <input type="email" name="email" required>
                        </div>
                        <div>
                            <label>Password:</label><br>
                            <input type="password" name="pass" required>
                        </div>
                        <div>
                            <button type="submit">Login</button>
                        </div>
                    </form>
                    <p>Don't have an account? <a href="register">Register</a></p>
                </div>
            </div>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
    </body>
</html>
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d

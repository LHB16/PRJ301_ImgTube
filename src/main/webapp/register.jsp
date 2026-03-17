<%-- 
    Document   : register
    Created on : Mar 17, 2026, 8:36:30 PM
    Author     : luuhu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
                    <h1>Register</h1>
                    <c:if test="${not empty error}">
                        <p><c:out value="${error}"/></p>
                    </c:if>

                    <form method="post" action="register">
                        <div>
                            <label>Username:</label><br>
                            <input type="text" name="username" required>
                        </div>
                        <div>
                            <label>Password:</label><br>
                            <input type="password" name="password" required>
                        </div>
                        <div>
                            <label>Full Name:</label><br>
                            <input type="text" name="fullName">
                        </div>
                        <div>
                            <label>Email:</label><br>
                            <input type="email" name="email" required>
                        </div>
                        <div>
                            <button type="submit">Register</button>
                        </div>
                    </form>
                    <p>Already have an account? <a href="login">Login</a></p>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

    </body>
</html>

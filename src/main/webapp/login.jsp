<%-- 
    Document   : login
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
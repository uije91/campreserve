<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%-- CSS 링크(반응형페이지, BootStrap, style.css)--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    <title>Camping Reservation</title>
</head>
<style>
    .blog-header {
        border-bottom: 1px solid #e5e5e5;
    }

    .blog-header-logo {
        /*font-family: "Playfair Display", Georgia, "Times New Roman", serif!*rtl:Amiri, Georgia, "Times New Roman", serif*!;*/
        font-size: 2.25rem;
    }

    .blog-header-logo:hover {
        text-decoration: none;
    }

    .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
    }

    .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
    }
</style>

<body class="d-flex flex-column min-vh-100">
<div class="container">
    <header class="blog-header lh-1 py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-2 pt-1">
                <a class="link-secondary"></a>
            </div>
            <div class="col-6 text-center">
                <a class="blog-header-logo text-dark" href="index"><H1>Camp Reservation</H1></a>
            </div>
            <div class="col-2 d-flex justify-content-end align-items-center">
                <a class="btn btn-sm btn-outline-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    MyPage</a>
                    <ul class="dropdown-menu">
                        <c:choose>
                            <c:when test="${empty sessionScope.loginUser}">
                                <li><a class="dropdown-item" href="loginPage">로그인</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="joinPage">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="dropdown-item" href="myPage">${sessionScope.loginUser.name}님의 정보수정</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="logout">로그아웃</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
            </div>
        </div>
    </header>

    <div class="nav-scroller py-1 mb-2">
        <div class="container">
            <nav class="nav d-lg-flex justify-content-evenly">
                <a class="p-2 link-secondary" href="index">Home</a>
                <a class="p-2 link-secondary" href="campPage">캠핑장찾기</a>
                <c:choose>
                    <c:when test="${sessionScope.loginUser==null}">
                        <a class="p-2 link-secondary" href="loginPage">예약확인</a>
                    </c:when>
                    <c:otherwise>
                        <a class="p-2 link-secondary" href="reserveView">예약확인</a>
                    </c:otherwise>
                </c:choose>

                <c:if test="${sessionScope.loginUser.role==1}">
                        <a class="p-2 link-secondary" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리페이지</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="campManagementPage">캠핑장관리</a></li>
                            <li><a class="dropdown-item" href="memberManagementPage">회원관리</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="campDataPage">캠핑장등록</a></li>
                        </ul>
                </c:if>
            </nav>
        </div>
    </div>
</div>


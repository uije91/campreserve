
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .menu_tab{
        padding-left: 10%;
        padding-right: 10%;
        padding-top: 3rem;
        margin-right:auto;
        margin-left: auto;
    }
    tr{
        text-align: center;
    }
    th{
        text-align: center;
    }
    /* PageNation Button */
    .page-item.active .page-link{
        background-color: black;
        color: white;
        border-color: black;
    }
    .page-link{
        color: black;
    }
</style>



<div class="menu_tab">
    <h4>회원관리</h4>
    <!-- 검색창-->
    <div style="margin-right: auto">
        <form class="d-flex" style="justify-content: end;" role="search" action="memberManagementPage">
            <select name="searchType" id="searchType">
                <option value="id">아이디</option>
                <option value="name">이름</option>\
            </select>
            <input type="search" style="width: 200px; " name="keyword" id="keyword" placeholder="검색어를 입력해주세요">
            <input type="submit" class="btn btn-dark btn-md" style="margin-left: 2px" value="검색">
        </form>
    </div>
    <!-- 게시판-->
    <form method="post" id="userInfo">
    <table class="table table-hover" >
        <tread>
            <tr>
                <th scope="col" style="width: 100px;">회원번호</th>
                <th scope="col" style="width: 200px;">아이디</th>
                <th scope="col" style="width: 200px;">이름</th>
                <th scope="col" style="width: 150px;">등급</th>
                <th scope="col" style="width: 200px;">가입일</th>
                <th scope="col" style="width: 200px;">회원정보</th>
            </tr>
        </tread>
        <tbody class="table-group-divider">
        <c:forEach items="${memberList}" var="vo">
            <tr>
                <td scope="col" class="pt-3">${vo.idx}</td>
                <td scope="col" class="pt-3">${vo.id}</td>
                <td scope="col" class="pt-3">${vo.name}</td>
                <td scope="col" class="pt-3">
                    <c:if test="${vo.role==1}">관리자</c:if>
                    <c:if test="${vo.role==0}">일반사용자</c:if>
                </td>
                <td scope="col" class="pt-3">${vo.regDate}</td>
                <td scope="col">
                    <input type="button"  class="btn btn-outline-dark btn-sm" value="상세정보" onclick="UserInfo('${vo.idx}')">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </form>

    <!-- PageNation-->
    <nav aria-label="Page navigation example">
        <ul class="pagination d-flex" style="justify-content: center;">
            <c:if test="${pagination.prev}">
                <li class="page-item"><a class="page-link" href="#" onclick="member_prev('${pagination.page}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
            </c:if>
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onclick="member_pagination('${idx}', '${pagination.range}')"> ${idx} </a></li>
            </c:forEach>
            <c:if test="${pagination.next}">
                <li class="page-item"><a class="page-link" href="#" onclick="member_next('${pagination.page}', '${pagination.range}', '${pagination.pageSize}')" >다음</a></li>
            </c:if>
        </ul>
    </nav>
</div>
<div class="mb-5"></div>

<%@ include file="../../include/footer.jsp"%>

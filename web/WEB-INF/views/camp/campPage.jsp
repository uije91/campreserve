<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
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
    <h4>캠핑장 찾기</h4>
    <!-- 검색창-->
    <div style="margin-right: auto">
        <form class="d-flex" style="justify-content: end;" role="search" action="campPage">
            <select name="searchType" id="searchType" style="width: 80px">
                <option value="camp_name">캠핑장명</option>
                <option value="camp_div">구분</option>
                <option value="camp_address">주소</option>
            </select>
            <input type="search" style="width: 200px; " name="keyword" id="keyword" placeholder="검색어를 입력해주세요">
            <input type="submit" class="btn btn-dark btn-md" value="검색" style="margin-left: 2px">
        </form>
    </div>

    <!-- 게시판-->
    <form method="post" id="reserveCamp">
        <table class="table table-hover" style="width: 1050px;">
            <tread>
                <tr>
                    <th scope="col" style="width: 90px;">캠핑장번호</th>
                    <th scope="col" style="width: auto;">캠핑장명</th>
                    <th scope="col" style="width: auto;">구분</th>
                    <th scope="col" style="width: auto;">주소</th>
                    <th scope="col" style="width: 160px;">캠핑장정보</th>
                </tr>
            </tread>
            <tbody class="table-group-divider">
            <c:forEach items="${campList}" var="vo">
                <tr>
                    <input type="hidden" name="camp_div" value="${vo.camp_div}">
                    <td scope="col" class="pt-3">${vo.campNum}</td>
                    <td scope="col" class="pt-3">${vo.camp_name}</td>
                    <td scope="col" class="pt-3">${vo.camp_div}</td>
                    <td scope="col" class="pt-3">${vo.camp_address}</td>
                    <td scope="col">
                        <c:choose>
                            <c:when test="${empty sessionScope.loginUser}">
                                <input type="button"  class="btn btn-outline-dark btn-sm" value="예약하기" onclick="location.href='loginPage'">
                            </c:when>
                            <c:otherwise>
                                <input type="button"  class="btn btn-outline-dark btn-sm" value="예약하기" onclick="ReservationCamp(${vo.campNum},'${vo.camp_name}')">
                            </c:otherwise>
                        </c:choose>
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
                <li class="page-item"><a class="page-link" href="#" onclick="camp_prev('${pagination.page}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
            </c:if>
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onclick="camp_pagination('${idx}', '${pagination.range}')"> ${idx} </a></li>
            </c:forEach>
            <c:if test="${pagination.next}">
                <li class="page-item"><a class="page-link" href="#" onclick="camp_next('${pagination.page}', '${pagination.range}', '${pagination.pageSize}')" >다음</a></li>
            </c:if>
        </ul>
    </nav>
</div>
<div class="mb-5"></div>

<%@ include file="../include/footer.jsp"%>


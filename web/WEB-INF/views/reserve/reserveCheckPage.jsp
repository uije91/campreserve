<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        vertical-align: middle;
    }
    th{
        text-align: center;
        vertical-align: middle;
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
    <h4 class="mb-5">예약 확인</h4>

    <!-- 게시판-->
    <form method="post" id="writeReview">
        <table class="table table-hover" style="width: 1050px;">
            <tread>
                <tr>
                    <th scope="col" style="width: 90px;">예약번호</th>
                    <th scope="col" style="width: auto;">캠핑장명</th>
                    <th scope="col" style="width: auto;">이용구분</th>
                    <th scope="col" style="width: auto;">예약일</th>
                    <th scope="col" style="width: 90px;">예약취소</th>
                    <th scope="col" style="width: 90px;">리뷰작성</th>
                </tr>
            </tread>
            <tbody class="table-group-divider">
            <c:forEach items="${rev}" var="vo">
                <tr>
                    <td scope="col" class="pt-3">${vo.idx}</td>
                    <td scope="col" class="pt-3">${vo.camp_name}</td>
                    <td scope="col" class="pt-3">${vo.camp_div}</td>
                    <td scope="col" class="pt-3">
                        ${vo.start_date} ~ ${vo.end_date}
                    </td>
                    <td scope="col">
                        <c:set var="today" value="<%=new java.util.Date()%>" />
                        <c:choose>
                            <c:when test="${(today < vo.start_date) && vo.write_review == 'N'}">
                                <input type="button" class="btn btn-outline-dark btn-sm" value="취소" onclick="deleteReservation(${vo.idx})">
                            </c:when>
                            <c:otherwise>
                                기한만료
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${vo.write_review == 'N' && (today >= vo.end_date)}">
                                <input type="button" class="btn btn-outline-dark btn-sm" value="작성하기" onclick="insertReview(${vo.idx})">
                            </c:when>
                            <c:when test="${vo.write_review =='Y'}">
                                작성완료
                            </c:when>
                            <c:otherwise>
                                작성불가
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
                <li class="page-item"><a class="page-link" href="#" onclick="reserve_prev('${pagination.page}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
            </c:if>
            <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
                <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onclick="reserve_pagination('${idx}', '${pagination.range}')"> ${idx} </a></li>
            </c:forEach>
            <c:if test="${pagination.next}">
                <li class="page-item"><a class="page-link" href="#" onclick="reserve_next('${pagination.page}', '${pagination.range}', '${pagination.pageSize}')" >다음</a></li>
            </c:if>
        </ul>
    </nav>
</div>
<div class="mb-5"></div>

<%@ include file="../include/footer.jsp"%>

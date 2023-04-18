<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-9 mx-auto">
            <h4 class="mb-3">아이디 찾기 결과</h4>
            <form class="validation-form" method="POST" action="loginPage">
                <div class="mb-3">
                    <c:if test="${message == 1}">
                        <h5 class="pt-5">해당정보로 가입된 아이디는<br>
                            [ ${id} ] 입니다.</h5>
                    </c:if>
                    <c:if test="${message == -1}">
                        <h5 class="pt-5">해당정보로 조회되는 아이디가 없습니다.</h5>
                    </c:if>
                </div>
                <hr class="mb-3">
                <input class="btn btn-dark btn-block" type="submit" value="로그인하기">
            </form>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-9 mx-auto">
            <c:if test="${message == 1}">
                <h4 class="mb-3">비밀번호 찾기</h4>
                <form class="validation-form" method="POST" action="updatePassword">
                    <h6 class="pt-4 ">일치하는 정보가 있습니다. <br>변경하실 비밀번호를 입력해주세요</h6>
                    <div class="row pt-2">
                        <div class="col-md-8 mb-2">
                            <input type="hidden" name="id" value="${id}">
                            <input type="hidden" name="name" value="${name}">
                            <input type="hidden" name="email" value="${email}">
                            <label for="joinPwd">비밀번호</label>
                            <input type="password" class="form-control" id="joinPwd" name="pwd" placeholder="" value="" maxlength="20" required oninput="checkPW()">
                            <span class="pwd_ok">사용가능한 비밀번호입니다.</span>
                            <span class="pwd_error">비밀번호는 영문 숫자 특수문자를 모두 포함하여<br>공백없이 8~20자로 입력해주세요</span>
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                        <div class="col-md-8 mb-2">
                            <label for="joinPwd2">비밀번호 확인</label>
                            <input type="password" class="form-control" id="joinPwd2" placeholder="" value="" maxlength="20" required oninput="checkPW2()">
                            <span class="pwd_same">비밀번호가 일치합니다.</span>
                            <span class="pwd_nosame">비밀번호가 일치하지 않습니다.</span>
                            <div class="invalid-feedback">비밀번호를 재입력해주세요.</div>
                        </div>
                    </div>
                    <hr class="mb-3">
                    <input type="submit" class="btn btn-dark btn-block" value="확인" onclick="checkPwd()">
                </form>
            </c:if>
            <c:if test="${message == -1}">
                <h4 class="mb-3">비밀번호 찾기</h4>
                <h5 class="pt-5">해당정보로 조회되는 결과가 없습니다.</h5>
                <hr class="mb-3">
                <input type="button" class="btn btn-dark btn-block" value="확인" onclick="location.href='loginPage'">
            </c:if>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>
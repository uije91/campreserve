<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>


<%-- 회원가입시 쿠키가 존재한다면 쿠키를 삭제하고 진행합니다--%>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies!=null){
        for(int i =0; i<cookies.length; i++){
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
        }
    }
%>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-9 mx-auto">
            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" method="post" action="join">
                <div class="row">
                    <!-- 아이디-->
                    <div class="col-md-6 mb-3">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" maxlength="20" required oninput="checkId()">
                        <span class="id_ok">사용 가능한 아이디입니다.</span>
                        <span class="id_already">이미 사용중인 아이디입니다.</span>
                    </div>
                    <!-- 이름-->
                    <div class="col-md-6 mb-3">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="" maxlength="10" required>
                    </div>
                </div>
                <!-- 비밀번호 & 비밀번호 확인-->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="joinPwd">비밀번호</label>
                        <input type="password" class="form-control" id="joinPwd" name="pwd" placeholder="" value="" maxlength="20" required oninput="checkPW()">
                        <span class="pwd_ok">사용가능한 비밀번호입니다.</span>
                        <span class="pwd_error">비밀번호는 영문 숫자 특수문자를 모두 포함하여<br>공백없이 8~20자로 입력해주세요</span>
                        <div class="invalid-feedback">
                            비밀번호를 입력해주세요.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="joinPwd2">비밀번호 확인</label>
                        <input type="password" class="form-control" id="joinPwd2" placeholder="" value="" maxlength="20" required oninput="checkPW2()">
                        <span class="pwd_same">비밀번호가 일치합니다.</span>
                        <span class="pwd_nosame">비밀번호가 일치하지 않습니다.</span>
                        <div class="invalid-feedback">
                            비밀번호를 재입력해주세요.
                        </div>
                    </div>
                </div>
                <!-- 휴대폰-->
                <div class="mb-3">
                    <label for="tel">휴대폰</label>
                    <input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호는 숫자로만 입력해주세요" minlength="12" maxlength="13" required oninput="autoHyphen(this)">
                    <div class="invalid-feedback">
                        휴대폰 번호를 입력해주세요.
                    </div>
                </div>
                <!-- 이메일-->
                <div class="mb-3">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required oninput="checkEmail()">
                    <span class="email_error">이미 사용중인 이메일입니다.</span>
                    <div class="invalid-feedback">
                        이메일을 입력해주세요.
                    </div>
                </div>

                <!-- 개인정보 동의 체크박스-->
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="agreement" required style="accent-color: black;">
                    <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
                <div class="mb-4"></div>
                <button class="btn btn-dark btn-block" type="submit" onclick="return joinCheck()">가입하기</button>
            </form>
        </div>
    </div>
</div>

<div style="padding-bottom: 5%;"></div>

<%@include file="../include/footer.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<div class="container">
  <div class="input-form-backgroud row">
    <div class="input-form col-md-9 mx-auto">
      <h4 class="mb-3">회원정보수정</h4>
      <form class="validation-form" method="post" action="updateMember" id="updateMember">
        <input type="hidden" value="${vo.idx}" name="idx">
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control" id="id" value="${vo.id}" readonly style="background-color: #efefef;">
          </div>
          <div class="col-md-6 mb-3">
            <label for="role">회원등급</label>
            <input type="text" class="form-control" id="role" style="background-color: #efefef;" readonly
              <c:if test="${vo.role==1}">
                value="관리자">
              </c:if>
              <c:if test="${vo.role==0}">
                value="일반사용자">
              </c:if>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="joinPwd">비밀번호</label>
            <input type="password" class="form-control" id="joinPwd" name="pwd" maxlength="20" required oninput="checkPW()">
            <span class="pwd_ok">사용가능한 비밀번호입니다.</span>
            <span class="pwd_error">비밀번호는 영문 숫자 특수문자를 모두 포함하여<br>공백없이 8~20자로 입력해주세요</span>
          </div>
          <div class="col-md-6 mb-3">
            <label for="joinPwd2">비밀번호 확인</label>
            <input type="password" class="form-control" id="joinPwd2" maxlength="20" required oninput="checkPW2()">
            <span class="pwd_same">비밀번호가 일치합니다.</span>
            <span class="pwd_nosame">비밀번호가 일치하지 않습니다.</span>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 mb-3">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" name="name" required value="${vo.name}">
          </div>
        </div>
        <div class="mb-3">
          <label for="tel">휴대폰</label>
          <input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호는 숫자로만 입력해주세요" minlength="12" maxlength="13" required value="${vo.tel}" oninput="autoHyphen(this)">
        </div>
        <div class="mb-3">
          <label for="email">이메일</label>
          <input type="email" class="form-control" id="email" placeholder="you@example.com" readonly value="${vo.email}" style="background-color: #efefef;">
        </div>
        <hr class="mb-4">
        <div class="mb-4" style="text-align: center">
          <input type="submit" class="btn btn-dark btn-block" value="수정하기" onclick="updateCheck()">
          <input type="button" class="btn btn-outline-dark btn-block" value="탈퇴하기" onclick="deleteMember()">
        </div>
      </form>
    </div>
  </div>
</div>

<div style="padding-bottom: 5%;"></div>

<%@ include file="../include/footer.jsp"%>
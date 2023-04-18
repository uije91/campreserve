<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp"%>
<style>
    .form-check-input:checked{
        background-color: black;
        border-color: black;
    }
</style>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-9 mx-auto">
            <h4 class="mb-3">${member.id}님의 상세정보</h4>
            <form class="validation-form" method="post" id="memberInfo">
                <input type="hidden" value="${member.idx}" name="idx">
                <div class="row">
                    <div class="col-md-6 mb-1" >
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="" maxlength="20" required value="${member.name}">
                    </div>

                    <div class="col-md-6 mb-1">
                        <c:if test="${member.role==0}">
                            <label>등급</label>
                            <input type="text" class="form-control" readonly value="일반사용자" style="background-color: #efefef;">
                        </c:if>
                        <c:if test="${member.role==1}">
                            <label>등급</label>
                            <input type="text" class="form-control" readonly value="관리자" style="background-color: #efefef;">
                        </c:if>
                        <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="role" id="roleCheck" value="${member.role}">
                        <label class="form-check-label">관리자 권한 부여</label>
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="tel">휴대폰</label>
                    <input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호는 숫자로만 입력해주세요" minlength="12" maxlength="13" value="${member.tel}" required oninput="autoHyphen(this)">
                </div>

                <div class="mb-3">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required oninput="checkEmail()" value="${member.email}">
                    <span class="email_error">이미 사용중인 이메일입니다.</span>
                </div>

                <hr class="mb-4">
                <div class="mb-4 d-flex" style="justify-content: center;">
                    <input type="button" class="btn btn-dark btn-block" value="정보수정" onclick="updateMemberAdmin()">&nbsp;
                    <input type="button" class="btn btn-outline-dark btn-block" value="회원탈퇴" onclick="deleteMemberAdmin()">
                </div>
            </form>
        </div>
    </div>
</div>



<script>
    if(${member.role==1}) {
        document.getElementById("roleCheck").checked = true;
    }
</script>

<div style="padding-bottom: 5%;"></div>



<%@ include file="../../include/footer.jsp"%>

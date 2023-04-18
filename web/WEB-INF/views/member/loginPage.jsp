<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>

<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-9 mx-auto">
            <h4 class="mb-3">로그인</h4>
            <form class="validation-form" method="post" action="login" id="login">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" maxlength="20" required value="${sessionScope.loginUser.userid}">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label for="pwd">비밀번호</label>
                        <input type="password" class="form-control" id="pwd" name="pwd" maxlength="20" required>
                    </div>
                </div>
                <hr class="mb-3">
                <div>
                    <label for="checkId">
                        <input type="checkbox" id="checkId" name="checkId" checked style="accent-color: black; font-size: 1rem;">
                        아이디 저장
                    </label>
                    <a href="findPage" style="float: right; font-size: 0.85rem;">아이디•비밀번호찾기</a>
                </div>
                <div class="mb-3"></div>
                <input type="submit" class="btn btn-dark btn-block" value="로그인">
            </form>
        </div>
    </div>
</div>
<div style="padding-bottom: 5%;"></div>









<%@ include file="../include/footer.jsp"%>
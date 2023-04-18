<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>

<%-- 아이디/비밀번호 찾기시 쿠키가 존재한다면 쿠키를 삭제하고 진행합니다--%>
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
            <!-- 탭 영역-->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="tab-formal nav-link active" data-bs-toggle="tab" type="button" data-bs-target="#tab1" role="tab" aria-selected="true">아이디 찾기</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="tab-formal nav-link" data-bs-toggle="tab" type="button" data-bs-target="#tab2" role="tab" aria-selected="false">비밀번호 찾기</button>
                </li>
            </ul>
            <!-- 탭 컨텐츠 영역-->
            <div class="tab-content">
                <!-- 아이디 찾기-->
                <div class="tab-pane show active pt-5" id="tab1" role="tabpanel">
                    <form method="post" action="findId">
                        <div class="mb-3">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                        </div>
                        <hr class="mt-4 mb-4">
                        <button type="submit" class="btn btn-dark btn-block" >아이디 찾기</button>
                    </form>
                </div>
                <!-- 비밀번호 찾기-->
                <div class="tab-pane show pt-5" id="tab2" role="tabpanel">
                    <form method="post" action="findPassword">
                        <div class="mb-3">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id" required>
                        </div>
                        <div class="mb-3">
                            <label for="name2">이름</label>
                            <input type="text" class="form-control" id="name2" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email2">이메일</label>
                            <input type="email" class="form-control" id="email2" name="email" placeholder="you@example.com" required>
                        </div>
                        <hr class="mt-4 mb-4">
                        <input type="submit" class="btn btn-dark btn-block"  value="비밀번호 찾기">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="mb-5"></div>

<%@include file="../include/footer.jsp"%>
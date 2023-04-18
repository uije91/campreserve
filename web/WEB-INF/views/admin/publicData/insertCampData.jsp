<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../../include/header.jsp"%>
<style>
    .downloadData{
        display: none;
    }
</style>

<main>
    <div class="container py-4">
        <div class="p-5 mb-4 bg-light rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">캠핑장 정보 다운로드</h1>
                <p class="col-md-8 fs-4">공공데이터포털(data.go.kr)에서 캠핑장 정보(Json)를 다운로드합니다.</p>
                <span class="downloadData">데이터를 다운로드중입니다. 다운로드 완료시 메인화면으로 이동합니다.</span>
                <div class="downloadData spinner-border text-dark" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <div class="pt-3"></div>
                <button class="btn btn-dark btn-lg" type="button" onclick="downloadData()">데이터 추가하기</button>

            </div>
        </div>
    </div>
</main>
<script type="text/javascript">
    function downloadData(){
        $('.downloadData').css("display","inline-block");
        location.href='insertCampData';
    }
</script>
<%@ include file="../../include/footer.jsp"%>

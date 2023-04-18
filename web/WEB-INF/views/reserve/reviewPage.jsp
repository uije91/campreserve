<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%-- CSS 링크(반응형페이지, BootStrap, style.css)--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Camping Reservation</title>
</head>
<body class="d-flex flex-column min-vh-100">
<style>
    td{
        text-align: center;
        vertical-align: middle;
    }
</style>
<div class="container">
    <div class="input-form2 row mt-4">
        <h4 class="mt-2 mb-2" style="text-align: center">리뷰 작성하기</h4>
        <form class="validation-form" method="post" id="insertReview">
            <input type="hidden" name="idx" value="${vo.idx}">
            <input type="hidden" name="id" value="${vo.id}">
            <table class="table table-hover mt-2">
                <div>
                    <tr>
                        <td colspan="1">캠핑장명</td>
                        <td colspan="3">
                            <input type="text" class="form-control" name="camp_name" readonly value="${vo.camp_name}">
                        </td>
                    </tr>
                </div>
                <div>
                    <tr>
                        <td colspan="1">이용구분</td>
                        <td colspan="3">
                            <input type="text" class="form-control" name="camp_div" readonly value="${vo.camp_div}">
                        </td>
                    </tr>
                </div>
                <div>
                    <tr>
                        <td colspan="1">예약자</td>
                        <td colspan="3">
                            <input type="text" class="form-control" name="name" readonly value="${vo.name}">
                        </td>
                    </tr>
                </div>
                <div>
                    <tr>
                        <td colspan="1">예약날짜</td>
                        <td colspan="3">
                            <div class="form-group" style="text-align: left;">
                                <div>
                                    <span style="display: inline-block;">입실:&nbsp;</span>
                                    <input type="date" class="form-control" name="start_date" style="display:inline-block;width: 80%;" readonly value="${vo.start_date}">
                                </div>
                                <hr style="margin-top: 7px;margin-bottom: 8px;">
                                <div>
                                    <span style="display: inline-block;">퇴실:&nbsp;</span>
                                    <input type="date" class="form-control" name="end_date" style="display:inline-block;width: 80%;" readonly value="${vo.end_date}">
                                </div>
                            </div>
                        </td>
                    </tr>
                </div>
                <div>
                    <tr>
                        <td colspan="1">내용</td>
                        <td colspan="3">
                                <textarea class="form-control" style="height: 120px" placeholder="내용을 작성해주세요." maxlength="100" name="review"></textarea>
                        </td>
                    </tr>
                </div>
            </table>
            <div style="display: flex; justify-content: center;">
                <input type="button" class="btn btn-dark" value="작성하기" onclick="uploadReview()">&nbsp;
                <input type="button" class="btn btn-outline-dark" value="취소" onclick="closeReview()">
            </div>
        </form>
        <div class="col">
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/camping.js"></script>
<script type="text/javascript" src="js/paging.js"></script>
</body>
</html>

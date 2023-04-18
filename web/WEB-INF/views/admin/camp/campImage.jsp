
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp"%>
<style>
    .form-check-input:checked{
        background-color: black;
        border-color: black;
    }
    th{
        text-align: center;
        vertical-align: middle;
    }
    td{
        text-align: center;
        vertical-align: middle;

    }
</style>
<div class="container">
    <div class="input-form-backgroud row mt-5">
        <div class="col-md-8 mx-auto">
            <h4 class="mb-3">캠핑장 이미지 정보</h4>
                <form class="validation-form" method="post" action="insertCampImg" enctype="multipart/form-data">
                        <tr>
                            <td>
                                <!-- 업로드시 넘겨야하는 정보-->
                                <input type="hidden" name="campNum" value="${camp.campNum}">
                                <input type="hidden" name="camp_name" value="${camp.camp_name}">
                                <!-- 파일업로드 버튼-->
                                <div class="file-group" style="white-space: nowrap; text-align: right">
                                    <input class="form-control" style="width: 35%; display: inline;" type="file" id="file" name="file">
                                    <input type="submit" class="btn btn-outline-dark" value="등록" style="margin-top: -3px;margin-left: -2px;" accept="image/*" onclick="return checkImg()">
                                </div>
                            </td>
                        </tr>
                </form>
            <!-- 이미지 View-->
            <table class="table table-hover mt-4">
                <thead>
                    <tr>
                        <th style="width: 90px">번호</th>
                        <th style="width: 150px">사진(미리보기)</th>
                        <th style="width: 200px">파일명</th>
                        <th style="width: 300px">캠핑장명</th>
                        <th style="width: 100px">삭제</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="vo">
                    <tr>
                        <td>${vo.imgNum}</td>
                        <td><img src="/images/files/${vo.saveFolder}/${vo.saveFile}" style="width: 100px; height: 100px"></td>
                        <td>${vo.originFile}</td>
                        <td>${camp.camp_name}</td>
                        <td>
                            <input type="button" class="btn-close" onclick="deleteCampImg(${vo.imgNum},${camp.campNum})">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="mb-5"></div>


<%@ include file="../../include/footer.jsp"%>
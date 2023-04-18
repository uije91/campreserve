<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../include/header.jsp"%>

<style>
    .form-check-input:checked{
        background-color: black;
        border-color: black;
    }
    td{
        text-align: center;
        vertical-align: middle;
    }


</style>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-9 mx-auto">
            <h4 class="mb-3">캠핑장 정보수정</h4>
            <form class="validation-form" method="post" id="campInformation" action="updateCamp">
                <input type="hidden" value="${camp.campNum}" name="campNum">
                <!-- 캠핑장이름-->
                <table class="table table-hover mt-4">
                    <!-- 캠핑장 정보-->
                    <tr><th colspan="4">캠핑장 정보</th></tr>
                    <tr>
                        <td colapan="1">캠핑장명</td>
                        <td colspan="3">
                            <input type="text" class="form-control" id="camp_name" name="camp_name" maxlength="100" required value="${camp.camp_name}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">구분</td>
                        <td colspan="3" style="text-align: left">
                            <div>
                                <input class="form-check-input" type="checkbox" id="div1" name="camp_div" value="일반야영장" ${camp.camp_div.contains("일반야영장")  ? "CHECKED" : ""}>
                                <label class="form-check-label">일반야영장</label>
                                <input class="form-check-input" type="checkbox" id="div2" name="camp_div" value="자동차야영장" ${camp.camp_div.contains("자동차야영장")  ? "CHECKED" : ""}>
                                <label class="form-check-label">자동차야영장&nbsp;</label>
                                <input class="form-check-input" type="checkbox" id="div3" name="camp_div" value="글램핑" ${camp.camp_div.contains("글램핑")  ? "CHECKED" : ""}>
                                <label class="form-check-label">글램핑&nbsp;</label>
                                <input class="form-check-input" type="checkbox" id="div4" name="camp_div" value="카라반" ${camp.camp_div.contains("카라반")  ? "CHECKED" : ""}>
                                <label class="form-check-label">카라반&nbsp;</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>위도</td>
                        <td>
                            <input type="text" class="form-control" id="latitude" name="latitude" value="${camp.latitude}">
                        </td>
                        <td>경도</td>
                        <td>
                            <input type="text" class="form-control" id="longitude" name="longitude" value="${camp.longitude}">
                        </td>
                    </tr>
                    <!-- 주소 변경창-->
                    <tbody id="afterAddress" style="display: none">
                    <tr>
                        <td colspan="1" rowspan="4">    주소</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" class="form-control" name="postcode" id="postcode" placeholder="우편번호"></td>
                        <td colspan="1"><input type="button" class="btn btn-outline-dark" onclick="updatePostCode()" value="우편번호 찾기" style="margin-left: -50%"></td>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text"  class="form-control" name="roadAddress" id="roadAddress" placeholder="도로명주소" size=45></td>
                        <input type="hidden" name="jibunAddress" id="jibunAddress" placeholder="지번주소">
                        <span id="guide" style="color:#999;display:none"></span>
                    </tr>
                    <tr>
                        <td colspan="4"><input type="text" class="form-control" name="detailAddress" id="detailAddress" placeholder="상세주소" size=45></td>
                        <input type="hidden" name="extraAddress" id="extraAddress" placeholder="참고항목">
                    </tr>
                    </tbody>

                    <!-- 주소 변경전-->
                    <tbody id="beforeAddress">
                        <tr>
                            <td colspan="1" rowspan="2">주소</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <input type="button" class="btn btn-outline-dark btn-sm"  style="float: left; margin-bottom: 7px" onclick="changeAddrOption()" value="변경하기">
                                <input type="text" class="form-control" placeholder="" name="camp_address" value="${camp.camp_address}" readonly>
                            </td>
                        </tr>
                    </tbody >
                    <!-- 야영장 Count-->
                    <tr><th colspan="4">야영장 수</th></tr>
                    <tr>
                        <td class="col-md-2">일반야영장</td>


                        <td class="col-md-4">
                            <input type="text" class="form-control" name="common_camp" id="common_camp" maxlength="4" value="${camp.common_camp}" oninput="inputNum(this)">
                        </td>
                        <td class="col-md-2">자동차야영장</td>
                        <td class="col-md-4">
                            <input type="text" class="form-control" name="car_camp" id="car_camp" maxlength="4" value="${camp.car_camp}" oninput="inputNum(this)">
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-2">글램핑</td>
                        <td class="col-md-4">
                            <input type="text" class="form-control" name="glamping" id="glamping" maxlength="4" value="${camp.glamping}" oninput="inputNum(this)">
                        </td>
                        <td class="col-md-2">카라반</td>
                        <td class="col-md-4">
                            <input type="text" class="form-control" name="caravan" id="caravan" maxlength="4" value="${camp.caravan}" oninput="inputNum(this)">
                        </td>
                    </tr>

                    <!-- 편의시설-->
                    <tr><th colspan="4">편의시설</th></tr>
                    <tr>
                        <td class="col-md-2">화장실</td>
                        <td class="col-md-4">
                            <input type="text" class="form-control" name="toilet" id="toilet" maxlength="4" value="${camp.toilet}" oninput="inputNum(this)">
                        </td>
                        <td class="col-md-2">샤워실</td>
                        <td class="col-md-4">
                            <input type="text" class="form-control" name="shower_room" id="shower_room" maxlength="4" value="${camp.shower_room}" oninput="inputNum(this)">
                        </td>
                    </tr>
                    <tr>
                        <td class="col-md-2">개수대</td>
                        <td class="col-md-4">
                            <input type="text" class="form-control" name="sink" id="sink" maxlength="4" value="${camp.sink}" oninput="inputNum(this)">
                        </td>
                    </tr>


                    <tr>
                        <td colapan="1">부대시설(1)</td>
                        <td colspan="3">
                            <input type="text" class="form-control" id="additional_1" name="additional_1" maxlength="100" value="${camp.additional_1}">
                        </td>
                    </tr>
                    <tr>
                        <td colapan="1">부대시설(2)</td>
                        <td colspan="3">
                            <input type="text" class="form-control" id="additional_2" name="additional_2" maxlength="100" value="${camp.additional_2}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">허가일</td>
                        <td colspan="3">
                        <input type="date" class="form-control" id="approve_date" name="approve_date"value="${camp.approve_date}">
                        </td>
                    </tr>
                </table>

                <hr class="mb-4">
                <div class="mb-4 d-flex" style="justify-content: center;">
                    <input type="submit" class="btn btn-dark btn-block" value="정보수정" onclick="return checkBoxCheck()">&nbsp;
                    <input type="button" class="btn btn-outline-dark btn-block" value="삭제하기" onclick="deleteCamp()">
                </div>
            </form>
        </div>
    </div>
</div>


<div class="mb-5"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function updatePostCode(){
    new daum.Postcode({
    oncomplete: function(data) {
    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    let roadAddr = data.roadAddress; // 도로명 주소 변수
    let extraRoadAddr = ''; // 참고 항목 변수

    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
    }
    // 건물명이 있고, 공동주택일 경우 추가한다.
    if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    }
    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
    }

    // 우편번호와 주소 정보를 해당 필드에 넣는다.
       document.getElementById('postcode').value = data.zonecode;
    document.getElementById("roadAddress").value = roadAddr;
    document.getElementById("jibunAddress").value = data.jibunAddress;

    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
    if(roadAddr !== ''){
        document.getElementById("extraAddress").value = extraRoadAddr;
    } else {
          document.getElementById("extraAddress").value = '';
      }

    var guideTextBox = document.getElementById("guide");
    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
    if(data.autoRoadAddress) {
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
        guideTextBox.style.display = 'block';

    } else if(data.autoJibunAddress) {
        var expJibunAddr = data.autoJibunAddress;
        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
        guideTextBox.style.display = 'block';
    } else {
          guideTextBox.innerHTML = '';
          guideTextBox.style.display = 'none';
      }
    }
    }).open();
    }
</script>


<%@ include file="../../include/footer.jsp"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<style>
    .img-size {
        width: 550px;
        height: 550px;
    }
    .input-form2 {
        max-width: 1200px;
        margin: auto;
        padding: 32px;

        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    td{
        text-align: center;
        vertical-align: middle;
    }
    th{
        text-align: center;
        vertical-align: middle;
    }
    .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
    .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
    .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}

</style>
<div class="mt-5"></div>
<div class="container">
    <div class="input-form2 row mt-4">
        <!-- 예약 탭 입-->
        <div class="col">
            <h4 class="mt-5 mb-5">캠핑장 예약</h4>
            <div class="mt-3"></div>
            <form class="validation-form" method="post" action="insertReserve">
                <table class="table table-hover mt-4">
                    <input type="hidden" value="${loginUser.id}" name="id">
                    <input type="hidden" value="${loginUser.name}" name="name">
                    <div>
                    <tr>
                        <td colspan="1">캠핑장명</td>
                        <td colspan="3">
                            <input type="text" class="form-control" maxlength="100" name="camp_name" readonly value="${vo.camp_name}">
                        </td>
                    </tr>
                    </div>
                    <div>
                        <tr>
                            <td colspan="1">이용구분</td>
                            <td colspan="3">
                                <select class="form-select" name="camp_div">
                                    <!-- fn:split 을 이용하여 ,를 기준으로 나누고 옵션을 뽑는다.-->
                                    <c:set var="splitDiv" value="${fn:split(vo.camp_div, ',')}" />
                                    <c:forEach items="${splitDiv}" var="campDiv">
                                        <option value="${campDiv}">${campDiv}</option>
                                    </c:forEach>
                                </select>
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
                                        <input type="date" class="form-control" id="start_date" name="start_date" style="display:inline-block;width: 88%;" required>
                                    </div>
                                    <hr style="margin-top: 7px;margin-bottom: 8px;">
                                    <div>
                                        <span style="display: inline-block;">퇴실:&nbsp;</span>
                                        <input type="date" class="form-control" id="end_date" name="end_date" style="display:inline-block;width: 88%;" required>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </div>
                    <div>
                        <tr>
                            <td>연락처</td>
                            <td><input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호는 숫자로만 입력해주세요" minlength="12" maxlength="13" required oninput="autoHyphen(this)"></td>
                        </tr>
                    </div>
                </table>
                <div style="text-align: center;">
                <input type="submit" class="btn btn-outline-dark btn-lg" value="예약하기">
                </div>
            </form>
        </div>
        <!-- 이미지 정보 캐러셀-->
        <div class="col">
            <div id="carouselExampleIndicators" class="carousel slide img-size" data-bs-ride="true">
                <div class="carousel-inner">
                    <c:forEach items="${img}" var="list" varStatus="loop">
                        <c:choose>
                            <c:when test="${empty list.imgNum}">
                                <div class="carousel-item${loop.first ? ' active' : ''}">
                                    <img src="images/files/no_image.png" class="d-block w-100 img-size">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="carousel-item${loop.first ? ' active' : ''}">
                                    <img src="images/files/${list.saveFolder}/${list.saveFile}" class="d-block w-100 img-size">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>


        <!-- 탭영역-->
        <div class="mt-5">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="tab-formal nav-link active" id="tab01" data-bs-toggle="tab" type="button" data-bs-target="#tab1" role="tab" aria-selected="true">캠핑장 정보</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="tab-formal nav-link" id="tab02" data-bs-toggle="tab" type="button" data-bs-target="#tab2" role="tab" aria-selected="false" onclick="relayout()">캠핑장 위치</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="tab-formal nav-link" id="tab03" data-bs-toggle="tab" type="button" data-bs-target="#tab3" role="tab" aria-selected="false">리뷰</button>
                </li>
            </ul>

            <!-- 내용 -->
            <div class="tab-content">
                <!-- TAB1-->
                <div class="tab-pane show active pt-3" id="tab1" role="tabpanel" aria-labelledby="tab01">
                    <table class="table table-hover" style="width: 50%">
                        <!-- 편의시설-->
                        <div>
                            <tr><th colspan="4">편의시설정보</th></tr>
                            <tr>
                                <td class="col-md-2">화장실</td>
                                <td class="col-md-4">
                                    <input type="text" class="form-control" value="${vo.toilet}" readonly>
                                </td>
                                <td class="col-md-2">샤워실</td>
                                <td class="col-md-4">
                                    <input type="text" class="form-control" value="${vo.shower_room}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td class="col-md-2">개수대</td>
                                <td class="col-md-4">
                                    <input type="text" class="form-control" value="${vo.sink}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td colapan="1">부대시설(1)</td>
                                <td colspan="3">
                                    <input type="text" class="form-control" value="${vo.additional_1}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td colapan="1">부대시설(2)</td>
                                <td colspan="3">
                                    <input type="text" class="form-control" value="${vo.additional_2}" readonly>
                                </td>
                            </tr>
                        </div>
                    </table>
                </div>
                <!-- TAB2-->
                <div class="tab-pane show pt-3" id="tab2" role="tabpanel" aria-labelledby="tab02">
                    <div id="map" style="width:100%; height:350px;"></div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}"></script>
                    <script>
                        function relayout() {
                            let latitude = ${vo.latitude};
                            let longitude = ${vo.longitude};

                            let mapContainer = document.getElementById('map'), // 지도를 표시할 div

                                mapOption = {
                                center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                                };

                            let map = new kakao.maps.Map(mapContainer, mapOption);
                            let imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다
                            imageSize = new kakao.maps.Size(42, 43), // 마커이미지의 크기입니다
                            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),

                                markerPosition = new kakao.maps.LatLng(latitude, longitude); // 마커가 표시될 위치입니다


                            // 마커를 생성합니다
                            let marker = new kakao.maps.Marker({
                                position: markerPosition,
                                image: markerImage
                            });

                            // 마커가 지도 위에 표시되도록 설정합니다
                            // marker.setMap(map);

                            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            let content = '<div class="customoverlay">' +
                                '  <a href="https://map.kakao.com/link/map/${vo.camp_name},${vo.latitude},${vo.longitude}" target="_blank">' +
                                '    <span class="title">${vo.camp_name}</span>' +
                                '  </a>' +
                                '</div>';

                            // 커스텀 오버레이가 표시될 위치입니다
                            var position = new kakao.maps.LatLng((latitude),(longitude));

                            // 커스텀 오버레이를 생성합니다
                            var customOverlay = new kakao.maps.CustomOverlay({
                                map: map,
                                position: position,
                                content: content,
                                yAnchor: 1
                            });


                                // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
                                // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
                                // window 의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
                                map.relayout();
                            }

                    </script>
                </div>
                <!-- TAB3 -->
                <div class="tab-pane show" id="tab3" role="tabpanel" aria-labelledby="tab03">
                    <table class="table table-hover" style="width: 100%">
                        <tr>
                            <th style="width: 100px">번호</th>
                            <th style="width: 200px">아이디</th>
                            <th style="width: 500px">후기</th>
                            <th style="width: 100px">등록일</th>
                        </tr>
                        <c:forEach items="${review}" var="rev">
                        <tr>
                            <td>${rev.r_idx}</td>
                            <td>${rev.id}</td>
                            <td>${rev.review}</td>
                            <td>${rev.review_date}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="mb-5"></div>

<%@ include file="../include/footer.jsp"%>
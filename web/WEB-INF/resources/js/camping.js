/*****************
 * Management Camp
 *****************/
function campInfo(campNum) {
    let form = document.getElementById("campInfo");
    form.action = "campInfo?campNum=" + campNum;
    form.submit();
}

//숫자만 입력가능한 정규식
function inputNum(input){
    input.value = input.value.replace(/[^0-9.]/g, '');
}

//캠핑장 등록페이지 이동
function insertCampPage(){
    location.href='insertCampPage';
}

//캠핑장정보 삭제
function deleteCamp(){
    if (confirm('캠핑장정보를 삭제하시겠습니까?')) {
        let form = document.getElementById("campInformation");
        form.action = 'deleteCamp';
        form.submit();
    }
}

//주소창 CSS변경 쿼리
function changeAddrOption(){
    let updateAddress = document.getElementById("afterAddress");

    $('#beforeAddress').css("display","none");
    updateAddress.style.removeProperty("display");
}


/**************
 * Upload Files
 **************/
//사진등록페이지이동
function campImg(campNum) {
    let form = document.getElementById("campInfo");
    form.action = "campImg?campNum=" + campNum;
    form.submit();
}

//파일업로드
$(document).ready(function() {
    $("a[name='file-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
})

function addFile() {
    // 파일 그룹이 최대 5개 이상인 경우, 함수 실행 중단
    if ($(".file-group").length >=5) {
        alert("파일은 최대 5개까지 등록할 수 있습니다.");
        return;
    }
    let str = "<div class='file-group' style='white-space: nowrap;'><input class='form-control' style='width: 90%; display: inline;' type='file' name='file'><a href='#this' type='button' class='btn-close' style='vertical-align: middle;' name='file-delete'></a></div>";
    $("#file-list").append(str);
    $("a[name='file-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
}

function deleteFile(obj) {
    obj.parent().remove();
}

function checkBoxCheck(){
    //체크박스 배열체크
    const checkboxes = document.getElementsByName("camp_div");
    let isChecked = false;

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            isChecked = true;
            break;
        }
    }

    if (!isChecked) {
        alert("야영지구분을 선택해주세요.");
        return false;
    }
}

//이미지 등록시 이미지첨부여부 확인
function checkImg(){
    let files = $("#file").val()
    if(!files){
        alert("파일을 선택해주세요.")
        return false;
    }
}

//이미지삭제
function deleteCampImg(imgNum,campNum){
    if (confirm('삭제하시겠습니까?')) {
        $.ajax({
            type: 'POST',
            url: 'deleteCampImg',
            data: { imgNum: imgNum },
            success: function(data) {
               location.replace("campImg?campNum="+campNum);
            }
        }) // ajax
    } // 삭제 확인
}

/******************
 * Camp Reservation
 ******************/
//캠핑장 예약하기
function ReservationCamp(campNum,camp_name) {
    let form = document.getElementById("reserveCamp");
    form.action = "reservePage?campNum="+campNum+"&camp_name="+camp_name;
    form.submit();
}

//예약날짜 관련 자바스크립트
let startDateInput = document.getElementById("start_date");
let endDateInput = document.getElementById("end_date");

// 현재 날짜를 계산
let today = new Date();
let todayString = today.toISOString().slice(0, 10);
// start_date 최소값을 현재 날짜로 설정
startDateInput.min = todayString;

// start_date 의 변경 이벤트
startDateInput.addEventListener("change", function() {
    let startDate = new Date(startDateInput.value);
    let endDate = new Date(endDateInput.value);

    let minEndDate = new Date(startDate.getTime() + 24 * 60 * 60 * 1000);
    if (endDate < minEndDate) {
        endDateInput.value = minEndDate.toISOString().slice(0, 10);
    }
    endDateInput.min = minEndDate.toISOString().slice(0, 10);
});

//예약 삭제
function deleteReservation(idx){
    if (confirm('예약을 취소하시겠습니까?')) {
        $.ajax({
            type: 'POST',
            url: 'deleteCampReservation',
            data: { idx: idx },
            success: function(data) {
                location.replace("reserveView");
            }
        })
    }
}


/*********
 * Review
 *********/
//리뷰작성창 이동
function insertReview(idx){
    let url = 'reviewPage?idx='+idx;
    let options = 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=500, height=550, top=50, left=100';
    window.open(url, 'writeReview', options);
}

//리뷰작성창 닫기
function closeReview(){
    window.close();
}

//리뷰작성 업로드
function uploadReview(){
    if (confirm('리뷰 작성후에는 수정이 불가능합니다. 글을 등록하시겠습니까?')) {
        let form = document.getElementById("insertReview");
        form.action = 'insertReview';
        form.submit();
        setTimeout(function (){
            window.close();
            window.opener.location.reload()
        }, 100);
    }

}
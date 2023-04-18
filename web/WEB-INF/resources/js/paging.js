/*******************************
 * 게시판 페이지네이션 (User-Reserve)
 *******************************/
//이전 버튼
function reserve_prev(page, range, pageSize) {
    page = (range - 1) * pageSize;
    range = range - 1;
    let url = "/reserveView";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//페이지 번호 클릭
function reserve_pagination(page, range) {
    let url = "/reserveView";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//다음 버튼 이벤트
function reserve_next(page, range, pageSize) {
    page = (range * pageSize) + 1;
    range = parseInt(range) + 1;
    let url = "/reserveView";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}
/***********************
 * 게시판 페이지네이션 (Camp)
 ***********************/
//이전 버튼
function camp_prev(page, range, pageSize) {
    page = (range - 1) * pageSize;
    range = range - 1;
    let url = "/campPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//페이지 번호 클릭
function camp_pagination(page, range) {
    let url = "/campPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//다음 버튼 이벤트
function camp_next(page, range, pageSize) {
    page = (range * pageSize) + 1;
    range = parseInt(range) + 1;
    let url = "/campPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}
/*****************************
 * 게시판 페이지네이션 (Admin-Camp)
 *****************************/
//이전 버튼
function campManagement_prev(page, range, pageSize) {
    page = (range - 1) * pageSize;
    range = range - 1;
    let url = "/campManagementPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//페이지 번호 클릭
function campManagement_pagination(page, range) {
    let url = "/campManagementPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//다음 버튼 이벤트
function campManagement_next(page, range, pageSize) {
    page = (range * pageSize) + 1;
    range = parseInt(range) + 1;
    let url = "/campManagementPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}


/*******************************
 * 게시판 페이지네이션 (Admin-Member)
 *******************************/
//이전 버튼
function member_prev(page, range, pageSize) {
    page = (range - 1) * pageSize;
    range = range - 1;
    let url = "/memberManagementPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//페이지 번호 클릭
function member_pagination(page, range) {
    let url = "/memberManagementPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//다음 버튼 이벤트
function member_next(page, range, pageSize) {
    page = (range * pageSize) + 1;
    range = parseInt(range) + 1;
    let url = "/memberManagementPage";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    url = url + "&searchType=" + $("#searchType").val();
    url = url + "&keyword=" + $("#keyword").val();
    location.href = url;
}

//쿠키값 set
function setCookie(cookieName, value, exdays){
    let exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

//쿠키값 delete
function deleteCookie(cookieName){
    let expireDate = new Date();
    expireDate.setDate(expireDate.getDate() -1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

//쿠키값 get
function getCookie(cookieName){
    cookieName = cookieName + "=";
    let cookieData = document.cookie;
    let start = cookieData.indexOf(cookieName);
    let cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        let end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue); //unescape로 디코딩 후 값 리턴
}


$(document).ready(function (){
    let key = getCookie("key");
    $("#id").val(key);

    if($("#id").val() != ""){
        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }

    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    })

    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }
    });
})


//회원가입 중복체크 변수
let idck = 0;
let pwdck = 0;
let pwdck2 = 0;
let emailck = 0;

//아이디 중복체크
function checkId(){
    let id = $('#id').val(); //id 값이 "id"인 입력란의 값을 저장
    $.ajax({
        url: "idCheck", //Controller 에서 요청 받을 주소
        type: "POST", //POST 방식으로 전달
        data: {id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt 값을 받는다
            if(id==null || id==""){
                $('.id_ok').css("display","none");
                $('.id_already').css("display", "none");
                idck = 0;
            } else if(cnt == 0){ //사용 가능한 아이디
                    $('.id_ok').css("display","inline-block");
                    $('.id_already').css("display", "none");
                    idck=1;
            } else {      //이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                idck=0;
            }
        },
        error:function(){
            console.log("아이디체크(checkId) 오류")
        }
    });
};

//비밀번호 체크
function checkPW(){
    let pwd = $("#joinPwd").val();
    let num = pwd.search(/[0-9]/g);
    let eng = pwd.search(/[a-z]/ig);
    let spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pwd==null || pwd==""){
        $('.pwd_ok').css("display","none");
        $('.pwd_error').css("display", "none");
        pwdck = 0;
    } else if(pwd.length < 8 || pwd.length > 20){
        $('.pwd_error').css("display","inline-block");
        $('.pwd_ok').css("display", "none");
        pwdck = 0;
        return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
        $('.pwd_error').css("display","inline-block");
        $('.pwd_ok').css("display", "none");
        pwdck = 0;
        return false;
    }else {
        $('.pwd_ok').css("display","inline-block");
        $('.pwd_error').css("display", "none");
        console.log("통과");
        pwdck = 1;
        return true;
    }
}

//비밀번호 일치여부 체크
function checkPW2(){
    let pwd = $("#joinPwd").val();
    let pwd2 = $("#joinPwd2").val();

    if(pwd2==null || pwd2==""){
        $('.pwd_same').css("display","none");
        $('.pwd_nosame').css("display", "none");
        pwdck2 = 0;
    } else if(pwd!=pwd2){
        $('.pwd_nosame').css("display","inline-block");
        $('.pwd_same').css("display", "none");
        pwdck2=0;
        return false;
    }else{
        $('.pwd_same').css("display","inline-block");
        $('.pwd_nosame').css("display", "none");
        pwdck2=1;
        return true;
    }
}

//전화번호체크 및 오토 하이픈
const autoHyphen = (target) => {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

//이메일 중복 체크
function checkEmail(){
    let email = $('#email').val(); //id 값이 "email"인 입력란의 값을 저장
    $.ajax({
        url: "emailCheck", //Controller 에서 요청 받을 주소
        type: "POST", //POST 방식으로 전달
        data: {email:email},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt 값을 받는다
            if(email==null || email==""){
                $('.email_error').css("display","none");
                emailck = 0;
            } else if(cnt == 0){ //사용 가능한 이메일
                $('.email_error').css("display", "none");
                emailck=1;
            } else {    //이미 존재하는 이메일
                $('.email_error').css("display","inline-block");
                emailck=0;
            }
        },
        error:function(){
            console.log("email error")
        }
    });
};

//회원가입 체크(누락시 알림)
function joinCheck() {
    let id = document.getElementById("userid");
    let pwd = document.getElementById("joinPwd");
    let pwd2 = document.getElementById("joinPwd2");
    let tel = document.getElementById("phone");
    let telRule = /^\d{3}-\d{3,4}-\d{4}$/;;
    let email = document.getElementById("email");
    let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if (idck === 0) {
        alert("중복된 아이디는 사용할 수 없습니다.");
        id.focus();
        return false;
    } else if (pwdck === 0) {
        alert("비밀번호 형식이 올바르지 않습니다.")
        pwd.focus();
        return false;
    } else if (pwdck2 === 0) {
        alert("비밀번호가 일치하지 않습니다.")
        pwd2.focus();
        return false;
    } else if(!telRule.test($("input[id='tel']").val())){
        alert("올바른 휴대폰번호 형식이 아닙니다.")
        tel.focus();
        return false;
    } else if(!emailRule.test($("input[id='email']").val())){
        alert("올바른 이메일 형식이 아닙니다.")
        email.focus();
        return false;
    } else if (emailck === 0) {
        alert("사용중인 이메일입니다.")
        email.focus();
        return false;
    } else{
        return true;
    }
}

//로그인 정보 호출 Ajax
function searchId(){
    let name = $('#name').val();
    let email = $('#email').val();

    $.ajax({
        url: "find_id", //Controller 에서 요청 받을 주소
        type: "POST", //POST 방식으로 전달
        data: {
            name:name,
            email:email
        },
        success:function(data){
            if(data==0){
                if(name!="" && email!="") {
                    alert("해당정보로 조회되는 아이디가 없습니다.")
                    $('#name').val('').focus();
                    $('#email').val('');
                    return false;
                }
            } else {
                alert("입력된 정보로 조회된 아이디는 ["+data+"] 입니다.");
                $('#name').val('');
                $('#email').val('');
                let form= document.getElementById("idSearch");
                form.action = "searchId";
                return true;
            }
        },
        error:function(){
            console.log("idSearch Error!")
        }
    });
};


//비밀번호 변경 체크
function checkPwd(){
    let pwd = document.getElementById("joinPwd");
    let pwd2 = document.getElementById("joinPwd2");
    if (pwd.value === "") {
        alert("비밀번호를 입력해주세요.")
        pwd.focus();
        return false;
    } else if (pwdck === 0) {
        alert("비밀번호 형식이 올바르지 않습니다.")
        pwd.focus();
        return false;
    } else if (pwd2.value === "") {
        alert("비밀번호확인을 입력해주세요.")
        pwd2.focus();
        return false;
    } else if (pwdck2 === 0) {
        alert("비밀번호가 일치하지 않습니다.")
        pwd2.focus();
        return false;
    } else{
        let form = document.getElementById("update_pwd");
        alert("비밀번호가 변경되었습니다.")
        form.action = "update_pwd";
        form.submit();
        return true;
    }
}

function updateCheck(){
    let pwd = document.getElementById("joinPwd");
    let pwd2 = document.getElementById("joinPwd2");
    let name = document.getElementById("name");
    let tel = document.getElementById("phone");
    let telRule = /^\d{3}-\d{3,4}-\d{4}$/;
    if(pwd.value === "" || pwd2.value === "" || tel.value === "" || name.value === ""){
        alert("비어있는 정보가 있습니다.")
        return false;
    }else if (pwdck === 0) {
        alert("비밀번호 형식이 올바르지 않습니다.")
        pwd.focus();
        return false;
    } else if (pwdck2 === 0) {
        alert("비밀번호가 일치하지 않습니다.")
        pwd2.focus();
        return false;
    } else if(!telRule.test($("input[id='tel']").val())){
        alert("올바른 휴대폰번호 형식이 아닙니다.")
        tel.focus();
        return false;
    } else{
        alert("회원정보 수정이 완료되었습니다.");
        return true;
    }
}

function deleteMember(){
    let form = document.getElementById("updateMember");
    if (confirm('회원탈퇴를 하시겠습니까? 탈퇴시 모든 정보는 복구가 불가능합니다.')) {
       form.action = 'deleteMember';
       form.submit();
    }
}


/*******************
 * Management Member
 *******************/
function UserInfo(idx) {
    //let idx = node.parentNode.parentNode.firstElementChild.textContent; //노드로 찾는방법
    let form = document.getElementById("userInfo");
    form.action = "memberInfo?idx=" + idx;
    form.submit();
}

function updateMemberAdmin(){
    let tel = document.getElementById("tel");
    let telRule = /^\d{3}-\d{3,4}-\d{4}$/;
    let email = document.getElementById("email");
    let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if(!telRule.test($("input[id='tel']").val())){
        alert("올바른 휴대폰번호 형식이 아닙니다.")
        tel.focus();
        return false;
    } else if(!emailRule.test($("input[id='email']").val())){
        alert("올바른 이메일 형식이 아닙니다.")
        email.focus();
        return false;
    } else{
        $('#roleCheck').val($('#roleCheck').prop('checked') ? 1 : 0);
        let form = document.getElementById("memberInfo")
        form.action='updateMemberAdmin';
        form.submit();
    }
}


function deleteMemberAdmin(){
    let form = document.getElementById("memberInfo");
    if (confirm('회원정보를 삭제하시겠습니까? 탈퇴시 모든 정보는 복구가 불가능합니다.')) {
        form.action = 'deleteMemberAdmin';
        form.submit();
    }
}
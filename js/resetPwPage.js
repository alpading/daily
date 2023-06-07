var checkPw = 0, checkPwCheck = 0;


function newPwConstraintsEvent(){
    var pw = document.getElementById("newPw").value;
    var constraints = document.getElementById("newPwConstraints");

    const regex1 = /^[a-z|0-9|/`~!@#$%^&*()-_=+]+$/;
    const regex2 = /^[^0-9|]+$/; // 숫자가 없는 경우
    const regex3 = /^[^a-z|]+$/; // 영어 소문자가 없는 경우
    const regex4 = /^[^\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]+$/; // 특수기호가 없는 경우
    if (pw.length > 14 || pw.length < 10){
        constraints.innerHTML = "10 ~ 14자이어야 합니다";
        constraints.style.color = "red";
        checkPw = 0;
    }
    else if(!regex1.test(pw)){
        constraints.innerHTML = "영어 소문자, 숫자, 특수기호만을 포함 할 수 있습니다";
        constraints.style.color = "red";
        checkPw = 0;
    }
    else if(regex2.test(pw) + regex3.test(pw) + regex4.test(pw)){
        constraints.innerHTML = "영어 소문자, 숫자, 특수기호를 모두 포함해야합니다";
        constraints.style.color = "red";
        checkPw = 0;
    }
    else{
        constraints.innerHTML = "";
        checkPw = 1;
    }
}

function newPwCheckEvent(){
    var pw1 = document.getElementById("newPw").value;
    var pw2 = document.getElementById("newPwCheck").value;

    var constraints = document.getElementById("newPwCheckConstraints");

    if (pw1 == pw2){
        constraints.innerHTML = "일치합니다";
        constraints.style.color = "#5e5151";
        checkPwCheck = 1;
    }
    else{
        constraints.innerHTML = "일치하지 않습니다";  
        constraints.style.color = "#red";
        checkPwCheck = 0;
    }
}

function resetPwButtonEvent(){
    if(checkPw*checkPwCheck == 0){
        alert("빈 값이거나 잘못된 값이 있습니다");
        return false;
    }
    else{
        return true;
    }
}
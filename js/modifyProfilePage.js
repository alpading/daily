var checkName = 1, checkPhone = 1;

function cancleButtonEvent(){
    location = "schedulerPage.jsp"
}

function modifyProfileButtonEvent(){
    if(checkName*checkPhone == 0)
    {
        alert("잘못된 값이 있습니다")
        return false;
    }
    else{
        alert("프로필 수정이 완료되었습니다")
        return true;
    }
}

function nameConstraintsEvent(){
    var name = document.getElementById("name").value;
    var constraints = document.getElementById("nameConstraints");

    const regex1 = /^[a-z|A-Z|가-힣|ㄱ-ㅎ]+$/
    if (name.length > 10 || name.length < 2){
        constraints.innerHTML = "2 ~ 10자 이어야 합니다";
        constraints.style.color = "red";
        checkName = 0;
    }
    else if(!regex1.test(name)){
        constraints.innerHTML = "한글이나 영어만을 포함 할 수 있습니다";
        constraints.style.color = "red";
        checkName = 0;
    }
    else{
        constraints.innerHTML = "";
        checkName = 1;
    }
}

function phoneConstraintEvent(){
    var phone = document.getElementById("phone").value;
    var constraints = document.getElementById("phoneConstraints");

    const regex1 = /^[0-9]+$/

    if(!regex1.test(phone))
    {
        constraints.innerHTML = "숫자만 입력해 주세요";
        constraints.style.color = "red";
        checkPhone = 0;
    }   
    else if (phone.length != 11){
        constraints.innerHTML = "숫자 11자리로 입력해 주세요";
        constraints.style.color = "red";
        checkPhone = 0;
    }
    else{
        constraints.innerHTML = "";
        checkPhone = 1;
    }
}

function modifyPwButtonEvent(){
    location = "resetPwPage.jsp"
}

function fillDefault(){
    var name = document.getElementById("name");
    var phone = document.getElementById("phone");

    name.value = accountData[0];
    phone.value = accountData[1];
}

fillDefault();
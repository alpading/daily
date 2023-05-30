var checkName = 0, checkPhone = 0;

function cancleButtonEvent(){
    location = "schedulerPage.jsp"
}
function modifyProfileButtonEvent(){
    if(checkName*checkPhone == 0)
    {
        alert("잘못된 값이 있습니다")
    }
    else{
        alert("프로필 수정이 완료되었습니다")
    location = "schedulerPage.jsp"
    }
}
function nameConstraintsEvent(){
    var name = document.getElementById("name").value;
    var constraints = document.getElementById("nameConstraints");
    if (name.length > 10){
        constraints.innerHTML = "10자 이내이어야 합니다";
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
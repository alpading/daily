var checkName = 0, checkPhone = 0;



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

function loginButtonEvent(){
    location = "../index.jsp";
}
function signupButtonEvent(){
    if(checkName*checkPhone == 0){
        alert("빈 값이거나 잘못된 값이 있습니다");
    }
    else{
    document.getElementById("resultBox").innerHTML = "일치하는 계정이 없습니다";
    document.getElementById("resultBox").style.color = "red"
    document.getElementById("resultBox").style.display = "flex"
    document.getElementById("resultBox").style.alignItems = "center"
    document.getElementById("resultBox").style.justifyContent = "center"
    
    }
}
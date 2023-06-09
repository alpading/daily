var checkName = 0, checkPhone = 0;



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

function loginButtonEvent(){
    location = "../index.jsp";
}

function findIdButtonEvent(){
    if(checkName*checkPhone == 0){
        alert("빈 값이거나 잘못된 값이 있습니다");
        return false;
    }
    else{
        return true;
    }
}

function backButtonEvent(){
    location = "../index.jsp;"
}

function createEvent(){
    console.log(findId);
    if (findId == null){
        document.getElementById("resultBox").innerHTML = "일치하는 계정이 없습니다";
        document.getElementById("resultBox").style.color = "red";
        document.getElementById("resultBox").style.display = "flex";
        document.getElementById("resultBox").style.alignItems = "center";
        document.getElementById("resultBox").style.justifyContent = "center";
    }
    else if (findId != null){
        document.getElementById("resultBox").innerHTML = "아이디는 " + findId + " 입니다";
        document.getElementById("resultBox").style.display = "flex";
        document.getElementById("resultBox").style.alignItems = "center";
        document.getElementById("resultBox").style.justifyContent = "center";
    }
}

if(document.referrer != "http://54.180.115.162:8080/daily/index.jsp;"){
    createEvent();   
}
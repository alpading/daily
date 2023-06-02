var checkName = 0, checkPhone = 0;


function idConstraintsEvent(){
    var id = document.getElementById("id").value;
    var constraints = document.getElementById("idConstraints");

    const regex1 = /^[a-z|0-9|]+$/;
    const regex2 = /^[0-9|]+$/;
    const regex3 = /^[a-z|]+$/;
    if (id.length > 10 || id.length < 6){
        constraints.innerHTML = "6 ~ 10자이어야 합니다";
        constraints.style.color = "red";
        checkId = 0;
    }
    else if(!regex1.test(id)){
        constraints.innerHTML = "영어 소문자, 숫자만을 포함 할 수 있습니다";
        constraints.style.color = "red";
        checkId = 0;
    }
    else if(regex2.test(id) + regex3.test(id)){
        constraints.innerHTML = "영어 소문자 숫자를 모두 포함해야합니다";
        constraints.style.color = "red";
        checkId = 0;
    }
    else{
        constraints.innerHTML = "";
        checkId = 1;
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

function loginButtonEvent(){
    location = "../index.jsp";
}
function findPwButtonEvent(){
    if(checkName*checkPhone == 0){
        alert("빈 값이거나 잘못된 값이 있습니다");
    }
    else{
    location = "../page/resetPwPage.jsp"
    }
}
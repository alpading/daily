var checkName = 0, checkId = 0, checkIdCheck = 0; checkPw = 0, checkPwCheck = 0, checkPhone = 0, checkPosition = 0;



function nameConstraintsEvent(){
    var name = document.getElementById("name").value;
    var constraints = document.getElementById("nameConstraints");

    const regex1 = /^[a-z|A-Z|가-힣|ㄱ-ㅎ]+$/
    if (name.length > 10 || name.lenght < 2){
        constraints.innerHTML = "10자 이내이어야 합니다";
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
        constraints.innerHTML = "영어 소문자 숫자만를 모두 포함해야합니다";
        constraints.style.color = "red";
        checkId = 0;
    }
    else{
        constraints.innerHTML = "";
        checkId = 1;
    }
}

function idCheckEvent(){
    if(checkId == 0){
        alert("올바른 아이디를 입력하세요")
    }
    else if(checkId == 1)
    {
        alert("사용가능한 아이디입니다")
        document.getElementById("idConstraints").innerHTML = "사용가능한 아이디";
        document.getElementById("idConstraints").style.color = "blue";
    }
}

function pwConstraintsEvent(){
    var pw = document.getElementById("pw").value;
    var constraints = document.getElementById("pwConstraints");

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

function pwCheckEvent(){
    var pw1 = document.getElementById("pw").value;
    var pw2 = document.getElementById("pwCheck").value;

    var constraints = document.getElementById("pwCheckConstraints");

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

function positionCheckEvent(name){

    var position;
    if(name == "managerButton"){
        position = 0;
    }
    else if(name == "leaderButton"){
        position = 1;
    }
    else if(name == "staffButton"){
        position = 2;
    }

    console.log(position)
    for(var index = 0; index < 3; index++){
        document.getElementsByClassName("positionButtons")[index].style.border = "none"
        document.getElementsByClassName("positionButtons")[index].style.backgroundColor = "#f0e5df"
    }

    document.getElementsByClassName("positionButtons")[position].style.border = "2px solid #5e5151"
    document.getElementsByClassName("positionButtons")[position].style.backgroundColor = "#eb9f9f"
}

function loginButtonEvent(){
    location = "../index.jsp";
}

function signupButtonEvent(){
    console.log(checkPosition);
    if(checkName*checkId*checkPw*checkPwCheck*checkPhone*checkPosition == 0){
        alert("빈 값이거나 잘못된 값이 있습니다");
    }
    else{
    location = "../page/schedulerPage.jsp";
    }
}
function loginButtonEvent(){
    
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    
    if(id.length*pw.length == 0){
        alert('아이디나 비밀번호 중 빈 값이 있습니다')
    }
    else if(id.length > 10){
        alert('아이디는 10자 이내여야 합니다')
    }
    else if(id.length > 14){
        alert('비밀번호는 14자 이내여야 합니다')
    }
    else{
        location = "./page/schedulerPage.jsp";
    }
}
function signupButtonEvent(){
    location = "./page/signupPage.jsp"
}
function findIdButtonEvent(){
    location = "./page/findIdPage.jsp"
}
function findPwButtonEvent(){
    location = "./page/findPwPage.jsp"
}
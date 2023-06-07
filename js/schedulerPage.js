var year = new Date().getFullYear();
var month = new Date().getMonth();
var monthNav = 0;
var scheduleLength = 2;
var mySchedulerCheck = 0;
const leaderArr = ['가나다','라마바','사아자'];
const staffArr = ['차카타','파하갸','냐댜랴','먀뱌샤','야쟈챠','캬탸퍄','햐거너'];

function menuButtonEvent(){
    document.getElementById("menuButton").style.display = "none";
    document.getElementById("rightNav").style.display = "flex";
    closeModifyScheduleEvent();
    closeAddScheduleEvent();
    if(monthNav == 1){
        document.getElementById("monthNav").style.display = "none"
        document.getElementById("downButton").src = "../img/down.png"
        monthNav = 0;
    }
}

function navMenuButtonEvent(){
    document.getElementById("menuButton").style.display = "block";
    document.getElementById("rightNav").style.display = "none";
}

function modifyProfileButtonEvent(){
    location = "modifyProfilePage.jsp"
}

function logoutEvent(){
    location = "../index.jsp"
}

function leftButtonEvent(){
    year--;
    document.getElementById("year").innerHTML = year;
}

function rightButtonEvent(){
    year++;
    document.getElementById("year").innerHTML = year;
}

function downButtonEvent(){
    console.log("1")
    if(monthNav == 0){
        document.getElementById("monthNav").style.display = "block"
        document.getElementById("downButton").src = "../img/up.png"
        monthNav = 1;
    }
    else if(monthNav == 1){
        document.getElementById("monthNav").style.display = "none"
        document.getElementById("downButton").src = "../img/down.png"
        monthNav = 0;
    }
    closeModifyScheduleEvent();
    closeAddScheduleEvent();
    navMenuButtonEvent();
}

function selectMonthEvent(num){
    console.log(num)
    var chosen = document.getElementById("month" + num);
    month = num;
    document.getElementById("month").innerHTML = month + "월";
    for(var index = 0; index < 12; index++){
        document.getElementById("month" + (index + 1 )).style.color = "black";
    }
    chosen.style.color = "#eb9f9f";
}

function openAddScheduleEvent(){
    document.getElementById("addScheduleBox").style.display = "block";
    closeModifyScheduleEvent();
    navMenuButtonEvent();
    if(monthNav == 1){
        document.getElementById("monthNav").style.display = "none"
        document.getElementById("downButton").src = "../img/down.png"
        monthNav = 0;
    }
}

function closeAddScheduleEvent(){
    document.getElementById("addScheduleBox").style.display = "none";
}

function openModifyScheduleEvent(){
    document.getElementById("modifyScheduleBox").style.display = "block";
    closeAddScheduleEvent();
    navMenuButtonEvent();
    if(monthNav == 1){
        document.getElementById("monthNav").style.display = "none"
        document.getElementById("downButton").src = "../img/down.png"
        monthNav = 0;
    }
}

function closeModifyScheduleEvent(){
    document.getElementById("modifyScheduleBox").style.display = "none";
}

function addScheduleEvent(){
    var scheduleName = document.getElementById("addScheduleName").value;
    var scheduleDate = document.getElementById("addScheduleDate").value;
    var scheduleTime = document.getElementById("addScheduleTime").value;

    if(scheduleName.length == 0){
        alert("일정 이름을 입력해주세요")
    }
    else if(scheduleName.length > 20){
        alert("일정 이름이 너무 깁니다")
    }
    else if(scheduleDate == "" || scheduleTime == "")
    {
        alert("날짜 및 시간을 입력해주세요")
    }
    else{
        closeAddScheduleEvent();
    }
}

function modifyScheduleEvent(){
    var scheduleName = document.getElementById("modifyScheduleName").value;
    var scheduleTime = document.getElementById("modifyScheduleTime").value;

    if(scheduleName.length == 0){
        alert("일정 이름을 입력해주세요")
    }
    else if( scheduleTime == "")
    {
        alert("날짜 및 시간을 입력해주세요")
    }
    else{
        closeModifyScheduleEvent();
    }
}

function deleteScheduleButtonEvent(){
    var result = confirm("정말 삭제하시겠습니까?")
    if(result){
        alert("일정이 삭제되었습니다")
    }
}

function staffSchedulerEvent(name){
    document.getElementById("title").innerHTML = name + "'s SCHEDULES";
    document.getElementById("addScheduleButton").style.display = "none";

    if (mySchedulerCheck == 0){
        var myScheduler = document.createElement("div");
        myScheduler.innerHTML = "내 스케쥴러";
        myScheduler.id = "myScheduler";
        myScheduler.onclick = function(){
            location.reload();
            mySchedulerCheck = 0;
        };
        myScheduler.style.fontSize = "18px";
        myScheduler.style.color = "#5e5151"
        document.getElementById("profileBox").appendChild(myScheduler);
        mySchedulerCheck = 1;
    }

    var modify = document.getElementsByClassName("modifyButtons");
    var delete_ = document.getElementsByClassName("deleteButtons");

    for(var index = 0; index < scheduleLength; index++)
    {
        modify[index].style.display = "none"
        delete_[index].style.display = "none"
    }
}


function createMonth(){
    for(var index = 0; index < 12; index++){
        var month = document.createElement("div");
        month.innerHTML = (index + 1) + "월";
        month.id = "month" + (index + 1);
        month.className = "months";
        document.getElementById("monthList").appendChild(month);
    }
    for(var index = 0; index < 12; index++){
        document.getElementById("month"+(index+1)).onclick = function(){
            selectMonthEvent(this.id.replace('month', ''))};
    }
    document.getElementById("month1").style.color = "#eb9f9f";
}

function createLeaderList(){
    for(var index = 0; index < memberList[1].length; index++)
    {
        var leader = document.createElement("div");
        leader.innerHTML = memberList[1][index];
        leader.id = memberList[1][index];
        leader.style.textAlign = "center";
        leader.onclick = function(){
            staffSchedulerEvent(this.id)
        };
        document.getElementById("leaderList").appendChild(leader);
    }
}

function createStaffList(){
    for(var index = 0; index < memberList[3].length; index++)
    {
        var staff = document.createElement("div");
        staff.innerHTML = memberList[3][index];
        staff.id = memberList[3][index];
        staff.style.textAlign = "center";
        staff.onclick = function(){
            staffSchedulerEvent(this.id)
        };
        document.getElementById("staffList").appendChild(staff);
    }
}

function createProfile(){
    var name = document.getElementById("name")
    var id = document.getElementById("id")
    var phone = document.getElementById("phone")
    var position = document.getElementById("position")

    name.innerHTML = accountData[0];
    id.innerHTML = accountData[1];
    phone.innerHTML= accountData[2];
    // phone.innerHTML = phoneNum.slice(0,2) + "-" + phoneNum.slice(2,6) + "-" + phoneNum.slice(6);
    if(accountData[3] == 0){
        position.innerHTML = "관리자";
    }
    else if(accountData[3] == "1"){
        position.innerHTML = "팀장";
    }
    else if(accountData[3] == "2"){
        position.innerHTML = "사원";
    }
}

function createList(){
    if(accountData[3] == 0){
        createLeaderList();
        createStaffList();
    }
    else if(accountData[3] == 1){
        createStaffList();
        document.getElementById("leader").style.display = "none";
    }
    else if(accountData[3] == 2){
        document.getElementById("listBox").style.display = "none";
        document.getElementById("profileBox").style.marginBottom = "10px";
    }
}

createMonth();
createList();
createProfile();
selectMonthEvent(month);
document.getElementById("year").innerHTML = year;
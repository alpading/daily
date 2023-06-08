var year = new Date().getFullYear();
var month = new Date().getMonth() + 1;
var monthNav = 0;
var mySchedulerCheck = 0;
var readAccountNum = accountNum;
var showingScheduleLength = 0;
var now = new Date();

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
    createSchedule(year,month,accountNum);
}

function rightButtonEvent(){
    year++;
    document.getElementById("year").innerHTML = year;
    createSchedule(year,month,accountNum);
}

function downButtonEvent(){
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
    createSchedule(year,month,accountNum);
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
    document.getElementById("addScheduleDate").value = now.toISOString().slice(0,10);
    document.getElementById("addScheduleTime").value = now.toString().slice(16,21);
}

function closeAddScheduleEvent(){
    document.getElementById("addScheduleBox").style.display = "none";
}

function openModifyScheduleEvent(name){
    console.log(name);
    document.getElementById("modifyScheduleBox").style.display = "block";
    closeAddScheduleEvent();
    navMenuButtonEvent();
    if(monthNav == 1){
        document.getElementById("monthNav").style.display = "none"
        document.getElementById("downButton").src = "../img/down.png"
        monthNav = 0;
    }
    document.getElementById("modifyScheduleBox").onsubmit = function(){
        return modifyScheduleEvent(name);
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
        return false;
    }
    else if(scheduleName.length > 20){
        alert("일정 이름이 너무 깁니다")
        return false;
    }
    else if(scheduleDate == "" || scheduleTime == "")
    {
        alert("날짜 및 시간을 입력해주세요")
        return false;
    }
    else{
        closeAddScheduleEvent();
        return true;
    }
}

function modifyScheduleEvent(name){
    var scheduleName = document.getElementById("modifyScheduleName").value;
    var scheduleTime = document.getElementById("modifyScheduleTime").value;

    console.log(name.slice(12));
    if(scheduleName.length == 0){
        alert("일정 이름을 입력해주세요")
        return false;
    }
    else if( scheduleTime == "")
    {
        alert("날짜 및 시간을 입력해주세요")
        return false;
    }
    else{
        closeModifyScheduleEvent();
        var parameter = document.createElement("input");
        parameter.value = name.slice(12);
        parameter.name = "scheduleNumValue";
        parameter.style.display = "none";
        document.getElementById("modifyScheduleBox").appendChild(parameter);
        return true;
    }
}

function deleteScheduleButtonEvent(name){
    var result = confirm("정말 삭제하시겠습니까?")
    if(result){
        alert("일정이 삭제되었습니다")
        var parameter = document.createElement("input");
        parameter.value = name.slice(8);
        parameter.name = "scheduleNumValue";
        parameter.style.display = "none";
        document.getElementById(name).appendChild(parameter);
        return true;
    }
    else{
        return false;
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
        leader.id = memberList[0][index];
        leader.style.textAlign = "center";
        leader.onclick = function(){
            staffSchedulerEvent(this.innerHTML,this.id)
        };
        document.getElementById("leaderList").appendChild(leader);
    }
}

function createStaffList(){
    for(var index = 0; index < memberList[3].length; index++)
    {
        var staff = document.createElement("div");
        staff.innerHTML = memberList[3][index];
        staff.id = memberList[2][index];
        staff.style.textAlign = "center";
        staff.onclick = function(){
            staffSchedulerEvent(this.innerHTML,this.id)
        };
        document.getElementById("staffList").appendChild(staff);
    }
}

function staffSchedulerEvent(name,accountNum){
    document.getElementById("title").innerHTML = name + "'s SCHEDULES";
    document.getElementById("addScheduleButton").style.display = "none";
    readAccountNum = accountNum;

    if (mySchedulerCheck == 0){
        var myScheduler = document.createElement("div");
        myScheduler.innerHTML = "내 스케쥴러";
        myScheduler.id = "myScheduler";
        myScheduler.onclick = function(){
            mySchedulerEvent();
        };
        myScheduler.style.fontSize = "18px";
        myScheduler.style.color = "#5e5151"
        document.getElementById("profileBox").appendChild(myScheduler);
        mySchedulerCheck = 1;
    }

    var modify = document.getElementsByClassName("modifyButton");
    var delete_ = document.getElementsByClassName("deleteButton");

    for(var index = 0; index < modify.length; index++)
    {
        modify[index].style.display = "none"
        delete_[index].style.display = "none"
    }

    createSchedule(year,month,readAccountNum);
}

function mySchedulerEvent(){
    document.getElementById("title").innerHTML = "MY SCHEDULES";
    document.getElementById("addScheduleButton").style.display = "block";
    document.getElementById("myScheduler").style.display= "none";
    readAccountNum = accountNum;
    createSchedule(year,month,readAccountNum);
    mySchedulerCheck = 0;
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

function createSchedule(year,month,accountNum){
    document.getElementById("schedulerBox").innerHTML = "";
    var dateCheck;
    console.log(scheduleList);
    for(var index = 0; index < scheduleList[0].length; index++){
        if((scheduleList[2][index].slice(5,7) == String(month).padStart(2, "0")) && (scheduleList[2][index].slice(0,4) == year) && (scheduleList[1][index] == readAccountNum)){
            if(dateCheck != scheduleList[2][index].slice(8,10)){
                var dateNum = document.createElement("div");
                dateNum.id = "day" + scheduleList[2][index].slice(8,10);
                dateNum.className = "dateNum";
                dateNum.innerHTML = parseInt(scheduleList[2][index].slice(8,10)) + "일"
                document.getElementById("schedulerBox").appendChild(dateNum)
            }

            dateCheck = scheduleList[2][index].slice(8,10);

            var section = document.createElement("section");
            section.id = "schedule" + scheduleList[0][index];
            section.className = "schedules";
            document.getElementById("schedulerBox").appendChild(section);


            var scheduleLeftBox = document.createElement("div");
            scheduleLeftBox.id = "schedule" + scheduleList[0][index] + "LeftBox";
            scheduleLeftBox.className = "scheduleLeftBox";
            document.getElementById("schedule" + scheduleList[0][index]).appendChild(scheduleLeftBox);

            var schedulesTime = document.createElement("div");
            schedulesTime.id = "schedule" + scheduleList[0][index] + "Time";
            schedulesTime.className = "schedulesTime";
            schedulesTime.classList.add("schedulesItems");
            var time1;
            var time2
            if(scheduleList[2][index].slice(11,13) < 12){
                time1 = "오전";
                time2 = scheduleList[2][index].slice(11,13);
                time3 = scheduleList[2][index].slice(14,16);
            }
            else{
                time1 = "오후";
                time2 = scheduleList[2][index].slice(11,13) - 12;
                time3 = scheduleList[2][index].slice(14,16);
            }
            schedulesTime.innerHTML = time1 + " " + time2 + ":" + time3;
            document.getElementById("schedule" + scheduleList[0][index] + "LeftBox").appendChild(schedulesTime);

            var schedulesName = document.createElement("div");
            schedulesName.id = "schedule" + scheduleList[0][index] + "Name";
            schedulesName.className = "schedulesName";
            schedulesName.classList.add("schedulesItems");
            schedulesName.innerHTML = scheduleList[3][index];
            console.log(scheduleList[2][index])
            if(scheduleList[2][index] < now.toISOString()){
                schedulesName.style.textDecoration = "line-through";
            }
            document.getElementById("schedule" + scheduleList[0][index] + "LeftBox").appendChild(schedulesName);
        
            var scheduleRightBox = document.createElement("form");
            scheduleRightBox.id = "schedule" + scheduleList[0][index] + "RightBox";
            scheduleRightBox.className = "scheduleRightBox";
            scheduleRightBox.action = "../action/deleteScheduleAction.jsp"
            scheduleRightBox.onsubmit = function(){
                return deleteScheduleButtonEvent(this.id);
            }
            document.getElementById("schedule" + scheduleList[0][index]).appendChild(scheduleRightBox);

            var modifyButton = document.createElement("div");
            modifyButton.id = "modifyButton" + scheduleList[0][index];
            modifyButton.className = "modifyButton";
            modifyButton.innerHTML = "수정";
            modifyButton.classList.add("schedulesItems");
            modifyButton.onclick = function(){ 
                openModifyScheduleEvent(this.id);
            }
            document.getElementById("schedule" + scheduleList[0][index] + "RightBox").appendChild(modifyButton);

            var deleteButton = document.createElement("input");
            deleteButton.id = "deleteButton" + scheduleList[0][index];
            deleteButton.className = "deleteButton";
            deleteButton.innerHTML = "삭제";
            deleteButton.type = "submit";
            deleteButton.value = "삭제";
            deleteButton.classList.add("schedulesItems");
            deleteButton.onclick = function(){ 
            }
            document.getElementById("schedule" + scheduleList[0][index] + "RightBox").appendChild(deleteButton);

            showingScheduleLength++;
        }
    }
}

console.log(now);
createMonth();
createList();
createProfile();
selectMonthEvent(month);

createSchedule(year,month,readAccountNum);
document.getElementById("year").innerHTML = year;
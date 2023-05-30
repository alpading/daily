<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/schedulerPage.css?sss">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1 id = "title">
        MY SCHEDULES
    </h1>
    <div id = "topNav">
        <div id = "yearBox">
            <img id = "leftButton" class = "topButtons" src ="../img/left.png" onclick="leftButtonEvent()">
            <div id = "year">2023</div>
            <img id = "leftButton" class = "topButtons" src ="../img/right.png" onclick="rightButtonEvent()">
        </div>
        <div id = "monthBox">
            <div id = "monthNav">
                <div id = "monthList">
                </div>
            </div>
            <div id = "month">1월</div>
            <img id = "downButton" class = "topButtons" src ="../img/down.png" onclick="downButtonEvent()">
        </div>
    </div>
    <img src = "../img/menu.png" id = "menuButton" onclick= "menuButtonEvent()">
    <div id = "rightNav">
        <img src = "../img/menu.png" id = "navMenuButton" onclick= "navMenuButtonEvent()">
        <div id = profileBox>
            <div id = "name" class = "profileItems">최정욱</div>
            <div id = "id" class = "profileItems">dnrwjd0116</div>
            <div id = "phone" class = "profileItems">010-2524-6911</div>
            <div id = "position" class = "profileItems">관리자</div>
            <div id = "modifyProfileButton" onclick="modifyProfileButtonEvent()">프로필 수정</div>
            <div id = "logoutButton" onclick="logoutEvent()">로그아웃</div>
        </div>
        <div id = listBox>
            <div id = "leader">팀장</div>
            <div id = "leaderList" class = "list"></div>
            <div id = "staff">사원</div>
            <div id = "staffList" class = "list"></div>
        </div>
    </div>
    </div>
    <div id = "tempBox">
        <div id = addScheduleButton onclick = "openAddScheduleEvent()">
            + 일정 추가
        </div>
    </div>
    <div id = schedulerBox>
        <section id = "scheduleDay1">
            <div id = "day1" class = "dateNum">1일</div>
            <section id = "schedule1" class = "schedules">
                <div id = 'scheduleLeftBox'>
                    <div id = "schedule1Time" class = "schedulesTime scheduleItems">오전 11:00</div>
                    <div id = "schedule1Name" class = "schedulesName scheduleItems">회의</div>
                </div>
                <div id = "scheduleRightBox">
                    <div class = "modifyButtons scheduleItems" onclick= "openModifyScheduleEvent()">수정</div>
                    <div class = "deleteButtons scheduleItems" onclick = "deleteScheduleButtonEvent()">삭제</div>
                </div>
            </section>
            <div id = "line"></div>
        </section>
    </div>

    <div id = "addScheduleBox">
        <div class = "scheduleNameBox">
            <div class = scheduleNameLeftBox>
                <div>일정 이름 :</div>
                <input type = "text" id = "addScheduleName" class = "scheduleName">
            </div>
            <img src = "../img/x.png" class = "x" onclick="closeAddScheduleEvent()">
        </div>
        <div class = "scheduleDateTimeBox">
            <div>날짜 및 시간 :</div>
            <div class = "scheduleDateTimeRightBox">
                <div>
                    <input type = "date" id = "addScheduleDate" class = "dateTime scheduleDate">
                    <input type = "time" id = "addScheduleTime" class = "dateTime scheduleTime">
                </div>
                <div id = "addScheduleBoxButton" onclick="addScheduleEvent()"> 일정 추가 </div>
            </div>
        </div>
    </div>

    <div id = "modifyScheduleBox">
        <div class = "scheduleNameBox">
            <div class = scheduleNameLeftBox>
                <div>일정 이름 :</div>
                <input type = "text" id = "modifyScheduleName" class = "scheduleName">
            </div>
            <img src = "../img/x.png" class = "x" onclick="closeModifyScheduleEvent()">
        </div>
        <div class = "scheduleDateTimeBox">
            <div>시간 :</div>
            <div class = "scheduleDateTimeRightBox">
                    <input type = "time" id = "modifyScheduleTime" class = "dateTime scheduleTime">
                <div id = "modifyScheduleBoxButton" onclick="modifyScheduleEvent()"> 일정 수정 </div>
            </div>
        </div>
    </div>
    
    <script src = "../js/schedulerPage.js?sss"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    String accountNum = session.getAttribute("accountNum").toString();
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "SELECT * FROM account WHERE account_num = " + accountNum;
    PreparedStatement query = connect.prepareStatement(sql);
    ResultSet result = query.executeQuery();

    ArrayList<ArrayList<String>> accountData = new ArrayList<ArrayList<String>>();
    ArrayList<String> nameList = new ArrayList<String>();
    ArrayList<String> idList = new ArrayList<String>();
    ArrayList<String> phoneList = new ArrayList<String>();
    ArrayList<String> positionList = new ArrayList<String>();

    while(result.next()){
        String id = result.getString(2);
        String name = result.getString(4);
        String phone = result.getString(5);
        String position = result.getString(6);
        idList.add("\"" + id + "\"");
        nameList.add("\"" + name + "\"");
        phoneList.add("\"" + phone + "\"");
        positionList.add("\"" + position + "\"");
    }

    accountData.add(nameList);
    accountData.add(idList);
    accountData.add(phoneList);
    accountData.add(positionList);

    // 다른 사원 목록 및 조회

    String sql2 = "SELECT * FROM account WHERE position = '1'"; // 팀장 목록
    PreparedStatement query2 = connect.prepareStatement(sql2);
    ResultSet result2 = query2.executeQuery();

    ArrayList<String> leaderAccountNumList = new ArrayList<String>();
    ArrayList<String> leaderNameList = new ArrayList<String>();

    while(result2.next()){
        String accountNum2 = result2.getString(1);
        String name2 = result2.getString(4);
        leaderAccountNumList.add("\"" + accountNum2 + "\"");
        leaderNameList.add("\"" + name2 + "\"");
    }


    String sql3 = "SELECT * FROM account WHERE position = '2'"; // 사원 목록
    PreparedStatement query3 = connect.prepareStatement(sql3);
    ResultSet result3 = query3.executeQuery();

    ArrayList<String> staffAccountNumList = new ArrayList<String>();
    ArrayList<String> staffNameList = new ArrayList<String>();

    while(result3.next()){
        String accountNum3 = result3.getString(1);
        String name3 = result3.getString(4);
        staffAccountNumList.add("\"" + accountNum3 + "\"");
        staffNameList.add("\"" + name3 + "\"");
    }

    ArrayList<ArrayList<String>> memberList = new ArrayList<ArrayList<String>>();
    memberList.add(leaderAccountNumList);
    memberList.add(leaderNameList);
    memberList.add(staffAccountNumList);
    memberList.add(staffNameList);
%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel = "stylesheet" type = "text/css" href = "../css/common.css">
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
        <form id = profileBox action = "../action/logoutAction.jsp">
            <div id = "name" class = "profileItems"></div>
            <div id = "id" class = "profileItems"></div>
            <div id = "phone" class = "profileItems"></div>
            <div id = "position" class = "profileItems"></div>
            <div id = "modifyProfileButton" onclick="modifyProfileButtonEvent()">프로필 수정</div>
            <input type = "submit" id = "logoutButton" onclick = "logoutEvent()" value = "로그아웃">
        </form>
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
                <input type = "text" id = "addScheduleName" class = "scheduleName" placeholder= "20자 이내">
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

    <script>
        var accountNum = <%= accountNum %>;
        var accountData = <%=accountData%>;
        var memberList = <%=memberList%>;
        var staffAccountNumList
    </script>

    <script src = "../js/common.js?"></script>
    <script src = "../js/schedulerPage.js?s"></script>
</body>
</html>
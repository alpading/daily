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

    // 전체 스케줄 조회

    String sql4 = "SELECT * FROM schedule ORDER BY datetime";
    PreparedStatement query4 = connect.prepareStatement(sql4);
    ResultSet result4 = query4.executeQuery();

    ArrayList<ArrayList<String>> scheduleList = new ArrayList<ArrayList<String>>();
    ArrayList<String> scheduleNumList = new ArrayList<String>();
    ArrayList<String> scheduleAccountNumList = new ArrayList<String>();
    ArrayList<String> scheduleDateTimeList = new ArrayList<String>();
    ArrayList<String> scheduleNameList = new ArrayList<String>();

    while(result4.next()){
        String scheduleNum = result4.getString(1);
        String scheduleAccountNum = result4.getString(2);
        String scheduleDateTime = result4.getString(3);
        String scheduleName = result4.getString(4);

        scheduleNumList.add("\"" + scheduleNum + "\"");
        scheduleAccountNumList.add("\"" + scheduleAccountNum + "\"");
        scheduleDateTimeList.add("\"" + scheduleDateTime + "\"");
        scheduleNameList.add("\"" + scheduleName + "\"");
    }
    scheduleList.add(scheduleNumList);
    scheduleList.add(scheduleAccountNumList);
    scheduleList.add(scheduleDateTimeList);
    scheduleList.add(scheduleNameList);
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
    </div>

    <form id = "addScheduleBox" action = "../action/addScheduleAction.jsp" onsubmit = "return addScheduleEvent()">
        <div class = "scheduleNameBox">
            <div class = scheduleNameLeftBox>
                <div>일정 이름 :</div>
                <input type = "text" id = "addScheduleName" class = "scheduleName" placeholder= "20자 이내" name = "nameValue">
            </div>
            <img src = "../img/x.png" class = "x" onclick="closeAddScheduleEvent()">
        </div>
        <div class = "scheduleDateTimeBox">
            <div>날짜 및 시간 :</div>
            <div class = "scheduleDateTimeRightBox">
                <div>
                    <input type = "date" id = "addScheduleDate" class = "dateTime scheduleDate" name = "dateValue">
                    <input type = "time" id = "addScheduleTime" class = "dateTime scheduleTime" name = "timeValue">
                </div>
                <input type = "submit" id = "addScheduleBoxButton" value = "일정 추가">
            </div>
        </div>
    </form>

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
        var scheduleList = <%=scheduleList%>;
    </script>

    <script src = "../js/common.js?"></script>
    <script src = "../js/schedulerPage.js?"></script>
</body>
</html>
<%@ page language = "java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");
    String scheduleNumValue = request.getParameter("scheduleNumValue");
    String nameValue = request.getParameter("nameValue");
    String dateValue = request.getParameter("dateValue");
    String timeValue = request.getParameter("timeValue");

    String datetime = dateValue + " " + timeValue;
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    ArrayList<String> datetimeList = new ArrayList<String>();

    String sql = "UPDATE schedule SET name = ?, datetime = ? WHERE schedule_num = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,nameValue);
    query.setString(2,datetime);
    query.setString(3,scheduleNumValue);

    query.executeUpdate();
%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var scheduleNumValue = <%=scheduleNumValue%>;
        var datetimeList = <%=datetimeList%>;
       location = "../page/schedulerPage.jsp";
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String nameValue = request.getParameter("nameValue");
    String idValue = request.getParameter("idValue");
    String pwValue = request.getParameter("pwValue");
    String phoneValue = request.getParameter("phoneValue");
    String positionValue = request.getParameter("positionValue");

    String sql = "INSERT INTO account(id, pw, name, phone, position) VALUES(?, ?, ?, ?, ?)";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);
    query.setString(3,nameValue);
    query.setString(4,phoneValue);
    query.setString(5,positionValue);
    
    query.executeUpdate();

    String sql2 = "SELECT * FROM account WHERE id = ?";
    PreparedStatement query2 = connect.prepareStatement(sql2);
    query2.setString(1,idValue);
    ResultSet result = query2.executeQuery();

    ArrayList<String> accountNumList = new ArrayList<String>();

    int length = 0;

    while(result.next()){
        String accountNum = result.getString(1);
        accountNumList.add("\"" + accountNum + "\"");
        length ++;
    }
    if (length > 0){
        session.setAttribute("accountNum",accountNumList.get(0));
    }
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
        var positionValue = <%=positionValue%>
        location = "../page/schedulerPage.jsp"
    </script>
    
</body>
</html>
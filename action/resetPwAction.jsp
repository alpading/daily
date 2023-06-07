<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
    String pwResetAccountNum = (String)session.getAttribute("pwResetAccountNum");

    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    request.setCharacterEncoding("utf-8");
    String pwValue = request.getParameter("pwValue");

    String sql = "UPDATE account SET pw = ? WHERE account_num = " + pwResetAccountNum;
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,pwValue);

    query.executeUpdate();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        var pwResetAccountNum = <%=pwResetAccountNum%>;
        console.log(pwResetAccountNum);
        alert("비밀번호가 재설정되었습니다");
        location = "../index.jsp";
    </script>
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    String idValue = request.getParameter("idValue");
    String nameValue = request.getParameter("nameValue");
    String phoneValue = request.getParameter("phoneValue");
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "SELECT * FROM account WHERE id = ? AND name = ? AND phone = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,nameValue);
    query.setString(3,phoneValue);
    ResultSet result = query.executeQuery();

    ArrayList<String> pwResetAccountNumList = new ArrayList<String>();
    
    int length = 0;

    while(result.next()){
        String accountNum = result.getString(1);
        pwResetAccountNumList.add("\"" + accountNum + "\"");
        length ++;
    }
    
    if (length > 0){
        session.setAttribute("pwResetAccountNum",pwResetAccountNumList.get(0));
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
        var length = <%=length%>;
        if(length > 0){
           
            location = "../page/resetPwPage.jsp";
        }
        else{
            location = "../page/findPwPage.jsp";
            alert("일치하는 계정이 없습니다")
        }
    </script>
</body>
</html>
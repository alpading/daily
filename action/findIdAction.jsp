<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    String nameValue = request.getParameter("nameValue");
    String phoneValue = request.getParameter("phoneValue");
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "SELECT * FROM account WHERE name = ? AND phone = ?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,nameValue);
    query.setString(2,phoneValue);
    ResultSet result = query.executeQuery();

    ArrayList<String> idList = new ArrayList<String>();
    
    int length = 0;

    while(result.next()){
        String id = result.getString(2);
        idList.add("\"" + id + "\"");
        length ++;
    }
    if (length > 0){
        session.setAttribute("findId",idList.get(0));
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
        var findId = <%=idList%>;
        location = "../page/findIdPage.jsp";
    </script>
</body>
</html>
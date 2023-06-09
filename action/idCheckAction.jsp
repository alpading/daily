<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<%
    Class.forName("com.mysql.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/daily","stageus","0116");

    String sql = "SELECT * FROM account";
    PreparedStatement query = connect.prepareStatement(sql);
    ResultSet result = query.executeQuery();

    ArrayList<String> idList = new ArrayList<String>();

    int idListLength = 0;

    while(result.next()){
        String id = result.getString(2);
        idList.add("\"" + id + "\"");
        idListLength++;
    }

    String idValue = request.getParameter("idValue");
    ArrayList<String> idValueList = new ArrayList<String>();
    idValueList.add("\"" + idValue + "\"");

    int idCheck = 1;

    if(idList.contains("\"" + idValue + "\"")){
        idCheck = 0;
    }

    session.setAttribute("idCheck",idCheck);

    String nameValue = request.getParameter("nameValue");
    String pwValue = request.getParameter("pwValue");
    String pwCheckValue = request.getParameter("pwCheckValue");
    String phoneValue = request.getParameter("phoneValue");
    String positionValue = request.getParameter("positionValue");

    ArrayList<String> signupDataList = new ArrayList<String>();
    
    signupDataList.add("\"" + idValue + "\"");
    signupDataList.add("\"" + nameValue + "\"");
    signupDataList.add("\"" + pwValue + "\"");
    signupDataList.add("\"" + pwCheckValue + "\"");
    signupDataList.add("\"" + phoneValue + "\"");
    signupDataList.add("\"" + positionValue + "\"");

    session.setAttribute("signupDataList",signupDataList);
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
        var idCheck = <%=idCheck%>;
        var idValue = <%=idValueList%>;
        var idList = <%=idList%>

        location = "../page/signupPage.jsp"
    </script>
</body>
</html>
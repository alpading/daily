<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>

<!-- 배열 길이 -->

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

    int idCheck = 0;

    if(idList.contains(idValue)){
        idCheck = 1;
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
        var idCheck = <%=idCheck%>;
        var idValue = <%=idValueList%>;

        alert(idValue)
        if (idCheck == 0){
            alert("사용가능한 아이디입니다")
        }
        else if (idCheck == 1){
            alert("이미 해당 아이디가 존재합니다")
        }
        // document.getElementById("idConstraints").innerHTML = "사용가능한 아이디";
        // document.getElementById("idConstraints").style.color = "blue";
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Data Base 연동 프로그램</title>
</head>
<body>

<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "select sysdate from dual";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.println("출력 : " + rs.getString(1));
	}

}catch(Exception e){
	e.printStackTrace();
}











%>



</body>
</html>
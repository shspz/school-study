<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String custno=request.getParameter("custno");
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");

try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt=con.createStatement();
	String sql="";
	sql=" insert into ai01_member values( "+custno+",'"+custname+"','"+phone+"','"+address+"','"+joindate+"','"+grade+"','"+city+"')";
	stmt.executeUpdate(sql);
	

}catch (Exception e){
	e.printStackTrace();
}
%>
<script type="text/javascript">
</script>
</body>
</html>

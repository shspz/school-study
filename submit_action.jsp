<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String goods_cd=request.getParameter("goods_cd");
String goods_nm=request.getParameter("goods_nm");
String goods_price=request.getParameter("goods_price");
String cost=request.getParameter("cost");
String in_date=request.getParameter("in_date");

try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "Insert into ai09_goods values('"+goods_cd+"','"+goods_nm+"','"+goods_price+"','"+cost+"','"+in_date+"')";
	ResultSet rs = stmt.executeQuery(sql);
	response.sendRedirect("m2.jsp");

}catch(Exception e){
	e.printStackTrace();
}











%>










</body>
</html>
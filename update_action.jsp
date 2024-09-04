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


try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "update ai09_goods set goods_nm='"+goods_nm+"',goods_price="+goods_price+",cost="+cost+" where goods_cd='"+goods_cd+"'";
	ResultSet rs = stmt.executeQuery(sql);
	response.sendRedirect("update.jsp");

}catch(Exception e){
	e.printStackTrace();
}











%>










</body>
</html>
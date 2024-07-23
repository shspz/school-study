<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String al=request.getParameter("goods_cd");
String bl=request.getParameter("goods_nm");
String cl=request.getParameter("goods_price");
String dl=request.getParameter("cost");
String el=request.getParameter("in-date");
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	Statement stmt = con.createStatement();
	String sql = " insert into  tbl_goods_01 " + 
			" values("+al+","+bl+","+cl+","+dl+","+el+") ";
	stmt.executeUpdate(sql);
	response.sendRedirect("list_m2.jsp");
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>


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
String sale_no=request.getParameter("sale_no");
String sale_ymd=request.getParameter("sale_ymd");
String sale_fg=request.getParameter("sale_fg");
String store_cd=request.getParameter("store_cd");
String goods_cd=request.getParameter("goods_cd");
String sale_cnt=request.getParameter("sale_cnt");
String pay_type=request.getParameter("pay_type");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "Insert into ai09_sale values('"+sale_no+"','"+sale_ymd+"','"+sale_fg+"','"+store_cd+"','"+goods_cd+"','"+sale_cnt+"','"+pay_type+"')";
	ResultSet rs = stmt.executeQuery(sql);
	response.sendRedirect("m1.jsp");

}catch(Exception e){
	e.printStackTrace();
}











%>




</body>
</html>
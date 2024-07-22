<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String strDate="";
String custno="";
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection
			
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt=con.createStatement();
	String sql="select max(custno)+1 custno from ai01_member";
	ResultSet rs=stmt.executeQuery(sql);
	rs.next();
	custno=rs.getString("custno");
	
}catch (Exception e){
	e.printStackTrace();
}
%>

<section>
<h2><b>홈쇼핑 회원 등록</b></h2><br>
<form method ="get" action="action.jsp" name="frm">
<table border="1">
<tr><td>회원번호(자동발생)</td>
	<td><input type="text" name="custno"
	value="<%= custno %>" readonly="readonly"></td></tr>
<tr><td>회원성명</td>
	<td><input type="text" name="custname"></td></tr>
<tr><td>회원전화</td>
	<td><input type="text" name="phone"></td></tr>
<tr><td>회원주소</td>
	<td><input type="text" name="address"></td></tr>
<tr><td>가입일자</td>
	<td><input type="date" name="joindate" value=<%=strDate %>
	readonly="readonly"></td></tr>
<tr><td>고객등급<br>[A:VIP,B:일반,C:직원]</td>
	<td><input type="text" name="grade"></td></tr>
<tr><td>도시코드</td>
	<td><input type="text" name="city"></td></tr>
<tr><td colspan="2">
		<input type="submit" value="등록" onclick="return aaa()">
		<input type="button" value="조회" onclick="return search()"></td></tr>
		
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
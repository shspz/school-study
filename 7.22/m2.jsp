<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>
			<b>회원 목록 조회/수정</b>
		</h2>
		<br>

		<form>
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
				</tr>
			
<%
String grade = "";
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	Statement stmt = con.createStatement();
	String sql = "select * from member_tbl_02 order by custno";
	ResultSet rs = stmt.executeQuery(sql);

	while (rs.next()) {
		grade = rs.getString("grade");
		switch(grade){
		case "A": grade = "VIP"; break;
		case "B": grade="일반"; break;
		case "C": grade="직원"; break;
		}
%>
<tr><td><a href = "modify.jsp?mod_custno = <%=rs.getString("custno") %>">
<%=rs.getString("custno") %></a></td>
<td><%=rs.getString("custname") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("joindate") %></td>
<td><%=grade %></td>
<td><%=rs.getString("city") %></td>
</tr>
<%
		}
	}
catch(Exception e){
	e.printStackTrace();
}
%>

			</table>
		</form>
	</section>
</body>
</html>

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
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>지역별검사건수</h2>
<table border = 1>
<tr>
<td>지역별검사건수</td><td>지역명</td><td>검사건수</td>
</tr>
	<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "select ap.p_city 지역코드, " +
    					" case ap.p_city " +
    					" when '10' then '서울' " +
    					" when '20' then '경기' " +
					    " when '30' then '강원' " +
					    " when '40' then '대구' " +
					    " end 지역명, " +
					    " count(ar.t_code)/5 " +
					" from ai_lab_test al, ai_patient ap, ai_result ar " +
					" where ar.p_no = ap.p_no " +
					" group by ap.p_city " +
					" order by ap.p_city";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td style='text-align: left'>" + rs.getString(1) + "</td>");
			out.print("<td style='text-align: left'>" + rs.getString(2) + "</td>");
			out.print("<td style='text-align: left'>" + rs.getString(3) + "</td>");;
			out.print("</tr>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

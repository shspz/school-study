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
<h2>검사결과조회</h2>
<table border = 1>
<tr>
<th>환자코드</th><th>환자 이름</th><th>검사 명</th><th>검사 시작일</th><th>검사 상태</th><th>검사 완료일</th><th>검사 결과</th>
</tr>
	<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "select ap.p_no, ap.p_name, al.t_name, ar.t_sdate, " +
					" case ar.t_status when '1' then '검사 중' " +
    				" else  '검사 완료' end, " +
					" ar.t_ldate, " +
					" case ar.t_result when 'X' then '미입력' " +
   					" when 'P' then '양성' " +
   					" when 'N' then '음성' end " +
					"from ai_patient ap,ai_lab_test al,ai_result ar " +
					" where ap.p_no = ar.p_no and al.t_code = ar.t_code";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td>" + rs.getString(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td>" + rs.getString(3) + "</td>");
			out.print("<td>" + rs.getString(4) + "</td>");
			out.print("<td>" + rs.getString(5) + "</td>");
			out.print("<td>" + rs.getString(6) + "</td>");
			out.print("<td>" + rs.getString(7) + "</td>");
			out.print("</tr>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</table>
</section>
<jsp:include page="header.jsp"></jsp:include>
</body>
</html>

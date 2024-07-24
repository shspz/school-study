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
<h2>환자조회</h2>
<table border = 1>
<tr>
<th>환자 코드</th><th>환자 이름</th><th>환자 생년월일</th><th>환자 성별</th><th>환자 전화번호</th><th>환자 거주지</th>
</tr>
	<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = " SELECT ap.p_no, " + 
				" ap.p_name, " +
			       " SUBSTR(ap.p_birth, 1, 4) || '년' || SUBSTR(ap.p_birth, 5, 2) || '월' || SUBSTR(ap.p_birth, 7, 2) || '일' , " +
			       " CASE ap.p_gender " +
			          "  WHEN 'M' THEN '남자' " +
			           " WHEN 'F' THEN '여자' " +
			           " ELSE '기타' " +
			      "  END AS p_gender, " +
			       " ap.p_tel1 || '-' || ap.p_tel2 || '-' || ap.p_tel3, " +
			       " CASE ap.p_city " +
			          "  WHEN '10' THEN '서울' " +
			          "  WHEN '20' THEN '경기' " +
			           " WHEN '30' THEN '강원' " +
			           " WHEN '40' THEN '대구' " +
			           " ELSE '기타' " +
			      "  END  " +
			" FROM ai_patient ap " ;
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td>" + rs.getString(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td>" + rs.getString(3) + "</td>");
			out.print("<td>" +  rs.getString(4) + "</td>");
			out.print("<td>" + rs.getString(5) + "</td>");
			out.print("<td>" + rs.getString(6) + "</td>");
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

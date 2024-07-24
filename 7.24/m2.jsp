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
<h2>판매관리</h2>
<table border = 1>
<tr>
<th>비번호</th><th>상품코드</th><th>판매날짜</th><th>매장코드</th><th>상품명</th><th>판매수량</th><th>총판매량</th>
</tr>
	<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "select sa.saleno,sa.pcode, " + 
			    " to_char(sa.saledate,'YYYY-MM-DD'),sa.scode, pr.name, sa.amount, " +
			    " to_char(pr.cost * sa.amount,'999,999,999') " +
			" from kw_salelist_2022 sa, kw_product_2022 pr " +
			" where sa.pcode = pr.pcode";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			out.print("<tr>");
			out.print("<td>" + rs.getString(1) + "</td>");
			out.print("<td style='text-align: left'>" + rs.getString(2) + "</td>");
			out.print("<td>" + rs.getString(3) + "</td>");
			out.print("<td style='text-align: left'>" + rs.getString(4) + "</td>");
			out.print("<td>" + rs.getString(5) + "</td>");
			out.print("<td style='text-align: left'>" + rs.getString(6) + "</td>");
			out.print("<td>" + rs.getString(7) + "원</td>");
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

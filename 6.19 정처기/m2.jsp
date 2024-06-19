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
	 	<h2 style="text-align : center"><b>편의점 매출 관리 프로그램</b></h2>
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>단가</td>
				<td>원가</td>
				<td>입고일자</td>
			</tr>
			<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				Statement stmt = con.createStatement();
				String sql = "select goods_cd, goods_nm, to_char(goods_price, '9,999'), to_char(cost, '9,999'),to_char(in_date, 'YYYY-MM-DD') FROM kw09_goods";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getString(1) + "</td>");
					out.print("<td>" + rs.getString(2) + "</td>");
					out.print("<td>" + rs.getString(3) + "원</td>");
					out.print("<td>" + rs.getString(4) + "원</td>");
					out.print("<td>" + rs.getString(5) + "</td>");
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

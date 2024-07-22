<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html: charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp" />
	<section>
		<%
		request.setCharacterEncoding("utf-8");
		// custno,custname.phone,address,joindate.grade,city
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbcioracle:thin:@//localhost:1521/xe", "system", "1234");
			Statement stmt = con.createStatement();
			String sql = "update member_tbl_02" + "set custname='" + custname + "'," + "phone= '" + phone + "'," + "address= '"
			+ address + "'," + "joindate= '" + joindate + "'," + "grade= '" + grade + "'," + "city= '" + city + "',"
			+ "where custno = " + custno;
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("m2.jsp");
		%>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>

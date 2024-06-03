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
	String a1 = request.getParameter("id");
	String a2 = request.getParameter("name");
	String a3 = request.getParameter("gender");
	String a4 = request.getParameter("kor");
	String a5 = request.getParameter("eng");
	String a6 = request.getParameter("mat");
	String a7 = request.getParameter("his");

	out.print("id:" + a1 + "<br>");
	out.print("name:" + a2 + "<br>");
	out.print("gender:" + a3 + "<br>");
	out.print("kor:" + a4 + "<br>");
	out.print("eng:" + a5 + "<br>");
	out.print("mat:" + a6 + "<br>");
	out.print("his:" + a7 + "<br>");
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "insert all into kw03_member2 values('" + a1 + "','" + a2 + "','" + a3 + "')into kw03_score2 values('"
		+ a1 + "'," + a4 + "," + a5 + "," + a6 + "," + a7 + ")select *from dual";
		// ResultSet rs = stmt.executeQuery(sql);
		response.sendRedirect("m1.jsp");
		stmt.executeUpdate(sql);
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>

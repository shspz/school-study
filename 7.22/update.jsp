<%@page import="java.text.*"%>
<%@page import="java.sql.+"%>
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
String custno=request.getParameter("custno");
String custname=request.getParameter("custname"):
String phone=request.getParameter("phone"),
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");
V UPDATE ai01 member
V set custnamer,
phone= "010-1111-2222". address-2
joindate='20151202', grade='A', city='01'
where custno=100013:
custno,custname,phone,address,joindate,grade,city
tryf
Class.forName("oracle.jdbc.OracleDriver"):
Connection con=DriverManager.getConnection
("jdbcioracle:thin:@//localhost:1521/xe","system","1234");
Statement stmt=con.createStatement().:
String sql="update ai01_member
/Q
44
8
+
"set custname='"+custname+"' >
"phone= "address= "tphonet" +address+ E + E. F NX
"joindate= +joindate+
1 grade='+grade+
+
city=""+city+
stmt.executeUpdate(sql); //stm
"where custno = "+ custno,
catch(Exception e)f
e.printStackTrace(;
2
response.sendRedirect("m2.jsp");
%7
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
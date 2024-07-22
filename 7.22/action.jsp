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
request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지
String custno=request.getParameter("custno");
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");;
String grade=request.getParameter("grade");
String city=request.getParameter("city");
try{
   Class.forName("oracle.jdbc.OracleDriver");
   Connection con=DriverManager.getConnection
           ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
   Statement stmt=con.createStatement();
//    insert into member_tbl_02 values
// (100001,'김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
   String sql="insert into member_tbl_02 values( "+
            " "+custno+",'"+custname+"','"+phone+"', "+
            " '"+address+"','"+joindate+"','"+grade+"','"+city+"' "+
               ") ";
           stmt.executeUpdate(sql);
           response.sendRedirect("m1.jsp");
}
catch(Exception e){
   e.printStackTrace();
}
%>
</body>
</html>

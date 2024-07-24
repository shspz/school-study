=========================================================================================================================책에 있는 원래 코드=================================================================================================================================================
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
String a1=request.getParameter("saleno");
String a2=request.getParameter("pcode");
String a3=request.getParameter("saledate");
String a4=request.getParameter("scode");
String a5=request.getParameter("amount");

	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		Statement stmt = con.createStatement();
		String sql = "insert into kw_salelist_2022 "+ 
		" values ("+a1+","+a2+","+a3+","+a4+","+a5+")";

		stmt.executeUpdate(sql);
	response.sendRedirect("list.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
=======================================================================================================================에러나서 gpt돌려서 나온 코드==========================================================================================================================================
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
        String a1 = request.getParameter("saleno");
        String a2 = request.getParameter("pcode");
        String a3 = request.getParameter("saledate");
        String a4 = request.getParameter("scode");
        String a5 = request.getParameter("amount");

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

            // SQL 쿼리문 준비
            String sql = "INSERT INTO kw_salelist_2022 (saleno, pcode, saledate, scode, amount) VALUES (?, ?, ?, ?, ?) ";
            PreparedStatement pstmt = con.prepareStatement(sql);

            // 매개변수 설정
            pstmt.setString(1, a1);
            pstmt.setString(2, a2);
            pstmt.setString(3, a3);
            pstmt.setString(4, a4);
            pstmt.setString(5, a5);

            // SQL 쿼리 실행
            pstmt.executeUpdate();

            // 연결 해제
            pstmt.close();
            con.close();

            response.sendRedirect("list.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>

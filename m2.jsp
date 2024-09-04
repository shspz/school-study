<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>상품관리</b></h2>
<table border="1">
<tr>
  <th>상품코드</th>
  <th>상품명</th>
  <th>단가</th>
  <th>원가</th>
  <th>입고일자</th>
</tr>




<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = " select goods_cd,goods_nm,to_char(goods_price, '9,999'),to_char(cost, '9,999'),to_char(in_date, 'YYYY-mm-dd') "+
"			from ai09_goods";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.println("<tr>");
		out.println("<td style='text-align: center;'><a href='update.jsp?goods_cd="+rs.getString(1)+"&date="+rs.getString(5)+"'>" + rs.getString(1) + "</td>");
		out.println("<td style='text-align: center;'>" + rs.getString(2) + "</td>");
		out.println("<td style='text-align: right;'>&#8361;" + rs.getString(3) + "</td>");
		out.println("<td style='text-align: right;'>&#8361;" + rs.getString(4) + "</td>");
		out.println("<td>" + rs.getString(5) + "</td>");
		out.println("</tr>");
	}

}catch(Exception e){
	e.printStackTrace();
}




%>

<tr>
  <td colspan="5" style="text-align: center;"><input type="button" value="등록" onclick="location.href='submit.jsp'"></td>

</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
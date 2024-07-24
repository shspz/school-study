<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품별 판매액</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<section>
<h2>상품별 판매액</h2>
<table border = "1">
<tr>
	<th>상품코드</th><th>상품명</th><th>상품별 판매액</th>
</tr>
<%
DecimalFormat df = new DecimalFormat("###,##0");
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "select ap.pcode, ap.name, sum(ap.cost*asa.amount) re "+
				 " from kw_product_2022 ap, kw_shop_2022 ash, kw_salelist_2022 asa "+
				 " where asa.pcode = ap.pcode and asa.scode = ash.scode "+
				 " group by ap.pcode, ap.name "+
				 " order by ap.pcode";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.print("<tr><td>"+rs.getString("pcode")+"</td>");
		out.print("<td>"+rs.getString("name")+"</td>");
			rs.getInt("cost")*rs.getInt("amount")+
			"</td></tr>");
		out.print("<td>"+df.format(rs.getInt("re"))+"</td>");
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

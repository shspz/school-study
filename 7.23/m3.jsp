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
<h2><b>점포별매출현황</b></h2>
<table border="1">
<tr>
  <td>점포명</td>
  <td>현금매출</td>
  <td>카드매출</td>
  <td>총매출</td>
</tr>
<%
try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
Statement stmt=con.createStatement();
String sql="select tst.store_nm, "+
"sum(case tsa.pay_type "+
"        when '01' then tsa.sale_cnt * tg.goods_price "+
 "                     else 0 end) , "+
"sum(case tsa.pay_type "+
 "       when '02' then tsa.sale_cnt*tg.goods_price "+
 "                     else 0 end) , "+
"sum(tsa.sale_cnt*tg.goods_price)  "+
"FROM tbl_store_003 tst, tbl_goods_01 tg, tbl_sale_003 tsa "+
"where tsa.store_cd=tst.store_cd and tsa.goods_cd=tg.goods_cd "+
"group by tst.store_nm "+
"order by sum(tsa.sale_cnt*tg.goods_price) desc";
ResultSet rs=stmt.executeQuery(sql);

while(rs.next()){
	out.print("<tr>");
	out.print("<td>"+rs.getString(1) +"</td>");
	out.print("<td style='text-align: right'>"+rs.getString(2) +"원</td>");
	out.print("<td style='text-align: right'>"+rs.getString(3) +"원</td>");
	out.print("<td style='text-align: right'>"+rs.getInt(4) +"원</td>");
	out.print("</tr>");
}
}catch(Exception e){
e.printStackTrace();
}
%>

</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

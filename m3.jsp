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
<h2><b>점표별매출현황</b></h2>
<table border="1">
<tr>
  <th>점포명</th>
  <th>현금매출</th>
  <th>카드매출</th>
  <th>총매출</th>
</tr>



<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = " select tst.store_nm, "+
"			sum(case  tsa.pay_type when '01' then tsa.sale_cnt*tg.goods_price "+
"	                else 0  end) po, "+
"	sum(case  tsa.pay_type when '02' then tsa.sale_cnt*tg.goods_price "+
"	                else 0  end) co, "+
"	sum(tsa.sale_cnt*tg.goods_price) rr, "+
" tsa.store_cd "+
"	from ai09_sale tsa, ai09_store tst,ai09_goods tg "+
"	where tsa.store_cd=tst.store_cd and tsa.goods_cd=tg.goods_cd "+
"	group by tst.store_nm,tsa.store_cd "+
"	order by rr desc";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.println("<tr>");
		out.println("<td style='text-align: center;'><a href='m4.jsp?store_cd="+rs.getString(5)+"'>" + rs.getString(1) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(2) + "원</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(3) + "원</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(4) + "원</td>");
		out.println("</tr>");
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
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
<%
	String store_cd = request.getParameter("store_cd");
%>
<h2><b><%=store_cd%></b></h2>
<table border="1">
<tr>
  <th>판매구분</th>
  <th>판매번호</th>
  <th>판매일자</th>
  <th>상품명</th>
  <th>판매수량</th>
  <th>판매금액</th>
  <th>수취구분</th>
</tr>



<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = " select "+
" case when asl.sale_fg = '1' then '판매' "+
" when asl.sale_fg = '2' then '판매취소' "+
" end, asl.sale_no,asl.sale_ymd,ag.goods_nm,asl.sale_cnt, "+
" (ag.cost+ag.goods_price), "+
" case when asl.pay_type = '01' then '현금' "+
" when asl.pay_type = '02' then '카드' "+
" else '현금' "+
" end "+
" from ai09_goods ag, ai09_sale asl "+
" where ag.goods_cd=asl.goods_cd and asl.store_cd = '"+store_cd+"'";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.println("<tr>");
		out.println("<td style='text-align: center;'>" + rs.getString(1) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(2) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(3) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(4) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(5) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(6) + "</td>");
		out.println("<td style='text-align: right;'>" + rs.getString(7) + "</td>");
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
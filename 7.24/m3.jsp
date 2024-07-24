<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점별 판매액</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<section>
<h2>매장별 판매액</h2>
<table border="1">
<tr>
    <th>매장코드</th>
    <th>매장명</th>
    <th>매장별 판매액</th>
</tr>
<%
DecimalFormat df = new DecimalFormat("###,##0");
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
    Statement stmt = con.createStatement();
    String sql = "SELECT ash.scode, ash.sname, SUM(ap.cost * asa.amount) AS total_sale " +
                 "FROM kw_product_2022 ap, kw_shop_2022 ash, kw_salelist_2022 asa " +
                 "WHERE asa.pcode = ap.pcode AND asa.scode = ash.scode " +
                 "GROUP BY ash.scode, ash.sname " +
                 "ORDER BY ash.scode";
    ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()) {
        String scode = rs.getString("scode");
        String sname = rs.getString("sname");
        int totalSale = rs.getInt("total_sale");
        
        out.print("<tr>");
        out.print("<td>" + scode + "</td>");
        out.print("<td>" + sname + "</td>");
        out.print("<td>" + df.format(totalSale) + "원</td>");
        out.print("</tr>");
    }
    rs.close();
    stmt.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table>
</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

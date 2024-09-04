<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{text-align: center;}


</style>
<script>
function



</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String goods_cd= request.getParameter("goods_cd");
String date= request.getParameter("date");
%>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "select max(goods_cd)+1 from ai09_goods";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	goods_cd=rs.getString(1);
	
}catch(Exception e){
	e.printStackTrace();
}
%>
<%
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();
	String sql = "select to_char(sysdate, 'YYYY-MM-DD') from dual";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	date=rs.getString(1);
	
}catch(Exception e){
	e.printStackTrace();
}
%>
<section>
<h2><b>상품정보 등록</b></h2>
<form action="submit_action.jsp" name="frm2">
<table border="1">
<tr>
  <th>상품코드(자동채번)</th>
  <td><input type="number" name="goods_cd" value= "<%=goods_cd %>" readonly="readonly"></td>
</tr>

<tr>
  <th>상품명</th>
  <td><input type="text" name="goods_nm"></td>
</tr>


<tr>
  <th>단가</th>
  <td><input type="number" name="goods_price"></td>
</tr>
  
<tr>
  <th>원가</th>
  <td><input type="number" name="cost"></td>
</tr>
  
<tr>
  <th>입고일자(자동세팅)</th>
  <td><input type="number" name="in_date" value="<%= date %>" readonly="readonly"></td>
</tr>

<tr>
  <td colspan="2"><input type="submit" value="저장" onclick="return ccc();">
  <input type="button" value="상품목록" onclick="location.href='m2.jsp'"></td>










</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
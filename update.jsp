<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{text-align: center;}


</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String n1= request.getParameter("goods_cd");
String n2= request.getParameter("date");
%>
<section>
<h2><b>상품정보 수정</b></h2>
<table border="1">
<tr>
  <th>상품코드(자동채번)</th>
  <td><input type="number" name="goods_cd" value="<%=n1 %>" readonly="readonly"></td>
</tr>

<tr>
  <th>상품명</th>
  <td><input type="text"name="goods_nm"></td>
</tr>


<tr>
  <th>단가</th>
  <td><input type="number" name="goods_price"></td>
</tr>
  
<tr>
  <th>원가</th>
  <td><input type="number"name="cost"></td>
</tr>
  
<tr>
  <th>입고일자(자동세팅)</th>
  <td><input type="number" name="cost" value="<%=n2 %>" readonly="readonly"></td>
</tr>

<tr>
  <td colspan="2"><input type="button" value="수정" onclick="return ddd();">
  <input type="button" value="상품목록" onclick="location.href='m2.jsp'"></td>








</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function aaa(){
	if(document.frm.goods_nm.value.length=0){
		alert("상품명을 입력하지 않았습니다.");
	    frm.goods_nm.focus();
	    return false;
	}
	if(document.frm.goods_price.value.length=0){
		alert("단가를 입력하지 않았습니다.");
	    frm.goods_price.focus();
	    return false;
	}
	if(document.frm.cost.value.length=0){
		alert("원가를 입력하지 않았습니다.");
	    frm.cost.focus();
	    return false;
	}
	success();
	return false;
}
function success(){
	alert("상품정보 등록이 정상적으로 저장되었습니다.")
	window.location="m1.jsp";
}















</script>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>상품정보 수정</b></h2>

<%
String cd=request.getParameter("goods_cd");
String ddd="";

try{
Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection
("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
Statement stmt=con.createStatement();
String sql="select * from tbl_goods_01 where goods_cd=goods_cd";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
ddd=rs.getString(5);

}catch(Exception e){
e.printStackTrace();
}

%>


<form name='frm' action='m2_update_re.jsp' method='get'>
<table border="1">
<tr>
  <td>상품코드(자동채번)</td>
  <td><input type="text" name="goods_cd"></td>
</tr>

<tr>
  <td>상품명</td>
  <td><input type="text" name="goods_nm"></td>
</tr>

<tr>
  <td>단가</td>
  <td><input type="text" name="goods_price"></td>
</tr>

<tr>
  <td>원가</td>
  <td><input type="text" name="cost"></td>
</tr>

<tr>
  <td>입고일자(자동세팅)</td>
  <td><input type="date" name="in-date" value="20060101" readonly="readonly"></td>
</tr>

<tr>
  <td colspan=2 style='text-align: center;'>
  <input type="submit" value="수정" onclick="return aaa();">
  <input type="button" value="상품목록" onclick="location.href='m2.jsp'"></td>
</tr>



</table>
</form>
</section>
<jsp:include page="header.jsp"></jsp:include>








</body>
</html>

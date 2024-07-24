===================================================================================form 부분 action2 대신 다른거 넣어야함 코드조회부분============================================================
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ccc{
		if(document.frm2.pcode.value.length != 4){
			alert("판매코드 변호가 입력되지 않았습니다.");
			frm.pcode.foucs();
			return false;
		}
		alert("판매코드가 입력 되었습니다!");
		return true;
		
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<section>
&nbsp;<p><h2>판매코드 조회하기</h2>&nbsp;<p>
<form name="frm2" action="action2.jsp">
<table border="1">
<tr><td>판매코드 번호를 입력하시오.</td>
	<td align="left"><input type="text" name="pcode"></td></tr>
<tr><td colspan="2">
	<input type="submit" value="판매코드조회" onclick="return ccc()">
	<input type="button" value="홈으로" onclick="location.href='index.jsp'"></td></tr>
</table>
</form>
</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

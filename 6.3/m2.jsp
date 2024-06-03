<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function aaa() {
		if (document.frm.id.value.length == 0) {
			alert("id을 입력하지 않았습니다.");
			return false;
		}
		if (document.frm.name.value.length == 0) {
			alert("이름를 입력하지 않았습니다.");
			return false;
		}
		if (document.frm.gender.value.length == 0) {
			alert("성별을 입력하지 않았습니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<form name="frm" action="ttt.jsp">
			<table border="1">
				<tr>
					<td>id</td>
					<td><input type="text" name=id><br /></td>
				</tr>
				<tr>
					<td>name</td>
					<td><input type="text" name=name><br /></td>
				</tr>
				<tr>
					<td>gender</td>
					<td><input type="text" name=gender><br /></td>
				</tr>
				<tr>
					<td>kor</td>
					<td><input type="number" name=kor><br /></td>
				</tr>
				<tr>
					<td>eng</td>
					<td><input type="number" name=eng><br /></td>
				</tr>
				<tr>
					<td>mat</td>
					<td><input type="number" name=mat><br /></td>
				</tr>
				<tr>
					<td>his</td>
					<td><input type="number" name=his><br /></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" onclick="return aaa();"></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

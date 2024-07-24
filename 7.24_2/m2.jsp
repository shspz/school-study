<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검사결과입력</title>
		
		<link href="style.css" rel="stylesheet">
		
		<script type="text/javascript">
			function aaa(){
		</script>
		
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%

			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				Statement stmt = con.createStatement();
				String sql = "";
				ResultSet rs = stmt.executeQuery(sql);

		%>
		
		<section>
			&nbsp;<p><h2>검사결과입력</h2>
			
			<form action="action.jsp" name="frm">
				<table border=1>
					
					<tr>
						<td>환자코드</td>
						<td>
							<input type = "text" name = "p_no">예)1001
						</td>
					</tr>
					<tr>
						<td>검사명</td>
						<td>
						<select name="p_name">
								<option value="">선택</option>
								<option value="A001">[T001]결핵</option>
								<option value="A002">[T002]장티푸스</option>
								<option value="A003">[T003]수두</option>
								<option value="B001">[T004]홍역</option>
								<option value="C001">[T005]콜레라</option>
							</select></td>
					</tr>
					<tr>
						<td>검사시작일</td>
						<td>
							<input type = "date" name = "p_birth">예)20200101
						</td>
					</tr>
					<tr>
						<td>검사상태</td>
						<td>
							<input type="radio" name="" value="01">검사 중
							<input type="radio" name="" value="02">검사 완료
						</td>
					</tr>
					<tr>
						<td>검사완료일</td>
						<td>
						<input type = "date" name = "a">예)20200101
						</td>
					</tr>
					<tr>
						<td>검사결과</td>
						<td>							
							<input type="radio" name="" value="01">미입력
							<input type="radio" name="" value="02">양성
							<input type="radio" name="" value="03">음성</td>
					</tr>
					<tr>
						<td colspan=2>
							<input type="submit" value="등록" onclick="return aaa();">
							<input type="button" value="재입력" onclick="bbb()">
						</td>
					</tr>
				</table>
			</form>
			
		</section>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>

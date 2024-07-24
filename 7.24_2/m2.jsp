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
			if(document.frm.p_no.value==""){
				alert("환자코드가 입력되지 않았습니다.");
				frm.p_no.focus();
				return false;
			}
			if(document.frm.p_name.value==""){
				alert("검사명 입력되지 않았습니다.");
				frm.p_name.focus();
				return false;
			}
			if(document.frm.p_birth.value==""){
				alert("검사시작일이 입력되지 않았습니다.");
				frm.p_birth.focus();
				return false;
			}
			if(document.frm.ing.value==""){
				alert("검사상태가 입력되지 않았습니다.");
				frm.ing.focus();
				return false;
			}
			if(document.frm.clear.value==""){
				alert("검사상태가 입력되지 않았습니다.");
				frm.clear.focus();
				return false;
			}
			if(document.frm.c_date.value==""){
				alert("검사완료일이 입력되지 않았습니다.");
				frm.c_date.focus();
				return false;
			}
			if(document.frm.none.value==""){
				alert("검사결과가 입력되지 않았습니다.");
				frm.none.focus();
				return false;
			}
			if(document.frm.positive.value==""){
				alert("검사결과가 입력되지 않았습니다.");
				frm.positive.focus();
				return false;
			}
			if(document.frm.negative.value==""){
				alert("검사결과가 입력되지 않았습니다.");
				frm.negative.focus();
				return false;
			}
			alert("정상적으로 등록이 완료되었습니다.");
			return true;
		}
		function bbb(){
			alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다!");
			return true;
		}

		</script>
		
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>

		
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
							<input type="radio" name="ing" value="01">검사 중
							<input type="radio" name="clear" value="02">검사 완료
						</td>
					</tr>
					<tr>
						<td>검사완료일</td>
						<td>
						<input type = "date" name = "c_date">예)20200101
						</td>
					</tr>
					<tr>
						<td>검사결과</td>
						<td>							
							<input type="radio" name="none" value="01">미입력
							<input type="radio" name=" positive" value="02">양성
							<input type="radio" name="negative" value="03">음성</td>
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

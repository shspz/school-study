<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검사 결과 입력</title>
		
		<link href="style.css" rel="stylesheet">
		
		<script type="text/javascript">
			function aaa() {
			    var frm = document.forms["frm"];
			    
			    if (frm.p_no.value == "") {
			        alert("환자코드가 입력되지 않았습니다.");
			        frm.p_no.focus();
			        return false;
			    }
			    
			    if (frm.p_name.value == "") {
			        alert("검사명이 선택되지 않았습니다.");
			        frm.p_name.focus();
			        return false;
			    }
			    
			    if (frm.p_d.value == "") {
			        alert("검사시작일이 입력되지 않았습니다.");
			        frm.p_d.focus();
			        return false;
			    }
			    
			    if (frm.p_check[0].checked == false && frm.p_check[1].checked == false) {
			        alert("검사상태가 선택되지 않았습니다.");
			        frm.p_check[0].focus();
			        return false;
			    }
			    
			    if (frm.p_ld.value == "") {
			        alert("검사완료일이 입력되지 않았습니다.");
			        frm.p_ld.focus();
			        return false;
			    }
			    
			    if (frm.p_ck[0].checked == false && frm.p_ck[1].checked == false && frm.p_ck[2].checked == false) {
			        alert("검사결과가 선택되지 않았습니다.");
			        frm.p_ck[0].focus();
			        return false;
			    }
			    
			    alert("정상적으로 등록되었습니다.");
			    return true;
			}
	
			function bbb() {
			    alert("모든 데이터를 삭제하고 처음부터 다시 입력합니다.");
			    return true;
			}
		</script>
		
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		
		<section>
			<h2>검사 결과 입력</h2>
			
			<form action="action.jsp" method="post" name="frm">
				<table border="1">
					
					<tr>
						<td>환자코드</td>
						<td>
							<input type="text" name="p_no">예)1001
						</td>
					</tr>
					<tr>
						<td>검사명</td>
						<td>
							<select name="p_name">
								<option value="">선택</option>
								<option value="T001">결핵</option>
								<option value="T002">장티푸스</option>
								<option value="T003">수두</option>
								<option value="T004">홍역</option>
								<option value="T005">콜레라</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>검사시작일</td>
						<td>
							<input type="text" name="p_d">예)20200101
						</td>
					</tr>
					<tr>
						<td>검사상태</td>
						<td>
							<input type="radio" name="p_check" value="1">검사 중
							<input type="radio" name="p_check" value="2">검사 완료
						</td>
					</tr>
					<tr>
						<td>검사완료일</td>
						<td>
							<input type="text" name="p_ld">예)20200101
						</td>
					</tr>
					<tr>
						<td>검사결과</td>
						<td>
							<input type="radio" name="p_ck" value="X">미입력
							<input type="radio" name="p_ck" value="P">양성
							<input type="radio" name="p_ck" value="N">음성
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록" onclick="return aaa();">
							<input type="reset" value="재입력" onclick="return bbb();">
						</td>
					</tr>
					
				</table>
			</form>
			
		</section>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>

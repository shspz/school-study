<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>매출 등록</title>
		
		<link href="style.css" rel="stylesheet">
		
		<script type="text/javascript">
			function aaa(){
				if(document.frm.sale_fg.value.length == 0){
					alert("판매구분을 선택하지 않았습니다.");
					return false;
				}
				if(document.frm.store_cd.value.length == 0){
					alert("판매점포를 선택하지 않았습니다.");
					return false;
				}
				if(document.frm.goods_cd.value.length == 0){
					alert("판매상품을 선택하지 않았습니다.");
					return false;
				}
				if(document.frm.sale_cnt.value.length == 0){
					alert("판매수량을 선택하지 않았습니다.");
					return false;
				}
				if(document.frm.pay_type[0].checked == false && 
						document.frm.pay_type[1].checked == false){
					alert("수취구분을 선택하지 않았습니다.");
					return false;
				}
				success();
				return true;
			}
			function success(){
				alert("매출이 정상적으로 저장 되었습니다.");
				window.location="m1.jsp";
			}
			function bbb(){
				alert("매출정보를 조회합니다.");
				window.location="m3	.jsp";
			}
		</script>
		
	</head>
	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<%
			String res = "";
			Date nowTime = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
				Statement stmt = con.createStatement();
				String sql = "SELECT TO_CHAR(NVL(MAX(sale_no), 0) + 1, '0000') AS re FROM tbl_sale_003";
				ResultSet rs = stmt.executeQuery(sql);
				if (rs.next()) {
					res = rs.getString("re");
				} else {
					res = "0001";
				}
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				res = "0001";
			}
		%>
		
		<section>
			&nbsp;<p><h2>매출 등록</h2>
			
			<form action="action.jsp" name="frm">
				<table border=1>
					
					<tr>
						<td>판매번호(자동발생)</td>
						<td><input type="text" name="sale_no" value="<%= res %>" readonly="readonly"></td>
					</tr>
					<tr>
						<td>판매일자(자동발생)</td>
						<td><input type="text" name="sale_ymd" value="<%= sf.format(nowTime) %>"></td>
					</tr>
					<tr>
						<td>판매구분</td>
						<td>
							<select name="sale_fg">
								<option value="">선택</option>
								<option value="1">판매</option>
								<option value="2">판매 취소</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매점포</td>
						<td>
							<select name="store_cd">
								<option value="">선택</option>
								<option value="A001">이태원점</option>
								<option value="A002">한남점</option>
								<option value="A003">도원점</option>
								<option value="B001">혜화점</option>
								<option value="C001">방배점</option>
								<option value="D001">사당점</option>
								<option value="D002">흑석점</option>
								<option value="E001">금호점</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매상품</td>
						<td>
							<select name="goods_cd">
								<option value="">선택</option>
								<option value="110001">라면</option>
								<option value="110002">빵</option>
								<option value="110003">과자</option>
								<option value="110004">탄산음료</option>
								<option value="110005">삼각김밥</option>
								<option value="110006">초콜릿</option>
								<option value="110007">우유</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>판매수량</td>
						<td><input type="text" name="sale_cnt"></td>
					</tr>
					<tr>
						<td>수취구분</td>
						<td>
							<input type="radio" name="pay_type" value="01">현금
							<input type="radio" name="pay_type" value="02">카드
						</td>
					</tr>
					<tr>
						<td colspan=2>
							<input type="submit" value="등록" onclick="return aaa();">
							<input type="button" value="조회" onclick="bbb()">
						</td>
					</tr>
					
				</table>
			</form>
			
		</section>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>

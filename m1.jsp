<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{text-align: center;}
</style>

<script>
function aaa(){
	if(document.frm.sale_no.value==""){
        alert("판매번호가 입력되지 않았습니다.");
        frm.sale_no.focus();
        return false;
	}
	if(document.frm.sale_ymd.value==""){
        alert("판매일자가 입력되지 않았습니다.");
        frm.sale_ymd.focus();
        return false;
	}
	if(document.frm.sale_fg.value==""){
        alert("판매구분이 입력되지 않았습니다.");
        frm.sale_fg.focus();
        return false;
	}
	if(document.frm.store_nm.value==""){
        alert("판매점포가 입력되지 않았습니다.");
        frm.store_nm.focus();
        return false;
	}
	if(document.frm.goods_nm.value==""){
        alert("판매상품이 입력되지 않았습니다.");
        frm.goods_nm.focus();
        return false;
	}
	if(document.frm.sale_cnt.value==""){
        alert("판매수량이 입력되지 않았습니다.");
        frm.sale_cnt.focus();
        return false;
	}
	if(document.frm.pay_type[0].checked == false &&
	   frm.pay_type[1].checked == false){
        alert("수취구분이 입력되지 않았습니다.");
        return false;
	}
	alert("매출이 정상적으로 저장되었습니다.");
	return true;
}


</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2><b>매출 등록</b></h2>
<form action="action.jsp" name="frm">
<table border="1">
<tr>
  <th>판매번호(자동발생)</th>
  <td><input type="number" name="sale_no"></td>
</tr>

<tr>
  <th>판매일자(자동발생)</th>
  <td><input type="number" name="sale_ymd"></td>
</tr>

<tr>
  <th>판매구분</th>
  <td>
  <select name="sale_fg">
  <option value="">선택</option>
  <option value="1">판매</option>
  <option value="2">판매취소</option>
  </select></td>
</tr>

<tr>
  <th>판매점포</th>
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
  <th>판매상품</th>
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
  <th>판매수량</th>
  <td><input type="number" name="sale_cnt"></td>
</tr>

<tr>
  <th>수취구분</th>
  <td><input type="radio" name="pay_type" value="01">현금
  	  <input type="radio" name="pay_type" value="02">카드</td>
</tr>

<tr>
  <td colspan="2"><input type="submit" value="등록" onclick="return aaa();"> <input type="button" value="조회"onclick="location.href='m3.jsp'"></td>





</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
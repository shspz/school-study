<script type="text/javascript">
function aaa(){
	if(document.frm.custanme.value.legth==0){
		alert("회원 성명이 입력되지 않았습니다.");
		frm.custname.foucs(); return false
	}
	if(document.frm.phone.value.legth==0){
		alert("회원 전화가 입력되지 않았습니다.");
		frm.phone.foucs(); return false
	}
	if(document.frm.address.value.legth==0){
		alert("회원 주소가 입력되지 않았습니다.");
		frm.address.foucs(); return false
	}
	if(document.frm.joindate.value.legth==0){
		alert("가입 일자가 입력되지 않았습니다.");
		frm.joindate.foucs(); return false
	}
	if(document.frm.grade.value.legth==0){
		alert("고객 등급이 입력되지 않았습니다.");
		frm.grade.foucs(); return false
	}
	if(document.frm.city.value.legth==0){
		alert("도시 코드가 입력되지 않았습니다.");
		frm.city.foucs(); return false
	}
	bbb();
	return true;
}
function bbb(){ alert("회원 등록이 완료되었습니다.");}
function bbb(){ window.location="m2.jsp";}
function modify{
	alert("수정으로 넘어갑니다.")
	window.location="update.jsp";
}
</script>

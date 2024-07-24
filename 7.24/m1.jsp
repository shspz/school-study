<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
    <link href="style.css" rel="stylesheet">
    
    <script type="text/javascript"> 
        function aaa() {
            if (document.frm.saleno.value == "") {
                alert("판매번호가 입력되지 않았습니다.");
                document.frm.saleno.focus();
                return false;
            }
            if (document.frm.pcode.value == "") {
                alert("상품코드가 입력되지 않았습니다.");
                document.frm.pcode.focus();
                return false;
            }
            if (document.frm.saledate.value == "") {
                alert("판매날짜가 입력되지 않았습니다.");
                document.frm.saledate.focus();
                return false;
            }
            if (document.frm.scode.value == "") {
                alert("매장코드를 입력하지 않았습니다.");
                document.frm.scode.focus();
                return false;
            }
            if (document.frm.amount.value == "") {
                alert("판매수량이 입력되지 않았습니다.");
                document.frm.amount.focus();
                return false;
            }
            alert("정상적으로 매장별 판매등록이 완료되었습니다.");
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
    
        <h2>판매등록</h2>
        
        <form action="action.jsp" name="frm" method="post">
            <table border="1">
                
                <tr>
                    <td>비번호</td>
                    <td>
                        <input type="number" name="saleno">
                    </td>
                </tr>
                <tr>
                    <td>상품코드</td>
                    <td>
                        <input type="text" name="pcode">
                    </td>
                </tr>
                <tr>
                    <td>판매날짜</td>
                    <td>
                        <input type="date" name="saledate">
                    </td>
                </tr>
                <tr>
                    <td>매장코드</td>
                    <td>
                        <input type="text" name="scode">
                    </td>
                </tr>
                <tr>
                    <td>판매수량</td>
                    <td>
                        <input type="number" name="amount">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="등록" onclick="return aaa();">
                        <input type="reset" value="다시쓰기" onclick="return bbb();">
                    </td>
                </tr>
                
            </table>
        </form>
        
    </section>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

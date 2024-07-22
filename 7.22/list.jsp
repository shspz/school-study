<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<jsp:include page="header.jsp" />
<section style="position:fixed; top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center"><b>회원 목록 조회/수정</b></h2><br>

<form style="display:flex; align-item:center;
justify-content:center;text-align:center">
<table border="1">
  <tr><td>회원번호</td><td>회원성명</td><td>번화번호</td>
      <td>주소</td><td>가입일자</td><td>고객등급호</td><td>매출</td></tr>
  <%
  Connection conn=null;
  Statement stmt=null;
  String grade="";
  try{
      conn=Util.getConnection();          //DB(Util.java)와 연결
      stmt=conn.createStatement();        //sql를 실행하기 위한 변수 생성
      String sql="select * from member_tbl_02 order by custno";
      ResultSet rs=stmt.executeQuery(sql); //stmt를 통해서 sql의 실행 결과
      while(rs.next()){
          grade=rs.getString("grade");
          switch(grade){
          case "A": grade="VIP";  break;
          case "B": grade="일반";  break;
          case "C": grade="직원";  break;
          }
  %>
    <tr>
      <td><a href="modify.jsp?mod_custno=<%=rs.getString("custno") %>"> <%=rs.getString("custno") %></a></td>
      <td><%=rs.getString("custname") %></td>
      <td><%=rs.getString("phone") %></td>
      <td><%=rs.getString("address") %></td>
      <td><%=rs.getDate("joindate") %></td>
      <td><%=grade %></td>
      <td><%=rs.getString("city") %></td>
    </tr>  
<%
    }
  }
  catch(Exception e){
        e.printStackTrace();  //단계별 에러 출력
  }
%>  
 
</table>
</form>


</section>
<jsp:include page="footer.jsp" />
</body>
</html>

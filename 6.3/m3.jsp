<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<br>
<h2><b>학생 성적 조회</b></h2>
<table border=1>
<tr>
	<td>학번</td> <td>이름</td> <td>학년</td> <td>반</td> <td>번호</td> <td>성별</td>
	<td>국어</td> <td>수학</td> <td>영어</td> <td>역사</td> <td>합계</td> <td>평균</td> <td>순위</td>
</tr>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	Statement stmt = con.createStatement();
	String sql = "select mt.id, name, substr(mt.id,1,1), substr(mt.id,2,2),"+
	" substr(mt.id,4,2), mt.gender, st.korea, st.math, st.english," +
	" st.history, st.korea+st.math+st.english+st.history hap," +
	" (st.korea+st.math+st.english+st.history)/4 pyg, " +
	" rank() over(order by st.korea+st.math+st.english+st.history desc) rank1 " +
	" from kw03_member2 mt, kw03_score2 st" +
	" where mt.id= st.id";
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		out.print("<tr>");
		out.print("<td>"+rs.getInt(1)+"</td>");
		out.print("<td>"+rs.getString("name")+"</td>");
		out.print("<td>"+rs.getInt(3)+"</td>");
		out.print("<td>"+rs.getInt(4)+"</td>");
		out.print("<td>"+rs.getInt(5)+"</td>");
		out.print("<td>"+rs.getString("gender")+"</td>");
		out.print("<td>"+rs.getString("korea")+"</td>");
		out.print("<td>"+rs.getString("math")+"</td>");
		out.print("<td>"+rs.getString("english")+"</td>");
		out.print("<td>"+rs.getString("history")+"</td>");
		out.print("<td>"+rs.getString("hap")+"</td>");
		out.print("<td>"+rs.getString("pyg")+"</td>");
		out.print("<td>"+rs.getString("rank1")+"</td>");
		out.print("</tr>");
	}
	out.print("<tr>");
	out.print("<td colspan ='6'><td>국어 총합</td><td>수학 총합</td>");
	out.print("<td>영어 총합</td> <td>역사 총합</td> <td>총합</td>");
	out.print("<td>총 평균</td> <td>***********</td>");
	out.print("</tr>");
	String sql2 = "select sum(st.korea) a, sum(st.math) b,"+
	" sum(st.english) c, sum(st.history) d, count(*) av "+
	" from kw03_member2 mt, kw03_score2 st"+
	" where mt.id = st.id";
	ResultSet rs2 = stmt.executeQuery(sql2);
	rs2.next();
	float temp1 = rs2.getInt("a")+rs2.getInt("b")+rs2.getInt("c")+rs2.getInt("d");
		out.print("<tr>");
		out.print("<td colspan = '6'></td>");
		out.print("<td>"+rs2.getInt("a")+"</td>");
		out.print("<td>"+rs2.getInt("b")+"</td>");
		out.print("<td>"+rs2.getInt("c")+"</td>");
		out.print("<td>"+rs2.getInt("d")+"</td>");
		out.print("<td>"+temp1+"</td>");
		out.print("<td>"+ String.format("%.2f",temp1/4)+"</td>");
		out.print("<td>***********</td>");
		out.print("</tr>");
} catch (Exception e) {
	e.printStackTrace();
}
%>


</table>
</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

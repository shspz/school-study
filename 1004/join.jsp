<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <title>Document</title>
  </head>
  <body>
    <div class="ab">
      <nav>
        <a href="index.jsp">HOME</a>
        <a href="join.jsp">회원가입</a>
        <a href="login.jsp">로그인</a>
        <a href="bord.jsp">게시판</a>
      </nav>
      <div class="log">
        <h2>회원가입</h2>
      </div>
      <section class="se1">
        <form action = "action.jsp" name = "frm">
          <h2>회원가입</h2>
          <table>
            <tr>
              <td>아이디</td>
              <td>
                <input name ="id" type="text" />
              </td>
            </tr>
            <tr>
              <td>암호</td>
              <td>
                <input name ="password" type="text" />
              </td>
            </tr>
            <tr>
              <td>성별</td>
              <td>
                <input type="radio" name="gender" value="1" />남자
                <input type="radio" name="gender" value="2" />여자
              </td>
            </tr>
            <tr>
              <td>관심사항</td>
              <td>
                <input type="radio" name="Interests" value="1" />정치<br />
                <input type="radio" name="Interests" value="2" />경제<br />
                <input type="radio" name="Interests" value="3" />연애
              </td>
            </tr>
            <tr>
              <td>학력</td>
              <td>
                <select name = "education">
                    <option value="">학력을 선택하세요</option>
                    <option value="T001">초등학교 졸업</option>
                    <option value="T002">중학교 졸업</option>
                    <option value="T003">고등학교 졸업</option>
                    <option value="T004">대학교 졸업</option>
                </select>
            </td>
            </tr>
            <tr>
              <td colspan="2" >
                <input class="butt" type="reset" value="확인" />
              </td>
            </tr>
          </table>
        </form>
      </section>
    </div>
  </body>
</html>

<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String id=(String)session.getAttribute("id");

if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>

<h3>board/boardWrite.jsp</h3>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>board/boardWrite.jsp</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 사용하기 위해 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>게시판 글쓰기</title>

</head>

<body>

<form action="boardWritePro.jsp" method="post" action="contentWriteProcess.jsp">

<div class="container">

  <h2>게시판 글쓰기</h2>          

  <table class="table table-hover">

    <tbody>

      <tr>

      	<td><input type="text" class="form-control" placeholder="유저번호" name="id" value=<%=id %> maxlength="40"></td>

      </tr>

      <tr>

      	<td><input type="text" class="form-control" placeholder="글 제목" name="contentTitle" maxlength="40"></td>

      </tr>

      <tr>

      	<td><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="contentDetail" maxlength="1024" style="height: 400px;"></textarea></td>

      </tr>

    </tbody>

  </table>

  <input type="submit" class="btn btn-primary pull-right" value="글쓰기">

</div>


<!-- <form action="boardWritePro.jsp" method="post"> -->

<!-- <table border="1"> -->
<!-- <tr><td align="center">유저번호</td> -->
<%--     <td><input type="text" name="name" value=<%=id %> readonly></td></tr> --%>
<!-- <tr><td align="center">공지사항 제목</td> -->
<!--     <td><input type="text" name="btitle" ></td></tr>    -->
<!-- <tr><td align="center">공지사항 내용</td> -->
<!--     <td><textarea name="bcontent" rows="10" cols="20"></textarea></td></tr> -->
<!-- <tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>     -->
<!-- </table> -->

</form>
</body>
</html>
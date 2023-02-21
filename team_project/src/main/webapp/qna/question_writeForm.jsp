<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>qna/q_writeForm.jsp</title>
</head>
<body>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<%
// id값 받아오기
String id=(String)session.getAttribute("id");

UserDAO rdao=new UserDAO();
UserDTO rdto=rdao.getUser(id);
int no = rdto.getNo();

//로그인 되어있지 않으면 로그인화면으로
if(id==null){
	response.sendRedirect("MemberLogin.me");
}
%>

<!-- 부트스트랩 사용하기 위해 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 게시판 글쓰기 부분 -->
<form action="QuestionWritePro.qa" method="post"> 
<div class="container">
<h2>질문 남기기</h2>

<input type="hidden" name="no" value="<%=no%>">
 <table class="table table-hover">
	 <tbody>
<!-- 	<table border="1"> -->
		<tr><td><input type="text" name="name" class="form-control" maxlength="40" value="<%=id %>" readonly></td></tr>
		<tr><td><input type="text" name="qtitle" class="form-control" maxlength="40" placeholder="글 제목"></td></tr>
		<tr><td><textarea name="qcontent" class="form-control" maxlength="1024" style="height: 400px;" placeholder="글 내용을 작성하세요"></textarea></td></tr>
		</tbody>
	</table>
	<input type="submit" value="글쓰기" class="btn btn-primary pull-right">
	</div>
	
	</form>
	<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
	

</body>
</html>
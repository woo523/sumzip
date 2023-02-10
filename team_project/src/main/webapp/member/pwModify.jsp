<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더들어가는 곳 -->

	<form action="modify_pass.do" name="pmod" method="post">
		<div id="pass_modify">
			<input type="hidden" name="id" value="<%=id %>">
			<h3>비밀번호 수정</h3>
			<span>비밀번호</span>: <input type="password" name="pass" id=m_pass"><br>
			<span>비밀번호 확인</span>: <input type="password" name="pass" id=m_pass"><br>
			<button type="button" class="btn" id="pass_modify_btn" onclick=modify();">변경</button>
		</div>
	</form>
	</div>
</body>
</html>
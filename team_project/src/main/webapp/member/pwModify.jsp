<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%

String id=(String)session.getAttribute("id");

UserDAO dao=new UserDAO();

UserDTO dto=dao.getUser(id);
 %> 
<article>
	<form action="pwModifyPro.jsp" name="passForm" method="post">
		<div id="pass_modify">
			<h3>비밀번호 수정</h3>
			<label>아이디</label>: <input type="text" name="id" class="id" value="<%=id%>" readonly><br>
			<label>새 비밀번호</label>: <input type="password" name="pass1" id="pass1" ><br>
			<div id="buttons">
			<input type="submit" value="변경" class="submit">
			<input type="reset" value="취소" class="cancel">
			</div>
		</div>
	</form>
</article>
	
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>	
</body>
</html>
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

		<h1>관리자 Login</h1>
		<form action="loginPro.jsp" id="join" method="post">
			<fieldset>
				
				<input type="text" name="id" placeholder="아이디를 입력하세요"><br> 
				<input type="password" name="pass" placeholder="비밀번호를 입력하세요"><br>
				<input type="submit" value="로그인" class="submit"><br>

				</fieldset>
			</form>
			<nav id="sub_menu">
			<a href="findId.jsp">ID찾기</a><span class="p-2"> | </span> <a href="#pfindPass">비밀번호찾기</a>
		</nav>
	</div>
</body>
</html>
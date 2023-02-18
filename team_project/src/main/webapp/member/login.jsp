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
		<jsp:include page="../inc/header.jsp" />
		<!-- 헤더들어가는 곳 -->

		<h1>Login</h1>
		<form action="MemberLoginPro.me" id="join" method="post">
			<fieldset>
				
				<input type="text" name="id" placeholder="아이디를 입력하세요"><br> 
				<input type="password" name="pass" placeholder="비밀번호를 입력하세요"><br>
				<input type="submit" value="로그인" class="submit"><br>
				<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 				<a href="javascript:void(0)"> <img -->
<!-- 					src="/team_project/img/login/kakao_login_medium.png" -->
<!-- 					onclick="kakaoLogin();"> -->
				</a><br>
			</fieldset>

		</form>

		<nav id="sub_menu">
			<a href="join.jsp">회원가입</a><span class="p-2"> | </span> <a
				href="MemberFindId.me">ID찾기</a><span class="p-2"> | </span> <a href="MemberFindPass.me">비밀번호찾기</a>
		</nav>
		
		<jsp:include page="../inc/footer.jsp" />
	</div>
</body>
</html>
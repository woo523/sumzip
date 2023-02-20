<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-color: #f5f5f5;
		font-family: sans-serif;
	}

	#wrap {
		margin: 60px auto;
		width: 90%;
		max-width: 600px;
		padding: 20px;
		background-color: #fff;
	}

	h1 {
		font-size: 24px;
		margin-bottom: 20px;
		text-align: center;
	}

	form {
		background-color: white;
		padding: 20px;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	}

	label {
		display: block;
		margin-bottom: 5px;
	}

	input[type="text"],
	input[type="password"] {
		display: block;
		width: 100%;
		padding: 10px;
		margin-bottom: 20px;
		border: none;
		border-radius: 3px;
		background-color: #fff;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	}

	input[type="submit"] {
		display: block;
		width: 100%;
		padding: 10px;
		margin-top: 20px;
		background-color: #119208;
		color: #fff;
		font-weight: bold;
		border: none;
		border-radius: 3px;
		cursor: pointer;
	}

	#sub_menu {
		margin-top: 20px;
		text-align: center;
	}

	#sub_menu a {
		color: #C5E1A5;
		text-decoration: none;
	}

	#sub_menu span {
		color: #777;
	}
</style>
</head>
<body>
	
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->

<div id="wrap">
		<h1>Login</h1>
		<form action="MemberLoginPro.me" id="join" method="post">
			<fieldset>
				
				<input type="text" name="id" placeholder="아이디를 입력하세요"><br> 
				<input type="password" name="pass" placeholder="비밀번호를 입력하세요"><br>
				<input type="submit" value="로그인" class="submit"><br>
				

				<br>
			</fieldset>

		</form>

		<nav id="sub_menu">
			<a href="MemberAgree.me">회원가입</a><span class="p-2"> | </span> 
			<a href="MemberFindId.me">ID찾기</a><span class="p-2"> | </span> 
			<a href="MemberFindPass.me">비밀번호찾기</a>
		</nav>
		
		
	</div>
	
<jsp:include page="../inc/footer.jsp" />
</body>
</html>
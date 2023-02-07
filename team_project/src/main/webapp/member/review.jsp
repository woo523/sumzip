<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review.jsp</title>
<script type="text/javascript">
	const drawStar = (target) => {
		document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
	}
	
	const drawStar = (target) => {
		$(`.star span`).css({width:`${target.value * 10}%` });
	}
</script>
</head>

<body>
<!-- 리뷰 작성 페이지 -->
<%
// 	String id = (String)session.getAttribute("id");
	// 아이디 없으면 로그인 페이지로 이동
// 	if(id == null) {
		%>
<!-- 		<script type="text/javascript"> -->
<!--  			alert("로그인을 해주세요"); -->
<!-- 		</script> -->
		<%
// 		response.sendRedirect("login.jsp");
// 	}
%>
<div class="container">
	<!-- 헤더 들어가는 곳 -->
	
	<article>
	<!-- 펜션 정보 가져오는 곳..?-->
		
	<form action="reviewPro.jsp" method ="post">
		
		<div>
			글제목 : <input type="text" name="subject">
		</div>
		
		
		<!-- 	별점(동적) -->
		<div id="Stars">
			<h3>???만족하셨나요?</h3>
			<span class="star">
			⭐⭐⭐⭐⭐
			<span>*****</span>
<!-- 		<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10"> -->
			</span>
		</div>
		
		<!-- 	후기를 남겨주세요 -->
		<div id="Review">
			<h3>후기를 남겨주세요.</h3>
			<textarea name="content" rows="10" cols="30"></textarea>
		</div>
		
		<div id="Buttons">
			<input type="reset" value="취소" class="cancel">
			<input type="submit" value="작성하기" class="submit">
		</div>
		
	</form>
	</article>
	
</div>
<style>
	body {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		margin: 0px;
		padding: 0px;

	}
	
	#container {
		margin : 0px auto;
		width: 700px;
		height: 1024px;
	}
</style>
</body>
</html>
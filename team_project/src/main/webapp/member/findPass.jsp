<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function pass_search() { 
	 	var frm = document.passfindscreen;

	 	if (frm.id.value.length < 1) {
		  alert("아이디를 입력해주세요");
		  return;
		 }

	 frm.method = "post";
	 frm.action = "MemberFindPassPro.me"; //넘어간화면
	 frm.submit();  
	 }
</script>
</head>
<body>
<h3>비밀번호 찾기</h3>
<p>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
<form action="MemberFindPassPro.me" name="passfindscreen" method = "POST">
	<input type="text" name="id" id="id">
	<br><br>
	<input type="button" name="enter" value="다음"  onClick="pass_search()">
<!-- 	<button>다음</button> -->
</form>
</body>
</html>
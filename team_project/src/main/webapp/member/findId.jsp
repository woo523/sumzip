<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function id_search() { 
	 	var frm = document.idfindscreen;

	 	if (frm.uname.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.email.value.length < 1) {
			  alert("이메일을 입력해주세요");
			  return;
		 }

	 frm.method = "post";
	 frm.action = "MemberFindIdPro.me"; //넘어간화면
	 frm.submit();  
	 }
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<form name="idfindscreen" method = "POST">
			<div class = "search-title">
				<h3>아이디찾기</h3>
			</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="uname" class = "btn-name" placeholder = "등록한 이름">
			<br>
			</div>
			<div class = "find-email">
				<label>이메일</label>
				<input type="text" name="email" class = "btn-email" placeholder = "등록한 이메일">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="id_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
 
 <jsp:include page="../inc/footer.jsp" />
</div>
</body>
</html>
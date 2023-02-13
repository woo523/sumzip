<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
 <script type="text/javascript">
 	// jQurery 준비 => 대상.함수()
 	$(document).ready(function(){
//  		alert("준비");
		//submit 버튼을 클릭했을때 이벤트 onsubmit()
		// id="join" 폼태그 표시 => 전송
		$('#pass_modify').submit(function(){
			if($('.pass').val()==""){
				alert("비밀번호 입력하세요");
				$('.pass').focus();
				return false;
			}
			if($('.pass2').val()==""){
				alert("비밀번호 재확인 입력하세요");
				$('.pass2').focus();
				return false;
			}
			
			if($('.pass').val()!=$('pass2').val()){
				alert("비밀번호 틀림");
				$('.pass2').focus();
				return false;
			}
		}
	});
	});

</script>
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
	<form action="pwModifyPro.jsp" name="passForm" id="pass_modify" method="post">
		<div id="pass_modify">
			<h3>비밀번호 변경</h3>
			<label>아이디</label>: <input type="text" name="id" class="id" value="<%=id%>" readonly><br>
			<label>새 비밀번호</label>: <input type="password" name="pass" class="pass" ><br>
			<label>비밀번호 재확인</label>: <input type="password" name="pass2" class="pass2"><br>
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
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	passForm.pass1.focus();
}
	
	if(form.pass1.value==""){
		alert("새로운 비밀번호를 입력해 주세요");
		form.pass1.focus();
		return;
	}
	
	if(form.pass2.value==""){
		alert("비밀번호 확인을 입력해 주세요");
		form.pass2.focus();
		return;
	}
	
	if(form.pass1.value!==form.pass2.value){
		alert("새로운 비밀번호가 일치하지 않습니다");
		form.pass1.value=="";
		form.pass2.value==""
		form.pass1.focus();
		return;
	}
	
	form.submit();
}

</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더들어가는 곳 -->
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// MemberDAO 객체생성
UserDAO dao=new UserDAO();
// 리턴할형 MemberDTO dto =  getMember(id) 메서드 호출
UserDTO dto=dao.getUser(id);
 %> 

	<form action="pwModifyPro.jsp" name="passForm" method="post">
		<div id="pass_modify">
			<h3>비밀번호 수정</h3>
			<label>아이디</label>: <input type="text" name="id" class="id" value="<%=id%>" readonly><br>
			<label>새 비밀번호</label>: <input type="password" name="pass1" id="m_pass" ><br>
			<label>비밀번호 확인</label>: <input type="password" name="pass2" id="m_pass" ><br>
			<input type="submit" value="변경" class="submit">
		</div>
	</form>
	</div>
</body>
</html>
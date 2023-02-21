<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 결과</title>
<style type="text/css">
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
	
	form {
		background-color: white;
		margin: 20px auto;
		max-width: 600px;
		padding: 20px;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	}
	
</style>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />


<%
request.setCharacterEncoding("UTF-8");
String uname = request.getParameter("uname");
String email = request.getParameter("email");
     
UserDAO dao = new UserDAO();
UserDTO dto = dao.findId(uname, email);  
%>

	<div id="wrap">
		<h2>아이디 찾기 결과</h2>
		<form name="idsearch" method="post">
      		<%
       			if (dto != null) {
      		%>
      			<div class="found-success">
	      			<h3>회원님의 아이디는<br> 
	      			<%=dto.getId()%>입니다.</h3>
	      			<div class="login-btn">
	 		    		<a href="MemberLogin.me"><input type="button" id="btnLogin" value="로그인"></a>
	       			</div>
	      		</div>
	      		<%
		  		} else {
		 		%>
		        <div class="found-fail">
		      		<h3>등록된 정보가 없습니다.</h3>
		    	</div>
		    	<div class="login-btn">
		     		<input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
		     		<a href="MemberAgree.me"><input type="button" id="btnjoin" value="회원가입"></a>
		    	</div> 
		    	<%
		  		}
		 		%> 
	 		</form>
	</div>

<jsp:include page="../inc/footer.jsp" />
</body>
</html>
      
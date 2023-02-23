<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬집 관리자 페이지</title>
</head>
<body>
<%
//id값 받아오기
String id=(String)session.getAttribute("id");
int qno=Integer.parseInt(request.getParameter("qno"));
UserDAO rdao=new UserDAO();
UserDTO rdto=rdao.getUser(id);
int no = rdto.getNo();

if(id==null){
	response.sendRedirect("AdminLogin.ad");
}else if(id.equals("admin")){

}else{
	%>
<script type="text/javascript">
alert("접근 권한이 없습니다.");
history.back();
</script>
<%
}
%>
<jsp:include page="../inc/ad_header.jsp" />
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<h1>AnswerWrite</h1>
					<form action="AdminAnswerWritePro.ad" method="post"> 
						<input type="hidden" name="no" value="<%=no%>">
						<input type="hidden" name="qno" value="<%=qno%>">
							<table border="1">
								<tr><td>작성자</td>
								<td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
								<tr><td>내용</td>
								<td><textarea name="answer" rows="10" cols="20"></textarea></td></tr>
								<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
							</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
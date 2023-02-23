<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬집 관리자 페이지</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="content-main adminichi">		
<%
String id=(String)session.getAttribute("id");
QnaDTO qdto = (QnaDTO)request.getAttribute("qdto");
UserDTO udto = (UserDTO)request.getAttribute("udto");
int qno=(Integer)request.getAttribute("qno");

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
	
					<h1 class="taitoru">Answer List</h1>
					
					<table border="1">
						<tr><td>글번호</td><td><%=qdto.getQno() %></td></tr>
						<tr><td>글쓴날짜</td><td><%=qdto.getQadate() %></td></tr> 
						<tr><td>글내용</td><td><%=qdto.getAnswer() %></td></tr>
					</table>
					
					
					<input type="button" value="글수정" 
					onclick="location.href='AdminAnswerUpdateForm.ad?qno=<%=qdto.getQno() %>'">
					<input type="button" value="글삭제" 
					onclick="location.href='AdminAnswerDelete.ad?qno=<%=qdto.getQno() %>'">
					<input type="button" value="글목록" 
					onclick="location.href='AdminQnaList.ad'"> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>
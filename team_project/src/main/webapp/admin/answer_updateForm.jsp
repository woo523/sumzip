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
<%
int qno=Integer.parseInt(request.getParameter("qno"));

QnaDAO dao=new QnaDAO();
QnaDTO dto = dao.getQna(qno); 

String id=(String)session.getAttribute("id");

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
				<h1>AnswerUpdate</h1>
				<form action="AdminAnswerUpdatePro.ad" method="post"> 
						<input type="hidden" name="qno" value="<%=qno %>">
					<table border="1">
							<tr><td colspan="2"><input type="checkbox" name="qstate" value="0" checked>답변완료</td></tr>
							<tr><td>작성자번호</td>
							<td><input type="text" name="no" value="<%=dto.getNo() %>" readonly></td></tr>
							<tr><td>내용</td>
							<td><textarea name="answer" rows="10" cols="20"><%=dto.getAnswer() %></textarea></td></tr>
							<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
					</table>
				</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
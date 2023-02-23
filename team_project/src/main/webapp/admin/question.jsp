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
				
				QnaDTO qdto = (QnaDTO)request.getAttribute("qdto");
				UserDTO udto = (UserDTO)request.getAttribute("udto");
				int qno=(Integer)request.getAttribute("qno");
				%>
				<h1>Question</h1>
					<table border="1">
						<tr><td>글번호</td><td><%=qdto.getQno() %></td></tr>
						<tr><td>작성자</td><td><%=udto.getId() %></td></tr>
						<tr><td>글쓴날짜</td><td><%=qdto.getQdate() %></td></tr> 
						<tr><td>조회수</td><td><%=qdto.getQcount() %></td></tr>
						<tr><td>글제목</td><td><%=qdto.getQtitle() %></td></tr>
						<tr><td>글내용</td><td><%=qdto.getQcontent() %></td></tr>
						<tr><td colspan="2">
						
						<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary"
						onclick="location.href='AdminQnaList.ad'">글목록</button>
						
						<!-- 답변이 있을때만 답변확인버튼 보이게 -->
						
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='AdminQnaAnswer.ad?qno=<%=qdto.getQno() %>'">답변확인</button>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='AdminAnswerWriteForm.ad?qno=<%=qdto.getQno() %>'">답변쓰기</button>
						</div>
						</td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
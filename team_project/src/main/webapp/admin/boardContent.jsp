<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬집 관리자 페이지</title>
</head>
<body>
<!-- 헤더 들어가는 곳 -->
 	<jsp:include page="../inc/ad_header.jsp" />
 <!-- Backgrounds -->
	<div class="container">
    	<div class="row">	
			<div class="col-lg-12">
				<div class="content-main adminichi">			
					<%
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
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
					BoardDTO dto=(BoardDTO)request.getAttribute("dto");
					%>
					<!-- 공지사항 내용 -->
					<h1 class="taitoru">Board Detail</h1>
					<table border="1">
					<tr><td>공지사항 번호</td><td><%=dto.getBno() %></td></tr>
					<tr><td>유저번호</td><td><%=dto.getNo() %></td></tr>
					<tr><td>제목</td><td><%=dto.getBtitle() %></td></tr>
					<tr><td>내용</td><td><%=dto.getBcontent() %></td></tr>
					<tr><td>조회수</td><td><%=dto.getBcount() %></td></tr>
					<tr><td>작성날짜</td><td><%=dateFormat.format(dto.getBdate()) %></td></tr>
					<tr><td colspan="2">
					
					<input type="button" value="글목록"
					onclick="location.href='AdminBoardList.ad'">
					
					<% 
					// 로그인 => 세션값 있음
					if(id != null){
						// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
						if(id.equals("admin")){
							%>
					<input type="button" value="글수정"
					 onclick="location.href='AdminBoardUpdateForm.ad?bno=<%=dto.getBno()%>'">
					<input type="button" value="글삭제"
					onclick="location.href='AdminBoardDeletePro.ad?bno=<%=dto.getBno()%>'">
					<%
						}
					}
					%>
					</td></tr>
					</table>
			
				<!-- 댓글 영역 들어가는 곳 -->
				<jsp:include page="../board/replyForm.jsp" />
				</div>
			</div>
		</div>
	</div>
 
<!--  푸터 들어가는 곳 -->
<%--  <jsp:include page="../inc/footer.jsp" /> --%>
 
</body>
</html>
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
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
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
					<div class="iro">
						<div class="row">
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-6 col-form-label">공지사항 번호</label>
						    <input type="text" class="form-control" placeholder="<%=dto.getBno() %>" aria-label="First name">
						  </div>
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">조회수</label>
						    <input type="text" class="form-control" placeholder="<%=dto.getBcount() %>" aria-label="Last name">
						  </div>
						</div>
						<div class="row" style="margin-top: 5px; margin-bottom: 20px;">
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-2 col-form-label">작성자</label>
						    <input type="text" class="form-control" placeholder="관리자" aria-label="First name">
						  </div>
						  <div class="col">
						  	<label for="colFormLabel" class="col-sm-3 col-form-label">작성날짜</label>
						    <input type="text" class="form-control" placeholder="<%=dateFormat.format(dto.getBdate()) %>" aria-label="Last name">
						  </div>
						</div>
					
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=dto.getBtitle() %>">
							</div>
						</div>
						<div class="row mb-3">
							<label for="colFormLabel" class="col-sm-2 col-form-label">글내용</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="colFormLabel" placeholder="<%=dto.getBcontent() %>">
							</div>
						</div>
					</div>
					<div class="peigingu">
					
						<input type="button" value="글목록"onclick="location.href='AdminBoardList.ad'">
						
						<% 
						// 로그인 => 세션값 있음
						if(id != null){
							// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
							if(id.equals("admin")){
								%>
						<input type="button" value="글수정" onclick="location.href='AdminBoardUpdateForm.ad?bno=<%=dto.getBno()%>'">
						<input type="button" value="글삭제" onclick="location.href='AdminBoardDeletePro.ad?bno=<%=dto.getBno()%>'">
						<%
							}
						}
						%>
					</div>
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
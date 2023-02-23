<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />

<!-- 한페이지에 보여줄 글 개수 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<%
					SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
					
					ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList");
					int currentPage =(Integer)request.getAttribute("currentPage");
					int pageBlock =(Integer)request.getAttribute("pageBlock");
					int startPage =(Integer)request.getAttribute("startPage");
					int endPage =(Integer)request.getAttribute("endPage");
					int pageCount =(Integer)request.getAttribute("pageCount");
					
					String search=(String)request.getAttribute("search");
					%>
					
					<!-- 글쓰기 버튼 부분 -->
					<h1>BoardList</h1>
					
					<div id="table_search">
						<table border="0" width="50%">
							<tbody>
								<tr align="right">
								<td>
									<button type="button" onclick="location.href='AdminBoardWriteForm.ad'">글쓰기</button>
								</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 공지사항 리스트 부분 -->
					<table border="1" width="50%">
						<tbody>
							<tr>
							<td width="5%" align="center">번호</td><td width="5%" align="center">유저번호</td>
							<td width="15%" align="center">제목</td><td width="20%" align="center">작성날짜</td>
							<td width="5%" align="center">조회수</td>
							</tr>
							
							<tr><td colspan="5" align="center"></td></tr>
							
							<%
							for(int i=0; i<boardList.size(); i++){
								BoardDTO dto= boardList.get(i);
							%>
							<tr><td align="center"><%=dto.getBno() %></td>
							<td align="center"><%=dto.getNo() %></td>
							    <td align="center">
							    <a href="AdminBoardContent.ad?bno=<%=dto.getBno() %>">
							    <%=dto.getBtitle() %>
							    </a></td>
							<td align="center"><%=dto.getBdate() %></td>
							<td align="center"><%=dto.getBcount() %></td></tr>
							
							<% 
							}
							%>
						</tbody>
					</table>
					
					<!-- 게시판 글 검색부분 -->
					<div id="table_search">
						<form action="AdminBoardList.ad"  method="post">
							<table border="1" width="50%"> 
								<tr><td align="center">
								<input type="text" name="search">
								<input type="submit" value="검색">
								</td></tr>
							</table>
						</form>
					</div>
					
					
					<!-- 페이징 처리 -->
					<% 
					
					if(search==null){
						
					if(startPage > pageBlock){
						%>
					<a href="AdminBoardList.ad?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
						<%
					}
					
					for(int i=startPage;i<=endPage;i++){
						%>
						<a href="AdminBoardList.ad?pageNum=<%=i%>"><%=i %></a> 
						<%
					}
					
					if(endPage < pageCount){
						%>
					<a href="AdminBoardList.ad?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
						<%
					}
					
					
					}else{
						if(startPage > pageBlock){
							%>
						<a href="AdminBoardList.ad?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">[10페이지 이전]</a>
							<%
						}
					
						for(int i=startPage;i<=endPage;i++){
							%>
							<a href="AdminBoardList.ad?pageNum=<%=i%>&search=<%=search%>"><%=i %></a> 
							<%
						}
					
						if(endPage < pageCount){
							%>
						<a href="AdminBoardList.ad?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">[10페이지 다음]</a>
							<%
						}
					}
					
					%>
				</div>
			</div>
		</div>
	</div>
<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>

</body>
</html>
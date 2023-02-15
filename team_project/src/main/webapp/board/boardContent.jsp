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
<title>board/boardContent.jsp</title>

</head>
<body>
<%
BoardDTO bdto = (BoardDTO)request.getAttribute("bdto");

String id=(String)session.getAttribute("id");
%>
<!-- 헤더 들어가는 곳 -->
 	<jsp:include page="../inc/header.jsp" />

<!-- 공지사항 내용 -->
<h2>글내용 [로그인 : <%=id %>]</h2>
<table border="1">
<tr><td>공지사항 번호</td><td><%=bdto.getBno() %></td></tr>
<tr><td>유저번호</td><td><%=bdto.getNo() %></td></tr>
<tr><td>제목</td><td><%=bdto.getBtitle() %></td></tr>
<tr><td>내용</td><td><%=bdto.getBcontent() %></td></tr>
<tr><td>조회수</td><td><%=bdto.getBcount() %></td></tr>
<tr><td>작성날짜</td><td><%=bdto.getBdate() %></td></tr>
<tr><td colspan="2">
<%
// 로그인 => 세션값 있음
if(id != null){
	// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
	if(id.equals(bdto.getNo())){
		%>
<input type="button" value="글수정"
 onclick="location.href='updateForm.jsp?bno=<%=bdto.getBno()%>'">
 <input type="button" value="글삭제"
 onclick="location.href='deletePro.jsp?bno=<%=bdto.getBno()%>'">		
		<%
	}
}
%>


<input type="button" value="글목록"
 onclick="location.href='boardList.jsp'">
 <input type="button" value="글수정"
 onclick="location.href='boardupdateForm.jsp'">
 <input type="button" value="글삭제"
 onclick="location.href='board_deletePro.jsp'">
 
 </td></tr>
 </table>
 
<!-- 댓글 영역 들어가는 곳 -->
 <jsp:include page="replyForm.jsp" />
 
<!--  푸터 들어가는 곳 -->
<%--  <jsp:include page="../inc/footer.jsp" /> --%>
 
</body>
</html>
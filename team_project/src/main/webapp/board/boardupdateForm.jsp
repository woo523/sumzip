<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardupdateForm.jsp</title>
</head>
<body>
<%
int bno=Integer.parseInt(request.getParameter("bno"));

BoardDAO dao=new BoardDAO();

BoardDTO dto=dao.getBoard(bno);
%>
<h2>글수정</h2>
<form action="updatePro.jsp" method="post">
<input type="hidden" name="bno" value="<%=dto.getBno()%>">
<table border="1">
<tr><td>글쓴이</td>
    <td><input type="text" name="no" value="<%=dto.getNo() %>" readonly></td></tr>
<tr><td>글제목</td>
    <td><input type="text" name="btitle" value="<%=dto.getBtitle() %>"></td></tr>   
<tr><td>글내용</td>
    <td><textarea name="bcontent" rows="10" cols="20"><%=dto.getBcontent() %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>    
</table>
</form>
</body>
</html>
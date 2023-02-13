<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/a_update_Form.jsp</title>
</head>
<body>
<%
int no=Integer.parseInt(request.getParameter("no"));

QnaDAO dao=new QnaDAO();

QnaDTO dto = dao.getQna(no); 
%>
<h1>글수정</h1>
<form action="a_update_Pro.jsp" method="post"> 
<input type="hidden" name="no" value="<%=dto.getNo() %>">
<table border="1">
	<tr><td>작성자번호</td>
	<td><input type="text" name="no" value="<%=dto.getNo() %>" readonly></td></tr>
	<tr><td>제목</td>
	<td><input type="text" name="subject" value=<%=dto.getQtitle() %>></td></tr>
	<tr><td>내용</td>
	<td><textarea name="content" rows="10" cols="20"><%=dto.getQcontent() %></textarea></td></tr>
	<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</body>
</html>
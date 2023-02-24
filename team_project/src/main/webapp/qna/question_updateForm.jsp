<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬집</title>
 <!-- Google Font -->
 <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="img/faviconF.png">
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<%
// int qno=Integer.parseInt(request.getParameter("qno"));

// QnaDAO dao=new QnaDAO();

// QnaDTO dto = dao.getQna(qno); 

QnaDTO dto = (QnaDTO)request.getAttribute("dto");

%>

<h4>Question 수정</h4>
<form action="QuestionUpdatePro.qa" method="post"> 
		<input type="hidden" name="qno" value="<%=dto.getQno() %>">
	<table border="1">
			<tr><td>작성자번호</td>
			<td><input type="text" name="no" value="<%=dto.getNo() %>" readonly></td></tr>
			<tr><td>제목</td>
			<td><input type="text" name="qtitle" value=<%=dto.getQtitle() %>></td></tr>
			<tr><td>내용</td>
			<td><textarea name="qcontent" rows="10" cols="20"><%=dto.getQcontent() %></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
	</table>
</form>
</body>
</html>
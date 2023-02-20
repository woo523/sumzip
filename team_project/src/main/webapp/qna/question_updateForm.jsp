<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/question_updateForm.jsp</title>
 <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<%
// int qno=Integer.parseInt(request.getParameter("qno"));

// QnaDAO dao=new QnaDAO();

// QnaDTO dto = dao.getQna(qno); 

QnaDTO dto = (QnaDTO)request.getAttribute("dto");

%>

<h1>글수정</h1>
<form action="QuestionUpdatePro.qa" method="post"> 
	<table border="1">
		<input type="hidden" name="qno" value="<%=dto.getQno() %>">
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
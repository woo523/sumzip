<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
<h1>글쓰기</h1>
<form action="questionModify.jsp" method="post"> 
<table border="1">
<tr><td>유저번호</td>
	<td><input type="text" name="no" value="<%=id %>" readonly></td></tr>
<tr><td>글제목</td>
	<td><input type="text" name="qtitle"></td></tr>
<tr><td>글내용</td>
	<td><textarea name="qcontent" rows="10" cols="20"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/fwriteForm.jsp</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("MemberLogin.me");
}
%>
<h1>파일첨부 글쓰기</h1>

<!-- 첨부파일 있으면 꼭 넣기 enctype="multipart/form-data" -->
<form action="FileProductWritePro.bo" method="post" enctype="multipart/form-data">
<table border="1">
<tr><td>첨부파일</td>
    <td><input type="file" name="file" ></td></tr>      
<tr><td>펜션이름</td>
    <td><input type="text" name="pname" ></td></tr>
<tr><td>펜션가격</td>
    <td><input type="text" name="pprice" ></td></tr>
<tr><td>펜션설명</td>
    <td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="file상품등록"></td></tr>    
</table>
</form>
</body>
</html>



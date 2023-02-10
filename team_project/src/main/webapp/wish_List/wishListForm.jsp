<%@page import="member.WishListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜목록 보기</title>


</div>
</head>
<body>
<% MemberDTO dto= new MemberDTO()%>
<div id="wishlist">
<table border=1>
<tr>
<th><%=dto.getNo() %></th><th><%=dto.getPno()%></th>
</tr>
</table>
</body>
</html>
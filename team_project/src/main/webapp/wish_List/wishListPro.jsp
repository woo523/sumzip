<%@page import="member.WishListDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.WishListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 장바구니 추가하면 한 행 추가하기-->

<%
WishListDAO WishListDAO = new WishListDAO();
ArrayList<Jjim> list = WishListDAO.getJjim(userID, bbsID);
int result = 0;
if (list.isEmpty()){
	result = WishListDAO.write(userID, bbsID);
}
else{
	result = WishListDAO.delete(userID, bbsID);
}
%>


</body>
</html>
<%@page import="member.WishListDAO"%>
<%@page import="member.WishListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
WishListDAO dao= new WishListDAO();
String id=(String)session.getAttribute("id");
if (id!=null){
	
}
else{
	
}
%>


<!-- 넘어온 값이 on이면 insertWish, off면 deletewish -->

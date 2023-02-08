<%@page import="member.UserDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");

MemberDAO dao=new MemberDAO();

UserDTO dto = dao.getMember(id);

String result="";

if(dto!=null){
	result="이미 사용중인 아이디입니다.";
}else{
	result="사용가능한 아이디입니다.";
}
%>
<%= result%>
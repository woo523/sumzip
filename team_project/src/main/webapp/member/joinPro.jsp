<%@page import="member.MemberDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
Timestamp date=new Timestamp(System.currentTimeMillis());
String email=request.getParameter("email");
String address=request.getParameter("address");
String mobile=request.getParameter("mobile");

UserDTO dto = new UserDTO();
 
dto.setId(id);
dto.setPass(pass);
dto.setUname(name);
dto.setBirth(date);
dto.setEmail(email);
dto.setAddress1(address);
dto.setAddress2(address);
dto.setTel(mobile);

MemberDAO dao = new MemberDAO();
dao.insertMember(dto);

response.sendRedirect("login.jsp"); 
%>
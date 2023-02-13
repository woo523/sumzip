<%@page import="member.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 후기 삭제 페이지
	// reviewDelete.jsp
	int rno = Integer.parseInt(request.getParameter("rno"));
	
	ReviewDAO rdao = new ReviewDAO();
	
	// rdao.deleteReview(rno);
	
	response.sendRedirect("myList.jsp");
%>
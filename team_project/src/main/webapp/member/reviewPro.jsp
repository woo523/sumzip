<%@page import="member.ReviewDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String rtitle = request.getParameter("subject");
	String rstar = request.getParameter("star");
	String rcontent = request.getParameter("content");
	int readcount = 0;
	Timestamp rdate = new Timestamp(System.currentTimeMillis());
	
	ReviewDTO dto = new ReviewDTO();
// 	dto.set
	

%>
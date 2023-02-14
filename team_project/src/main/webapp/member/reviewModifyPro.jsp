<%@page import="member.ReviewDAO"%>
<%@page import="member.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// reviewModifyPro.jsp
	
	request.setCharacterEncoding("UTF-8");
	
	int ano = Integer.parseInt(request.getParameter("ano"));
	
	int rno = Integer.parseInt(request.getParameter("rno"));
	String rtitle = request.getParameter("title");
	String rstar = request.getParameter("rstar"); 
	String rcontent = request.getParameter("content");
	
	ReviewDTO rdto = new ReviewDTO();
	rdto.setRno(rno);
	rdto.setRtitle(rtitle);
	rdto.setRstar(rstar); 
	rdto.setRcontent(rcontent);
	
	ReviewDAO rdao = new ReviewDAO();
	rdao.updateReview(rdto);
	
	response.sendRedirect("myList.jsp");
	
%>
<%@page import="member.ReviewDAO"%>
<%@page import="member.ReviewDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String rtitle = request.getParameter("subject");
	String rstar = request.getParameter("star");
	String rcontent = request.getParameter("content");
	int rcount = 0;
	Timestamp rdate = new Timestamp(System.currentTimeMillis());
	
	ReviewDTO dto = new ReviewDTO();
 	dto.setRtitle(rtitle);
 	dto.setRstar(rstar);
 	dto.setRcontent(rcontent);
 	dto.setRcount(rcount);
 	dto.setRdate(rdate);
 	
 	// 리턴X insertReview()
 	ReviewDAO dao = new ReviewDAO();
 	dao.insertReview(dto);
 	
 	response.sendRedirect("myList.jsp");
	

%>
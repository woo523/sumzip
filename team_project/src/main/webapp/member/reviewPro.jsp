<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.ReviewDAO"%>
<%@page import="member.ReviewDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

// 	int no = 1;
	int pno = 1;
	
	String id = request.getParameter("id");
// 	int no = Integer.parseInt(request.getParameter("no"));
// 	int pno = Integer.parseInt(request.getParameter("pno")); 
	String rtitle = request.getParameter("title");
// 	String rstar = request.getParameter("star");
	String rcontent = request.getParameter("content");
	int rcount = 0;
	Timestamp rdate = new Timestamp(System.currentTimeMillis());
	
	UserDAO udao = new UserDAO();
	UserDTO udto = udao.getUser(id);
	
	ReviewDTO dto = new ReviewDTO();
	dto.setNo(udto.getNo());
	dto.setPno(pno);
 	dto.setRtitle(rtitle);
//  	dto.setRstar(rstar);
 	dto.setRcontent(rcontent);
 	dto.setRcount(rcount);
 	dto.setRdate(rdate);
 
 	// 리턴X insertReview()
 	ReviewDAO dao = new ReviewDAO();
 	dao.insertReview(dto);
 	
 	response.sendRedirect("myList.jsp");
	

%>
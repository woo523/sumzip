<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.ReviewDAO"%>
<%@page import="member.ReviewDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	// 임시 데이터
	int pno = 1;
	
	String id = (String)session.getAttribute("id");
	
	int rno = Integer.parseInt(request.getParameter("rno"));
	String rtitle = request.getParameter("title");
	String rstar = request.getParameter("rating");
	String rcontent = request.getParameter("content");
	int rcount = 0;
	Timestamp rdate = new Timestamp(System.currentTimeMillis());
	
	// 로그인 후 id, no 값 가져오기
	UserDAO udao = new UserDAO();
	UserDTO udto = udao.getUser(id);
	int no = udto.getNo();
	
	// dto 저장
	ReviewDTO dto = new ReviewDTO();
	dto.setRno(rno);
	dto.setNo(no);
	dto.setPno(pno);
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
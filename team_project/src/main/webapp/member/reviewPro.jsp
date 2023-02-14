<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="products.AppointmentDAO"%>
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
	int pno = 100;
	
	String id = (String)session.getAttribute("id");
	
	String uploadPath = request.getRealPath("/upload");
	System.out.println(uploadPath);
	int maxSize = 10*1024*1024;
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	int ano = Integer.parseInt(multi.getParameter("ano"));
	
	String rtitle = multi.getParameter("title");
	String rstar = multi.getParameter("rating"); 
	String rcontent = multi.getParameter("content");
	int rcount = 0;
	Timestamp rdate = new Timestamp(System.currentTimeMillis());
	String rpic1 = multi.getFilesystemName("rpic1");
	
	// 로그인 후 id, no 값 가져오기
	UserDAO udao = new UserDAO();
	UserDTO udto = udao.getUser(id);
	int no = udto.getNo();
	
	// dto 저장
	ReviewDTO dto = new ReviewDTO();
	dto.setNo(no);
	dto.setPno(pno);
	dto.setAno(ano);
 	dto.setRtitle(rtitle);
 	dto.setRstar(rstar);
 	dto.setRcontent(rcontent);
 	dto.setRcount(rcount);
 	dto.setRdate(rdate);
 	dto.setRpic1(rpic1);
 
 	// 리턴X insertReview()
 	ReviewDAO dao = new ReviewDAO();
 	dao.insertReview(dto);
 	
 	response.sendRedirect("myList.jsp");
	

%>
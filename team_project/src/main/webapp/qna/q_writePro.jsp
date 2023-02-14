<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");

String id=(String)session.getAttribute("id");
UserDAO udao=new UserDAO();
UserDTO udto=udao.getUser(id);


String qtype = "";
if(udto.getUtype()==1){
	 qtype = "회원";
}else{
	qtype = "운영자";
}

int qpw=0000;
String qtitle=request.getParameter("qtitle");
int qcount=0;
Timestamp qdate=new Timestamp(System.currentTimeMillis());
String qcontent=request.getParameter("qcontent");

QnaDTO dto=new QnaDTO();


dto.setNo(udto.getNo());
dto.setQtitle(qtitle);
dto.setQtype("1");
dto.setQstatus(0);
dto.setQcount(qcount);
dto.setQpw(qpw);
dto.setQdate(qdate);
dto.setQcontent(qcontent);


QnaDAO dao=new QnaDAO();
dao.insertQna(dto);

response.sendRedirect("qnaList.jsp");
%>


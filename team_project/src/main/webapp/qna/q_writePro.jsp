<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");

int qno=Integer.parseInt(request.getParameter("qno"));
int no=Integer.parseInt(request.getParameter("no"));
String qtilte=request.getParameter("qtitle");
String qtype=request.getParameter("qtype");
int qstatus=Integer.parseInt(request.getParameter("qstatus"));
int qcount=0;
Timestamp qdate=new Timestamp(System.currentTimeMillis());


QnaDTO dto=new QnaDTO();

dto.setNo(qno);
dto.setNo(no);
dto.setQtitle(qtilte);
dto.setQtype(qtype);
dto.setQstatus(qstatus);
dto.setQcount(qcount);
dto.setQdate(qdate);

QnaDAO dao=new QnaDAO();
dao.insertQna(dto);

response.sendRedirect("qnaList.jsp");
%>
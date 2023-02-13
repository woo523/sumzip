<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int no=Integer.parseInt(request.getParameter("no"));
String qtilte=request.getParameter("qtilte");
String content=request.getParameter("content");
int qcount=0;
Timestamp qdate=new Timestamp(System.currentTimeMillis());


QnaDTO dto=new QnaDTO();
// set메서드 호출해서 값 저장
dto.setNo(no);
dto.setQtitle(qtilte);
dto.setQcontent(content);
dto.setQcount(qcount);
dto.setQdate(qdate);

QnaDAO dao=new QnaDAO();
dao.insertQna(dto);

response.sendRedirect("qnaList.jsp");
%>
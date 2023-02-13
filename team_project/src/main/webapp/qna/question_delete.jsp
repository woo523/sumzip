<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request => num 피라미터 => 변수저장
int no=Integer.parseInt(request.getParameter("no"));

// BoardDAO 객체생성
QnaDAO dao=new QnaDAO();

dao.deleteQna(no);
// list.jsp 이동
response.sendRedirect("qnaList.jsp");
%>
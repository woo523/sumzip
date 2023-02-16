<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
int qno=Integer.parseInt(request.getParameter("qno"));
String id=(String)session.getAttribute("id");
UserDAO udao=new UserDAO();
UserDTO udto=udao.getUser(id);

//request qcount, qdate, answer, qstatus 가져와서 변수에 저장
int qcount=0;
Timestamp qadate=new Timestamp(System.currentTimeMillis());
String answer=request.getParameter("answer");
int qstatus=Integer.parseInt(request.getParameter("qstatus"));

//QnaDTO 객체생성 
QnaDTO dto=new QnaDTO();

//set메서드 호출해서 값 저장
dto.setQadate(qadate);
dto.setAnswer(answer);
dto.setQno(qno);
dto.setQstatus(qstatus);

//QnaDAO 객체생성
QnaDAO dao=new QnaDAO();
//updateQna(dto) 메서드 호출
dao.insertAnswer(dto);

//글목록 qnaList.jsp
response.sendRedirect("qnaList.jsp");
%>


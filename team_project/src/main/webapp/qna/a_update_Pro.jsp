<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int qno=Integer.parseInt(request.getParameter("qno"));
String qcontent=request.getParameter("qcontent");

// QnaDTO 객체생성
QnaDTO dto=new QnaDTO();
// set메서드 호출 qno,qcontent 저장
dto.setQno(qno);
dto.setQcontent(qcontent);

QnaDAO dao=new QnaDAO();

dao.updateQna(dto); 
// list.jsp 이동
response.sendRedirect("qnaList.jsp");
%>
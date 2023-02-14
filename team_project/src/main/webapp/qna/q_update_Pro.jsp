<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int qno=Integer.parseInt(request.getParameter("qno"));
String qtitle=request.getParameter("qtitle");
String qcontent=request.getParameter("qcontent");

// BoardDTO 객체생성
QnaDTO dto=new QnaDTO();
// set메서드 호출 num, name, subject, content 저장
dto.setQno(qno);
dto.setQtitle(qtitle);
dto.setQcontent(qcontent);

QnaDAO dao=new QnaDAO();

dao.updateQna(dto); 
// list.jsp 이동
response.sendRedirect("qnaList.jsp");
%>
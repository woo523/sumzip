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

// 패키지 board 파일이름 BoardDAO  
// 리턴할형없음 insertBoard(BoardDTO dto) 메서드 정의
// BoardDAO 객체생성
QnaDAO dao=new QnaDAO();
// insertBoard(dto) 메서드 호출 => 첫번째 ? pstmt.setInt(1, 1);
dao.insertQna(dto);

// 글목록 list.jsp
response.sendRedirect("qnaList.jsp");
%>
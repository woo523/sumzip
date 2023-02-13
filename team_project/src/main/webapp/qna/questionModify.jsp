<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// board/writePro.jsp
// request 한글처리
request.setCharacterEncoding("utf-8");
// request name, subject, content 가져와서 변수에 저장
int no=Integer.parseInt(request.getParameter("no"));
String qtilte=request.getParameter("qtilte");
String content=request.getParameter("content");
int qcount=0;
Timestamp qdate=new Timestamp(System.currentTimeMillis());

// 패키지 board 파일이름 BoardDTO 
// 멤버변수 num name subject content readcount date
// set get 메서드 만들기
// BoardDTO 객체생성
QnaDTO dto=new QnaDTO();
// set메서드 호출해서 값 저장
dto.setNo(no);
dto.setQtitle(qtitle);
dto.setQcontent(qcontent);
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
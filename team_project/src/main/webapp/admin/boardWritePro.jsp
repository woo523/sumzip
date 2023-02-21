<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//board/boardwritePro.jsp
request.setCharacterEncoding("utf-8");

// [유저번호, 제목, 내용] 변수에 저장
// int no = Integer.parseInt(request.getParameter("no"));
int no=1;
String btitle= request.getParameter("btitle");
String bcontent=request.getParameter("bcontent");
int bcount=0;
Timestamp bdate=new Timestamp(System.currentTimeMillis());

BoardDTO dto=new BoardDTO();

// 값 저장
// dto.setBno(bno)
dto.setNo(no);
dto.setBtitle(btitle);
dto.setBcontent(bcontent);
dto.setBcount(bcount);
dto.setBdate(bdate);

BoardDAO dao=new BoardDAO();

dao.insertBoard(dto);

// 글목록(boardList.jsp)으로 이동
response.sendRedirect("AdminBoardList.ad");


%>



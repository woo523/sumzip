<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     게시판 글 삭제 -->
<%
// admin/board_deletePro.jsp

int bno=Integer.parseInt(request.getParameter("bno"));

BoardDAO dao=new BoardDAO();

dao.deleteBoard(bno);

response.sendRedirect("boardList.jsp");

%>
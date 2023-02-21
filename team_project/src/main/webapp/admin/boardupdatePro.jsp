<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/boardupdatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

int bno=Integer.parseInt(request.getParameter("bno"));
int no=Integer.parseInt(request.getParameter("no"));
// int no=3;
String btitle=request.getParameter("btitle");
String bcontent=request.getParameter("bcontent");

BoardDTO dto=new BoardDTO();

dto.setBno(bno);
dto.setNo(no);
dto.setBtitle(btitle);
dto.setBcontent(bcontent);

BoardDAO dao=new BoardDAO();

dao.updateBoard(dto);

response.sendRedirect("AdminBoardList.ad");

%>
</body>
</html>
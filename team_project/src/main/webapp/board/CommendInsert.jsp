<%@page import="board.CommendDAO"%>
<%@page import="board.CommendDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");
int bno = Integer.parseInt(request.getParameter("bno"));
int no = Integer.parseInt(request.getParameter("no"));
String commend = request.getParameter("commend");
int rno = Integer.parseInt(request.getParameter("rno"));
// int bno=1; // 임시값
// int no=1; // 임시값


Timestamp cdate = new Timestamp(System.currentTimeMillis());


CommendDTO dto = new CommendDTO();
dto.setBno(bno);
dto.setNo(no);
dto.setRno(rno);
dto.setCommend(commend);
dto.setCdate(cdate);


CommendDAO dao = new CommendDAO();
dao.insertCommend(dto);

response.sendRedirect("BoardContent.bo");

%>
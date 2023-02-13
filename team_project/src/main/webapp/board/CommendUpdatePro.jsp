<%@page import="board.CommendDAO"%>
<%@page import="board.CommendDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");

int cno=Integer.parseInt(request.getParameter("cno"));

String commend=request.getParameter("commend");

CommendDTO dto=new CommendDTO();

dto.setCno(cno);
dto.setCommend(commend);

CommendDAO dao=new CommendDAO();

dao.updateCommend(dto);

response.sendRedirect("replyForm.jsp");

%>
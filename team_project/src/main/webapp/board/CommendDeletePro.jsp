<%@page import="board.CommendDTO"%>
<%@page import="board.CommendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

//String id=(String)session.getAttribute("id");
//UserDAO dao = new UserDAO();
//UserDTO dto = dao.getUser(id);
//int no = dto.getNo();
int no = 1; // 임시값

int cno=Integer.parseInt(request.getParameter("cno"));
CommendDAO cdao=new CommendDAO();
CommendDTO cdto=cdao.getCommend(cno);


if(cdto.getNo()!=no){
%>
<script>
	alert("본인 답댓글만 삭제가능합니다");
	history.back();
</script>
<%
} else{

CommendDAO dao=new CommendDAO();
dao.deleteCommend(cno);
response.sendRedirect("replyForm.jsp");
}
%>
<%@page import="board.ReplyDTO"%>
<%@page import="board.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글수정</title>
</head>
<body>
<%
//String id=(String)session.getAttribute("id");
//UserDAO dao = new UserDAO();
//UserDTO dto = dao.getUser(id);
//int no = dto.getNo();

int bno=1;
int no=1;

int rno=Integer.parseInt(request.getParameter("rno"));
ReplyDAO rdao=new ReplyDAO();
ReplyDTO rdto=rdao.getReply(rno);
	

if(rdto.getNo()!=no){
%>
<script>
	alert("본인 글만 수정가능합니다");
	history.back();
</script>
<%
}
%>



<h2>댓글수정</h2>
<form action="replyUpdatePro.jsp?rno=<%=rno%>" method ="post">
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="bno" value="<%=rdto.getBno()%>">
<textarea rows="3" cols="80" name="riply" ><%=rdto.getRiply() %></textarea>
<input type="submit" value="댓글수정">
</form>
</body>
</html>


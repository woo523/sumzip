<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
int qno=Integer.parseInt(request.getParameter("qno"));
//BoardDAO 객체생성
QnaDAO dao=new QnaDAO();
//리턴할형 BoardDTO getBoard(int num) 메서드 정의
//BoardDTO dto = dao.getBoard(num) 메서드 호출
QnaDTO dto = dao.getQna(qno);  
//세션값 가져오기
String id=(String)session.getAttribute("id");
int no=dto.getNo();
UserDAO udao = new UserDAO();
UserDTO udto = udao.getUserNo(no);
%>
<h1>답변</h1>
<table border="1">
	<tr><td>글번호</td><td><%=dto.getQno() %></td></tr>
	<tr><td>글쓴날짜</td><td><%=udto.getId() %></td></tr> 
	<tr><td>글내용</td><td><%=dto.getQcontent() %></td></tr>
	<tr><td colspan="2">
	
<%
if(udto.getUtype()==2){
	%>
	<input type="button" value="글수정" 
	onclick="location.href='q_update_Form.jsp?qno=<%=dto.getQno()%>'">
	<input type="button" value="글삭제" 
	onclick="location.href='question_delete.jsp?qno=<%=dto.getQno()%>'">
	<%
	}
	%>
}
%>
</body>
</html>
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
<title>qna/question.jsp</title>
</head>
<body>
<%

// request에 저장된 qno 파라미터값 가져오기
int qno=Integer.parseInt(request.getParameter("qno"));
// QnaDAO 객체생성
QnaDAO dao=new QnaDAO();
dao.qCount(qno);

// QnaDTO dto = dao.getQna(no) 메서드 호출
QnaDTO dto = dao.getQna(qno);  
// 세션값 가져오기
String id=(String)session.getAttribute("id");
int no=dto.getNo();
UserDAO udao = new UserDAO();
UserDTO udto = udao.getUserNo(no);
%>
<h1>글내용 [로그인 : <%=id %>]</h1>
<table border="1">
	<tr><td>글번호</td><td><%=dto.getQno() %></td></tr>
	<tr><td>작성자</td><td><%=udto.getId() %></td></tr>
	<tr><td>글쓴날짜</td><td><%=dto.getQdate() %></td></tr> 
	<tr><td>조회수</td><td><%=dto.getQcount() %></td></tr>
	<tr><td>글제목</td><td><%=dto.getQtitle() %></td></tr>
	<tr><td>글내용</td><td><%=dto.getQcontent() %></td></tr>
	<tr><td colspan="2">
	<%
	// 로그인 => 세션값 있음
	if(id!=null){ //id!=null => 세션값이 있다는 뜻
		// 글쓴이,세션값 => 일치 => 자기자신이 쓴 글(글수정, 글삭제 보이기)
		if(id.equals(udto.getId())){
	%>
	<input type="button" value="글수정" 
	onclick="location.href='q_update_Form.jsp?qno=<%=dto.getQno()%>'">
	<input type="button" value="글삭제" 
	onclick="location.href='question_delete.jsp?qno=<%=dto.getQno()%>'">
	<%
		}
	}
	%>
	<input type="button" value="글목록" 
	onclick="location.href='qnaList.jsp'">
	<input type="button" value="답변확인" 
	onclick="location.href='user_answer.jsp?qno=<%=dto.getQno() %>'">
	</td></tr>
</table>
</body>
</html>
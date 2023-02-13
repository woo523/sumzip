<%@page import="qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<%
//BoardDAO 객체 생성
QnaDAO dao=new QnaDAO();
// 리턴할형 ArrayList<BoardDTO> getBoardList() 메서드 정의
// ArrayList<BoardDTO> boardList = dao.getBoardList() 메서드 호출
ArrayList<QnaDTO> qnaList = dao.getQnaList();
%>
<h1>board/list.jsp</h1>
<table border="1">
<tr><td>글번호</td><td>글쓴이</td><td>글제목</td>
	<td>글쓴날짜</td><td>조회수</td></tr>
<%
//배열접근 => for => 배열 한칸에 내용 가져오기 => BoardDTO 저장 => 출력
for(int i=0;i<qnaList.size();i++){
	QnaDTO dto= qnaList.get(i);
	%>
	<tr><td><%=dto.getQno() %></td>
			<td><%=dto.getNo() %></td>
			<td><%=dto.getQtitle() %></td>
			<td><%=dto.getQcontent() %></td>
			<td><%=dto.getAnswer() %></td>
			<td><%=dto.getQstatus() %></td>
			<td><%=dto.getQpw() %></td>
			<td><%=dto.getQcount() %></td>
			<td><%=dto.getQtype() %></td>
			<td><%=dto.getQdate() %></td>
			<td><%=dto.getQadate() %></td></tr>	
	<%
}
%>
</table>
		
		
<jsp:include page="../inc/footer.jsp" />		
</body>
</html>
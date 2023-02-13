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

int pageSize=10;

String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	// => 페이지 번호가 없으면 1페이지 설정
	pageNum="1";
}
// apgeNum => 숫자변경
int currentPage=Integer.parseInt(pageNum);

int startRow=(currentPage-1)*pageSize+1;
int endRow=startRow+pageSize-1;

ArrayList<QnaDTO> qnaList = dao.getQnaList(startRow, pageSize); 
%>

<article>
<h3>Q&A</h3>
<table border="1">
<tr><td>글번호</td><td>작성자</td><td>질문유형</td><td>제목</td><td>답변상태</td>
	<td>글쓴날짜</td><td>답변날짜</td><td>조회수</td></tr>
<%
//배열접근 => for => 배열 한칸에 내용 가져오기 => BoardDTO 저장 => 출력
for(int i=0;i<qnaList.size();i++){
	QnaDTO dto= qnaList.get(i);
	%>
	<tr><td><%=dto.getQno() %></td>
			<td><%=dto.getNo() %></td>
			<td><%=dto.getQtype() %></td>
			<td><%=dto.getQtitle() %></td>
			<td><%=dto.getQstatus() %></td>			
			<td><%=dto.getQdate() %></td>
			<td><%=dto.getQadate() %></td></tr>	
			<td><%=dto.getQcount() %></td>
	<%
}
%>
</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
	<%
// 한화면에 보여줄 페이지 개수 설정
int pageBlock=10;
// 시작하는 페이지 번호 구하기
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
int endPage=startPage+pageBlock-1;

int count = dao.getQnaCount();

// 전체페이지(pageCount) 구하기 
int pageCount=count/pageSize+(count%pageSize==0?0:1); 
if(endPage > pageCount){
	endPage = pageCount;
}

// 10페이지 이전
if(startPage > pageBlock){
	%>
 	<a href="list.jsp?pageNum=<%=currentPage-pageBlock %>">[10페이지 이전]</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
	<%
}

// 10페이지 다음
if(endPage < pageCount){
	%>
	<a href="list.jsp?pageNum=<%=startPage+pageBlock %>">[10페이지 다음]</a>
		<%
}
%>	
</article>		
<jsp:include page="../inc/footer.jsp" />		
</body>
</html>
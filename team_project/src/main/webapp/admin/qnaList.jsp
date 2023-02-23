<%@page import="java.text.SimpleDateFormat"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>섬집 관리자 페이지</title>
<script type="text/javascript" src="script/jquery-3.6.3.js"></script>
<style>
article{
	font-family: 'NanumSquareNeo';
  	max-width: 1000px;
 	margin: 0 auto;
 	padding: 50px;
}
.table thead.thead-primary{
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;
	
}

.heading-section {
    font-size: 28px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: bold;
    text-align: center;
    margin: 10px; 
     
}

#table_search{
	float: right;
   
}

</style>
</head>
<body>


<!-- 한페이지에 보여줄 글 개수 -->
<%
ArrayList<QnaDTO> qnaList = (ArrayList<QnaDTO>)request.getAttribute("qnaList");
int currentPage =(Integer)request.getAttribute("currentPage");
int pageBlock =(Integer)request.getAttribute("pageBlock");
int startPage =(Integer)request.getAttribute("startPage");
int endPage =(Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

String qstatus = "";
%>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
<!-- Backgrounds -->
	<div class="container">
    	<div class="row">
			
			<div class="col-lg-12">
				<div class="content-main adminichi">		
					<h1>Q&AList</h1>
					<article>
						<table class="table">
							<thead class="thead-primary">
								<tr><td>No</td><td>Writer</td><td>Title</td>
								<td>Date</td><td>Answer Status</td><td>View</td></tr>
							</thead>
						<%
						//배열접근 => for => 배열 한칸에 내용 가져오기 => qnaDTO 저장 => 출력
						for(int i=0;i<qnaList.size();i++){
							QnaDTO dto= qnaList.get(i);
						
						// 답변 상태
						if(dto.getQstatus()==0){ 
							qstatus = "답변완료";
						}else{
							qstatus="답변미등록";
						}
						%>
							<tr><td><%=dto.getQno() %></td>
								<td><%=dto.getNo() %></td>
								<td><a href="AdminQnaQuestion.ad?qno=<%=dto.getQno() %>"><%=dto.getQtitle() %></a></td>
								<td><%=dateFormat.format(dto.getQdate()) %></td>
								<td><%=qstatus%></td>	
								<td><%=dto.getQcount()%></td></tr>	
							<%
						}
						%>
						</table>
						<div id="table_search">
							<button type="button" class="btn btn-outline-success" value="글쓰기" onclick="location.href='QuestionWriteForm.qa'">글쓰기</button><br>
						</div>
						<!-- 페이징 처리 -->
							<%
						// 10페이지 이전
						if(startPage > pageBlock){
							%>
						 	<a href="AdminQnaList.ad?pageNum=<%=currentPage-pageBlock %>">[10페이지 이전]</a>
							<%
						}
						
						for(int i=startPage;i<=endPage;i++){
							%>
							<a href="AdminQnaList.ad?pageNum=<%=i %>"><%=i %></a>
							<%
						}
						
						// 10페이지 다음
						if(endPage < pageCount){
							%>
							<a href="AdminQnaList.ad?pageNum=<%=startPage+pageBlock %>">[10페이지 다음]</a>
								<%
						}
						%>
					
					</article>		
				</div>
			</div>
		</div>
	</div>

<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
</body>
</html>
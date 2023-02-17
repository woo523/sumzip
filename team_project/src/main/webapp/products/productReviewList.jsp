<%@page import="member.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewList.JSP</title>
</head>
<style>
	ul li {
		list-style: none;
	}
	ul #img {
 		margin: 0px 20px 10px 0px;
 		color : black;
        display: inline-block;
	}
</style>
<body>
<%
// 	해당 펜션 리뷰 리스트 출력

	// 임시 데이터
	int pno = 100;
	
	ArrayList<ReviewDTO> reviewList = (ArrayList<ReviewDTO>)request.getAttribute("reviewList");
	
	int currentPage = (Integer)request.getAttribute("currentPage");
	int startPage = (Integer)request.getAttribute("startPage");
	int pageBlock = (Integer)request.getAttribute("pageBlock");
	int endPage = (Integer)request.getAttribute("endPage");
	int pageCount = (Integer)request.getAttribute("pageCount");

	for(int i = 0; i < reviewList.size(); i++) {
		ReviewDTO rdto = reviewList.get(i);
	%>
	
	<!-- 후기 리스트  -->
	<ul>
		<li>한줄평 <%=rdto.getRtitle() %></li>
<!-- 		<li>작성자</li> -->
		<li>별점 <%=rdto.getRstar() %></li>
		<li>글내용 <%=rdto.getRcontent() %></li>
		<li id="img">사진1</li>
		<li id="img"><img src="upload/<%=rdto.getRpic1()%>" width="200" height="150"></li>
		<li id="img">사진2</li>
		<li id="img"></li>
		<li id="img">사진3</li>
		<li id="img"></li>
	</ul>
	<% } %>
	
	<%
		if(currentPage > 1) {
			%>
			<a href="MemberReviewList.me?pageNum=<%=currentPage-1%>">[1 페이지 이전]</a>
			<%
		}
	
		if(startPage > pageBlock) {
			%>
			<a href="MemberReviewList.me?pageNum=<%=startPage-pageBlock%>">[10 페이지 이전]</a>
			<%
		}
		
		for(int i = startPage; i <= endPage; i++) {
			%>
			<a href="MemberReviewList.me?pageNum=<%=i%>"><%=i %></a>
			<%
		}
		
		if(currentPage < pageCount) {
			%>
			<a href="MemberReviewList.me?pageNum=<%=currentPage+1%>">[1 페이지 다음]</a>
			<%
		}
		
		if(endPage < pageCount) {
			%>
			<a href="MemberReviewList.me?pageNum=<%=startPage+pageBlock%>">[10 페이지 다음]</a>
			<%
		}
	%>
	
</body>
</html>
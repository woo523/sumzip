<%@page import="board.BoardDAO"%>
<%@page import="java.awt.desktop.UserSessionListener"%>
<%@page import="member.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.UserDAO"%>
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
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->

<%
// UserDAO dao=new UserDAO();
//한 페이지레 보여줄 글개수 설정
// int pageSize=10;
//현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정
// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
	//=>페이지번호가 없으면 1페이지 설정
// 	pageNum="1";
// }
//pageNum => 숫자변경
// int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기
// int startRow=(currentPage-1)*pageSize+1;
//끝나는 행번호 구하기
// int endRow =startRow+pageSize-1;

String id=(String)session.getAttribute("id");
ArrayList<UserDTO> userList =(ArrayList<UserDTO>)request.getAttribute("userList");

int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");

%>
<h1>user list</h1>
<form action="AdminUserDelete.ad" id="user_delete" method="post">
<table border="1">
<tr><td>이름</td><td>아이디</td>
	<td>생일</td><td>주소</td><td>이메일</td>
	<td>가입날짜</td><td>회원삭제</td></tr>
<%
//배열 접근 = for
for(int i=0;i<userList.size();i++){
	// 배열 한 칸에 내용 가져오기
	UserDTO dto=userList.get(i);
	%>
	<tr><td><%=dto.getUname() %></td><td><%=dto.getId() %></td>
	<td><%=dto.getBirth() %></td>
	<td><%=dto.getAddress1() %> | <%=dto.getAddress2() %></td>
	<td><%=dto.getEmail() %></td><td><%=dto.getJoindate() %></td>
	<td><a href="AdminUserDelete.ad?id=<%=dto.getId()%>">회원삭제</a></td></tr>
	<%
}
%>
</table>
<div id="page_control">

<%
// 한 화면에 보여줄 페이지 개수 설정
// int pageBlock=10;
//시작하는 페이지 번호 구하기
// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//끝나는 페이지 번호 구하기
// int endPage=startPage+pageBlock-1;

// int count = dao.getUserCount();

// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// if(endPage > pageCount){
// 	endPage = pageCount;
// }

// 10페이지 이전
if(startPage > pageBlock){
	%>
	<a href="AdminUserList.ad?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="AdminUserList.ad?pageNum=<%=i%>"><%=i %></a>
	<%
}


//10페이지 다음
if(endPage < pageCount){
	%>
	<a href="AdminUserList.ad?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}
%>
</div>
</form>
</body>
</html>
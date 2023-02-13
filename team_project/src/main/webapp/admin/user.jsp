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

<%
UserDAO dao=new UserDAO();
BoardDAO bdao=new BoardDAO();
//한 페이지레 보여줄 글개수 설정
int pageSize=10;
//현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정

String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	//=>페이지번호가 없으면 1페이지 설정
	pageNum="1";
}
//pageNum => 숫자변경
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
int endRow =startRow+pageSize-1;

String id=(String)session.getAttribute("id");
ArrayList<UserDTO> userList =dao.getUserList(startRow, pageSize);

%>
<h1>user list</h1>
<form action="userDelete.jsp" id="user_delete" method="post">
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
	<td><a href="userDelete.jsp?id=<%=dto.getId()%>">회원삭제</a></td></tr>
	<%
}
%>
</table>
<%
// 한 화면에 보여줄 페이지 개수 설정
int pageBlock=10;
//시작하는 페이지 번호 구하기
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//끝나는 페이지 번호 구하기
int endPage=startPage+pageBlock-1;

int count = bdao.getBoardCount();

int pageCount=count/pageSize+(count%pageSize==0?0:1);
if(endPage > pageCount){
	endPage = pageCount;
}

// 이전
if(currentPage > 1){
%>
<%
}

// 10페이지 이전
if(startPage > pageBlock){
	%>
	<a href="user.jsp?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="user.jsp?pageNum=<%=i%>"><%=i %></a>
	<%
}

//다음
if(currentPage < pageCount){
	%>
<%-- 	<a href="list.jsp?pageNum=<%=currentPage+1%>">[1페이지 다음]</a> --%>
	<%
}

//10페이지 다음
if(endPage < pageCount){
	%>
	<a href="user.jsp?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}
%>

</form>
</body>
</html>
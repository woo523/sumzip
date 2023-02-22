<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#sidebar{
 	width: 250px; 
   	height: 1000px;   
/*  	background-color: #98FD5D;  */
	float: left;
}
</style>
</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/header.jsp" />
		<!-- 헤더들어가는 곳 -->
		<nav id="sidebar">
		<ul>
		<%
			String id=(String)session.getAttribute("id");
            UserDAO dao = new UserDAO();
            // MemberDTO dto = getMember(id) 메서드호출
            UserDTO dto = dao.getUser(id);

			if(id!=null){
				if(dto.getUtype()==1){
			%>
			
				<li><a href="MemberMyPage_user.me">내 정보 조회</a></li>
				<li><a href="MemberMyList.me">내 이용목록</a></li>
				<li><a href="ProductAppointManage.pr">예약관리</a></li>
				<li><a href="MemberWishList.me">찜 목록</a></li>
				<li><a href="MemberDeleteForm.me">회원탈퇴</a></li>
			
				<% 
				}else if(dto.getUtype()==2){
				%>
			
				<li><a href="MemberMyPage_owner.me">내 정보 조회</a></li>
				<li><a href="#">내 이용목록</a></li>
				<li><a href="ProductList.pr">내 펜션조회</a></li>
				<li><a href="ProductAppointManage.pr">예약관리</a></li>
				<li><a href="MemberWishList.me">찜 목록</a></li>
				<li><a href="MemberDeleteForm.me">회원탈퇴</a></li>
			
				<% 
				}
				%>
			<% 
			}
			%>
			</ul>
		</nav>
	</div>
	
	<div class="content-main">
		<div class="row">
			<div class="col-sm-9">
				<h1>My Page</h1>
				<hr>
<!-- 				<div class="bg-white rounded shadow-sm container p-3"> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</body>
</html>
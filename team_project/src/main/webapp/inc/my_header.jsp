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
  #wrap {
  width: 100%;
  max-width: 1100px;
  margin: 0 auto;
/*   margin-bottom: 50px;  */
  font-family: Arial, sans-serif;
  border-radius: 10px;
 }
 
#sidebar{
 	width: 250px; 
   	height: 1000px;   
	float: left;
}
</style>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
	<div id="wrap">
		
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
				<li><a href="MemberWishList.me">찜 목록</a></li>
				<li><a href="ProductAppointManage.pr">예약내역</a></li>
				<li><a href="MemberMyList.me">이용내역</a></li>
				<li><a href="MemberDeleteForm.me">회원탈퇴</a></li>
			
				<% 
				}else if(dto.getUtype()==2){
				%>
			
				<li><a href="MemberMyPage_user.me">내 정보 조회</a></li>
				<li><a href="ProductList.pr">등록 펜션조회</a></li>
				<li><a href="MemberWishList.me">찜 목록</a></li>
				<li><a href="ProductAppointManage.pr">예약내역</a></li>
				<li><a href="MemberMyList.me">이용내역</a></li>
				<li><a href="MemberDeleteForm.me">회원탈퇴</a></li>
			
				<% 
				}
				%>
			<% 
			}
			%>
			</ul>
		</nav>
	
	
<!-- 	<div class="content-main"> -->
		<div class="row">
			<div class="col-sm-9">
				<h1>My Page</h1>
				<hr>
<!-- 				<div class="bg-white rounded shadow-sm container p-3"> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
<!-- 	</div> -->
</body>
</html>
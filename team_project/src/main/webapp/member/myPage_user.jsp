<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage_u</title>
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
	<%
	// 회원정보 기준값 id => 세션에 id 값 저장 되어있음
	// 세션에서 "id" 값을 가져오기 => 변수저장
 	String id = (String) session.getAttribute("id");
	// MemberDAO 객체생성
 	UserDAO dao= new UserDAO();
	// MemberDTO dto = getMember(id) 메서드호출
 	UserDTO dto = dao.getUser(id);
	%>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/header.jsp" />
		<!-- 헤더들어가는 곳 -->
		<nav id="sidebar">
			<ul>
				<li><a href="MemberMyPage_user.me">내 정보 조회</a></li>
				<li><a href="MemberMyList.me">내 이용목록</a></li>
				<li><a href="../products/appointManage.jsp">예약관리</a></li>
				<li><a href="#">찜 목록</a></li>
				<li><a href="MemberDeleteForm.me">회원탈퇴</a></li>
			</ul>
		</nav>
	</div>

	<div class="content-main">
		<div class="row">
			<div class="col-sm-9">
				<h1>My Page</h1>
				<hr>
				<div class="bg-white rounded shadow-sm container p-3">
					<form method="POST" action="updateAction" name="updateForm"
						onsubmit="return updateValidate();" class="form-horizontal"
						role="form">
						<!-- 이름 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>이름</label> <input type="text" name="uname"
									value="<%=dto.getUname()%>" readonly>
							</div>
						</div>

						<!-- 아이디 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>아이디</label> <input type="text" name="id" value="<%=id%>"
									readonly>
							</div>
						</div>


						<!-- 이름 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>전화번호</label> <input type="text" name="tel"
									value="<%=dto.getTel()%>" readonly>
							</div>
						</div>

						<!-- 이름 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>이메일</label> <input type="text" name="email"
									value="<%=dto.getEmail()%>" readonly>
							</div>
						</div>

						<!-- 이름 -->
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>주소</label> <input type="text" name="adrress1"
									value="<%=dto.getAddress1()%>" readonly> <input
									type="text" name="adrress2" value="<%//=dto.getAddress2()%>"
									readonly>
							</div>		
						</div>
						
						<div class="btnChange">
							<a href="MemberUpdateForm.me">
							<input type="button" name="user_modify" value="회원정보 수정"></a> 
							<a href="MemberPwModify.me">
								<input type="button" name="pass_modify" value="비밀번호 수정"></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
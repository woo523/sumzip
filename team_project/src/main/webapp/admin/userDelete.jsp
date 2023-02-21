
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String id=request.getParameter("id");

UserDAO dao=new UserDAO();
UserDTO dto=dao.idCheck(id);


if(dto != null){
	// id,pass 일치
	// 리턴값없음 deleteMember(String id) 메서드 정의 
	// dao.deleteMember(id) 메서드 호출
	dao.delUserlist(id);
	// => 세션값 초기화
// 	session.invalidate();		
	// => main.jsp 이동
	response.sendRedirect("AdminUserList.ad");
}else{
    %>
    <script type="text/javascript">
		alert("유저목록에 없습니다.");
		history.back();
    </script>
    <%
}
%>
</body>
</html>
<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointManage</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<h1>예약관리</h1>
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	UserDAO dao=new UserDAO();
	UserDTO dto=dao.getUser(id);
	int no=dto.getNo();
	AppointmentDAO dao2=new AppointmentDAO();
	ArrayList<AppointmentDTO> appointmentList=dao2.getUserAppointmentList(no);

	%>
	<table border="1">
	<tr><td>유저번호</td><td>예약번호</td><td>상품번호</td><td>예약상태</td><td>예약일자</td><td>예약취소</td></tr>
	<%
	for(int i=0;i<appointmentList.size();i++){
		//배열 한칸에 내용 가져오기 
		AppointmentDTO dto2=appointmentList.get(i);
		%>
	<tr><td><%=dto2.getNo()%></td>
	    <td><%=dto2.getAno()%></td>
	    <td><%=dto2.getPno()%></td>
	    <td><%=dto2.getAstatus()%></td>
	    <td><%=dto2.getAdate()%></td>
	    <td><a href="appointManagePro.jsp?num=<%=dto2.getAno()%>">예약취소</a></td></tr>
<!-- 	    예약취소버튼 이미지로 -->
		<%
	}
	%>
	</table>
	<a href="../member/myPage_user.jsp">마이페이지로 돌아가기</a><br>
<%
}else {
	response.sendRedirect("../member/login.jsp");
}
%>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
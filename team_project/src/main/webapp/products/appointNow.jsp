<%@page import="products.AppointmentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointNow</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<h1>숙소 예약 현황 (관리자용)</h1>
<h1>예약중인펜션</h1>
<%
// String id=admin;
// String id=(String)session.getAttribute("id");
// if(id=="admin"){
AppointmentDAO dao=new AppointmentDAO();
ArrayList<AppointmentDTO> appointmentList=dao.getAdminAppointmentList();

%>
<table border="1">
<tr><td>유저번호</td><td>예약번호</td><td>상품번호</td><td>예약상태</td><td>예약일자</td><td>예약취소</td></tr>
<%
 for(int i=0;i<appointmentList.size();i++){
 	//배열 한칸에 내용 가져오기
 	AppointmentDTO dto=appointmentList.get(i);
	%>
<tr><td><%=dto.getNo()%></td>
    <td><%=dto.getAno()%></td>
    <td><%=dto.getPno()%></td>
    <td><%=dto.getAstatus()%></td>
    <td><%=dto.getAdate()%></td>
    <td><a href="appointNowPro.jsp?num=<%=dto.getAno()%>">예약취소</a></td></tr>    
<%
    }
%>
<%-- 	<% --%>
<!-- // } -->
<!-- // }else { -->
<!-- // 	response.sendRedirect("../member/login.jsp"); -->
<!-- // } -->
<!-- %> -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
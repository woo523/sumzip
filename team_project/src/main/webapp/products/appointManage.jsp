<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
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
<h1>예약관리</h1>
<%
// String id=(String)session.getAttribute("id");
// if(id==null){
// 	response.sendRedirect("../member/login.jsp ");
// }
AppointmentDAO dao=new AppointmentDAO();
ArrayList<AppointmentDTO> appointmentList=dao.getAppointmentList();

%>
<table border="1">
<tr><td>유저번호</td><td>예약번호</td><td>상품번호</td><td>예약상태</td><td>예약일자</td></tr>
<%
for(int i=0;i<appointmentList.size();i++){
	//배열 한칸에 내용 가져오기 
	AppointmentDTO dto=appointmentList.get(i);
	%>
<tr><td><%=dto.getNo() %></td>
    <td><%=dto.getAno() %></td>
    <td><%=dto.getPno() %></td>
    <td><%=dto.getAstatus() %></td>
    <td><%=dto.getAdate() %></td></tr>	
	<%
}
%>
</table>
</body>
</html>
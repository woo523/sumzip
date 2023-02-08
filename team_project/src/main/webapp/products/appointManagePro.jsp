<%@page import="products.AppointmentDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointManagePro</title>
</head>
<body>
<%
int ano=Integer.parseInt(request.getParameter("ano"));

AppointmentDAO dao=new AppointmentDAO();
AppointmentDTO dto=dao.AppointmentCheck(ano);

if(dto != null){
	// id,pass 일치
	// 리턴값없음 deleteMember(String id) 메서드 정의 
	// dao.deleteMember(id) 메서드 호출
	dao.deleteAppointment(ano);
	// => 세션값 초기화
	session.invalidate();		
	// => main.jsp 이동
	response.sendRedirect("appointment.jsp");
}else{
    %>
    <script type="text/javascript">
		alert("예약리스트에 없습니다.");
		history.back();
    </script>
    <%
}



%>
</body>
</html>
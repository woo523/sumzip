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
// 가져온 넘버값 num에 저장
int num=Integer.parseInt(request.getParameter("num"));

// 체크
AppointmentDAO dao=new AppointmentDAO();
AppointmentDTO dto=dao.AppointmentCheck(num);
// AppointmentDTO dto=(AppointmentDTO)request.getAttribute("dto");

if(dto != null){
	// 일치 확인
	// 리턴값없음 deleteAppointment(int num) 메서드 정의 
	// dao.deleteAppointment(num) 메서드 호출
	dao.deleteAppointment(num);
	// => 세션값 초기화
// 	session.invalidate();		
	// => appointManage.jsp 이동
	response.sendRedirect("ProductAppointManage.pr");
}else{
	// 일치하지 않을 시
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
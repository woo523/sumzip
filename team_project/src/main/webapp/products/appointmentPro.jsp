<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointmentPro</title>
</head>
<body>
<%
//폼에서 입력한 내용이 서버에 전달 => request 내장객체 저장
//request 한글처리
request.setCharacterEncoding("utf-8");
//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
int ano=Integer.parseInt(request.getParameter("ano"));
int pno=Integer.parseInt(request.getParameter("pno"));
int no=Integer.parseInt(request.getParameter("no"));
int astatus=1;
Timestamp adate=new Timestamp(System.currentTimeMillis());

AppointmentDTO dto=new AppointmentDTO();
dto.setAno(ano);
dto.setPno(pno);
dto.setNo(no);
dto.setAstatus(astatus);
dto.setAdate(adate);

AppointmentDAO dao=new AppointmentDAO();
dao.insertAppointment(dto);

//예약관리 페이지로 이동
response.sendRedirect("appointManage.jsp");
%>
</body>
</html>
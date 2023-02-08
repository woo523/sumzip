<%@page import="products.ProductDTO"%>
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
// ProductDAO dao=new ProductDAO();
// ProductDTO dto=dao.getProductList(pno);


// AppointmentDAO dao=new AppointmentDAO();
// AppointmentDTO dto=dao.getUser(id);
// int no=dto.getNo();
// ArrayList<AppointmentDTO> appointmentList=dao.getUserAppointmentList(no);

%>
<form action="appointManagePro.jsp" method="post">
<table border="1">
<tr><td>체크</td><td>유저번호</td><td>예약번호</td><td>상품번호</td><td>예약상태</td><td>예약일자</td></tr>
<%
// for(int i=0;i<appointmentList.size();i++){
// 	//배열 한칸에 내용 가져오기 
// 	AppointmentDTO dto2=appointmentList.get(i);
	%>
<tr><td><input type="radio" name="ra"></td>
<%--     <td><%=dto2.getNo()%></td> --%>
<%--     <td><%=dto2.getAno()%></td> --%>
<%--     <td><%=dto2.getPno()%></td> --%>
<%--     <td><%=dto2.getAstatus()%></td> --%>
<%--     <td><%=dto2.getAdate()%></td></tr>     --%>
	<%
// }
%>
</table>
<input type="submit" value="예약취소">
</form>
<a href="../member/mypage.jsp">마이페이지로 돌아가기</a><br>
</body>
</html>
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
// String id=(String)session.getAttribute("id");
// if(id=="admin"){

	AppointmentDAO dao=new AppointmentDAO();
	ArrayList<AppointmentDTO> appointmentList=dao.getAdminAppointmentList();

	%>
	<form action="appointNowUpdate.jsp" method="post">
	<table border="1">
	<tr><td>유저번호</td><td>예약번호</td><td>상품번호</td><td>예약상태</td><td>예약일자</td><td>예약취소</td></tr>
	<%
	 for(int i=0;i<appointmentList.size();i++){
	 	//배열 한칸에 내용 가져오기
	 	AppointmentDTO dto=appointmentList.get(i);
		%>
	<tr><td><input type="text" name="no" value="<%=dto.getNo()%>"></td>
	    <td><input type="text" name="ano" value="<%=dto.getAno()%>"></td>
	    <td><input type="text" name="pno" value="<%=dto.getPno()%>"></td>
	    <td><input type="text" name="astatus" value="<%=dto.getAstatus()%>"></td>
	    <td><input type="text" name="adate" value="<%=dto.getAdate()%>"></td>
	    <td><a href="appointNowDelete.jsp?num=<%=dto.getAno()%>">예약취소</a></td></tr>    
	   <%
	   }
	%>
	</table>
	</form>
<%-- <% --%>
// 	}
// }else {
// 	response.sendRedirect("../member/login.jsp");
// }
<%-- %> --%>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
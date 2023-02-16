<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
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
<br><br><br>

<div class="tb"><h1>예약관리</h1></div><br>

<%

String id="jung123";
// String id=(String)session.getAttribute("id");
// if(id!=null){
	UserDAO dao=new UserDAO();
	UserDTO dto=dao.getUser(id);
	int no=dto.getNo();
	AppointmentDAO dao2=new AppointmentDAO();
	ArrayList<AppointmentDTO> appointmentList=dao2.getUserAppointmentList(no);
	SalesDAO dao3=new SalesDAO();
	SalesDTO dto3=dao3.getSales(dto.getNo());
	ProductDAO dao4=new ProductDAO();
	ProductDTO dto4=dao4.getProduct(dto3.getPno());
	
	
	
	%>
	<div class="tb"><table border="1">
	<tr><td class="tb"> 예약번호 </td><td class="tb"> 펜션이름 </td><td class="tb"> 예약상태 </td>
	<td class="tb"> 예약일자 </td><td class="tb"> 예약취소 </td></tr>
	<%
	for(int i=0;i<appointmentList.size();i++){
		//배열 한칸에 내용 가져오기 
		AppointmentDTO dto2=appointmentList.get(i);
		%>
	<tr><td class="tb"> <%=dto2.getAno()%> </td>
	    <td class="tb"> <%=dto4.getPname()%> </td>
	    <td class="tb"> <%
	    if(dto2.getAstatus()==1){
	    	out.print("입금대기");
	    }else if(dto2.getAstatus()==2){
	    	out.print("입금확인");
	    }else if(dto2.getAstatus()==3){
	    	out.print("예약완료");
	    }%> </td>
	    <td class="tb"> <%=dto2.getAdate()%> </td>
	    <td class="tb"><a href="appointManagePro.jsp?num=<%=dto2.getAno()%>">
	    	<button type="button" class="btm_image" id="img_btn">
	    	<div class="am"><img src="../img/clear-g1b5fbe279_640.png"></div></button>
	    	</a></td></tr>
<!-- 	    예약취소버튼 이미지로 -->
		<%
	}
	%>
	</table>
	</div>
<%
// }else {
// 	response.sendRedirect("../member/login.jsp");
// }
%>



<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->
</body>
</html>
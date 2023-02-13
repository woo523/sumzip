<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointNowUpdate</title>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
int ano=Integer.parseInt(request.getParameter("ano"));
int astatus=Integer.parseInt(request.getParameter("astatus"));

UserDAO dao=new UserDAO();
UserDTO dto=dao.idCheck(id);


AppointmentDTO appointupdateDto=new AppointmentDTO();
appointupdateDto.setAstatus(astatus);
// System.out.println(appointupdateDto.getAstatus());
AppointmentDAO dao2=new AppointmentDAO();

if(dto!=null){
	// 리턴값없음 updateMember(MemberDTO updateDto) 메서드 정의 
	// dao.updateMember(updateDto) 메서드 호출
	dao2.updateAppointment(appointupdateDto);
	// => main.jsp 이동
	response.sendRedirect("appointNow.jsp");
}else{
//  데이터 없으면 false => 아이디 비밀번호 틀림
//=> script   "아이디 비밀번호 틀림" 뒤로이동
    %>
    <script type="text/javascript">
		alert("권한이 없는 사용자입니다.");
		history.back();
    </script>
    <%
}
%>
</body>
</html>
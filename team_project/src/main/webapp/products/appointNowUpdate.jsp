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
String id="admin";
// String id=(String)session.getAttribute("id");
int ano=Integer.parseInt(request.getParameter("ano"));
int Astatus=Integer.parseInt(request.getParameter("Astatus"));
UserDAO dao=new UserDAO();
AppointmentDAO dao2=new AppointmentDAO();
AppointmentDTO appointupdateDto=new AppointmentDTO();
if(Astatus>=3){
	Astatus=3;
	 appointupdateDto.setAstatus(Astatus);
	 appointupdateDto.setAstatus(ano);
	 dao2.updateAppointment(appointupdateDto);	
		response.sendRedirect("appointNow.jsp");
}else{
	

Astatus+=1;

appointupdateDto.setAstatus(Astatus);
appointupdateDto.setAno(ano);


	if(id=="admin"){
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
}
%>
</body>
</html>
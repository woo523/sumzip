<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장(id, pass, name)
String id=request.getParameter("id");
String pass=request.getParameter("pass");


// 수정할 내용을 바구니 객체생성 => 바구니에 저장
UserDTO modifyPassDto=new UserDTO();

modifyPassDto.setPass(pass);
// MemberDAO 객체생성
UserDAO dao=new UserDAO();

// MemberDTO dto=userCheck(id,pass) 메서드 호출
UserDTO dto=dao.idCheck(id);

if(dto!=null){
	// 아이디 비밀번호 일치 => 바구니 주소 가져오기
	// => dao.updateMember(updateDto) 메서드 호출
	// => ../main/main.jsp 이동
	dao.modifyPass(modifyPassDto); 
    response.sendRedirect("../main/main.jsp");
}else{
	// 아이디 비밀번호 틀림 => 빈바구니 주소 가져오기
	// => 데이터 없으면 false => 아이디 비밀번호 틀림
	// => script "아이디 비밀번호 틀림" 뒤로 이동
	%>
	<script type="text/javascript">
	alert("아이디 틀림");
	history.back();
	</script>
	<%
}
%>
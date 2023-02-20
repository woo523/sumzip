<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<h3>임시 비밀번호 발급</h3>
<p>아래 이메일로 임시 비밀번호를 전송합니다.</p>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
// String email = request.getParameter("email");

UserDAO dao = new UserDAO();
UserDTO dto = dao.getUser(id);

	
	dto.setId(id);
	
	String email = dao.findEmail(id);
	dto.setEmail(email);
	
	//전송할 이메일 보여주기
	if(email.length()<1) {
		out.println("<p>회원정보가 없습니다</p>");
	    out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");			
	} else {
		out.println("<p>이메일 : " + email + "</p>");
	}
	
	//임시 비밀번호 생성
	String tmpPasswd = dao.tmpPasswd(dto);
	//out.print(tmpPasswd);

	//임시 비밀번호 메일로 전송
	dao.sendTmpPw(tmpPasswd, dto);	
%>
	<a href="MemberLogin.me"><input type="button" name=login value="로그인하기"></a>
	
<jsp:include page="../inc/footer.jsp" />
</body>
</html>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
 request.setCharacterEncoding("UTF-8");
 String uname = request.getParameter("uname");
 String email = request.getParameter("email");
     
UserDAO dao = new UserDAO();
UserDTO dto = dao.findId(uname, email); 
 
 
%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

  <form name="idsearch" method="post">
      <%
       if (dto != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=dto.getId()%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <a href="login.jsp"><input type="button" id="btnLogin" value="로그인"></a>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <a href="join.jsp"><input type="button" id="btnjoin" value="회원가입"></a>
       	</div>
       </div>
          
       <%
  }
 %> 
 </form>
 <jsp:include page="../inc/footer.jsp" />
</div>
      
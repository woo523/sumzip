<%@page import="products.SalesDAO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="products.SalesDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointment</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<%

// String id= "jung123";

String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("../member/login.jsp ");
}
UserDAO dao=new UserDAO();
UserDTO dto=dao.getUser(id);
SalesDAO dao2=new SalesDAO();
SalesDTO dto2=dao2.getSales(dto.getNo());

%>
<h1>예약</h1>
<form action="appointmentPro.jsp" method="post">
<h2>예약자 정보</h2>
예약자명 : <input type="text" name="uname" value="<%=dto.getUname()%>" readonly><br>
전화번호 : <input type="text" name="tel" value="<%=dto.getTel()%>" readonly><br>
이메일 : <input type="text" name="email" value="<%=dto.getEmail()%>" readonly><br>
<h2>예약정보 확인</h2>
유저번호 : <input type="text" name="no" value="<%=dto.getNo()%>" readonly><br>
예약번호 : <input type="text" name="ano" value="<%=dto2.getAno()%>" readonly><br>
상품번호 : <input type="text" name="pno" value="<%=dto2.getPno()%>" readonly><br>
판매번호 : <input type="text" name="sno" value="<%=dto2.getSno()%>" readonly><br>
예약한 날짜 : <input type="text" name="sdate" value="<%=dto2.getSdate()%>" readonly><br>
입실일 : <input type="text" name="indate" value="<%=dto2.getIndate()%>" readonly><br>
퇴실일 : <input type="text" name="outdate" value="<%=dto2.getOutdate()%>" readonly><br>
총가격 : <input type="text" name="sprice" value="<%=dto2.getSprice()%>" readonly><br>

<input type="submit" value="예약하기">
</form>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
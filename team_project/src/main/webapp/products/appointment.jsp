<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>
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
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sona | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
<title>products/appointment</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<%

String id=(String)session.getAttribute("id"); //로그인 확인
if(id!=null){
	UserDAO dao=new UserDAO();
	UserDTO dto=dao.getUser(id);
	SalesDAO dao2=new SalesDAO();
	SalesDTO dto2=dao2.getSales(dto.getNo());
	ProductDAO dao3=new ProductDAO();
	ProductDTO dto3=new ProductDTO();

	%>
	<h1>예약</h1>
	<form action="appointmentPro.jsp" method="post">
	<h2>예약자 정보 확인</h2>
	예약자명 : <input type="text" name="uname" value="<%=dto.getUname()%>" readonly><br>
	전화번호 : <input type="text" name="tel" value="<%=dto.getTel()%>" readonly><br>
	이메일 : <input type="text" name="email" value="<%=dto.getEmail()%>" readonly><br>
	<h2>예약정보 확인</h2>
<input type="hidden" name="no" value="<%=dto.getNo()%>" readonly>
<input type="hidden" name="ano" value="<%=dto2.getAno()%>" readonly>
<input type="hidden" name="pno" value="<%=dto2.getPno()%>" readonly>
<input type="hidden" name="sno" value="<%=dto2.getSno()%>" readonly>
	예약한 날짜 : <input type="text" name="sdate" value="<%=dto2.getSdate()%>" readonly><br>
	입실일 : <input type="text" name="indate" value="<%=dto2.getIndate()%>" readonly><br>
	퇴실일 : <input type="text" name="outdate" value="<%=dto2.getOutdate()%>" readonly><br>
	총가격 : <input type="text" name="sprice" value="<%=dto2.getSprice()%>" readonly><br>

	<input type="submit" value="예약하기">
	</form>
<%
	
}else {
	response.sendRedirect("../member/login.jsp");
}
%>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
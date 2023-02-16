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
<title>products/appointment</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<%
String id=(String)session.getAttribute("id"); //id세션값 불러오기
// 로그인 확인 (비로그인시 로그인 화면으로 이동)
if(id!=null){
	
	UserDAO dao=new UserDAO();
	UserDTO dto=dao.getUser(id);
	SalesDAO dao2=new SalesDAO();
	SalesDTO dto2=dao2.getSales(dto.getNo());
	ProductDAO dao3=new ProductDAO();
	ProductDTO dto3=dao3.getProduct(dto2.getPno());
	
	
	%>
  <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h1>예약</h1>
                        <div class="bt-option">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- About Us Page Section Begin -->
    <section class="aboutus-page-section spad">
        <div class="container">
            <div class="about-page-text">
                <div class="row">
                    
                    <div class="col-lg-5 offset-lg-1">
                        <ul class="ap-services">
                        <form action="appointmentPro.jsp" method="post">
                            <h2>예약자 정보확인</h2>
                            <br>
                            <li><i class="icon_check"></i>예약자명 : <input type="text" name="uname" value="<%=dto.getUname()%>" readonly></li>
                            <li><i class="icon_check"></i>전화번호 : <input type="text" name="tel" value="<%=dto.getTel()%>" readonly></li>
                            <li><i class="icon_check"></i>이메일 : <input type="text" name="email" value="<%=dto.getEmail()%>" readonly><br></li>
                            <br>
                            <h2>예약정보 확인</h2>
							<br>
							<input type="hidden" name="no" value="<%=dto.getNo()%>" readonly>
							<input type="hidden" name="ano" value="<%=dto2.getAno()%>" readonly>
							<input type="hidden" name="pno" value="<%=dto2.getPno()%>" readonly>
							<input type="hidden" name="sno" value="<%=dto2.getSno()%>" readonly>
							<li><i class="icon_check"></i>펜션이름 : <input type="text" name="pname" value="<%=dto3.getPname()%>" readonly></li>
							<li><i class="icon_check"></i>예약한 날짜 : <input type="text" name="sdate" value="<%=dto2.getSdate()%>" readonly></li>
							<li><i class="icon_check"></i>입실일 : <input type="text" name="indate" value="<%=dto2.getIndate()%>" readonly></li>
							<li><i class="icon_check"></i>퇴실일 : <input type="text" name="outdate" value="<%=dto2.getOutdate()%>" readonly></li>
							<li><i class="icon_check"></i>총가격 : <input type="text" name="sprice" value="<%=dto2.getSprice()%>" readonly></li>
							<br>
							<li><i class="icon_check"></i><button type="submit"> 예약하기</button></li>
							</form>
                            </ul>
                    </div>
                </div>
            </div>
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
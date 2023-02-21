
<%@page import="member.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/appointment.jsp</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<%
String id=(String)session.getAttribute("id"); //id세션값 불러오기
ProductDTO pdto = (ProductDTO)request.getAttribute("pdto");
UserDTO udto = (UserDTO)request.getAttribute("udto");
	
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
                        <form action="ProductsAppointmentPro.pr" method="post">
                            <h2>예약자 정보확인</h2>
                            <br>
                            <li><i class="icon_check"></i>예약자명 : <input type="text" name="uname" value="<%=udto.getUname()%>" readonly></li>
                            <li><i class="icon_check"></i>전화번호 : <input type="text" name="tel" value="<%=udto.getTel()%>" readonly></li>
                            <li><i class="icon_check"></i>이메일 : <input type="text" name="email" value="<%=udto.getEmail()%>" readonly><br></li>
                            <br>
                            <h2>예약정보 입력</h2>
							<br>
							<input type="hidden" name="no" value="<%=udto.getNo()%>">
							<input type="hidden" name="pno" value="<%=pdto.getPno()%>">
			
							<li><i class="icon_check"></i>펜션이름 : <input type="text" name="pname" value="<%=pdto.getPname()%>" readonly></li>
							<li><i class="icon_check"></i>숙박료 : <input type="text" name="price" value="<%=pdto.getPprice()%>원" readonly></li>
							<li><i class="icon_check"></i>입실일 : <input type="date" name="indate"></li>
							<li><i class="icon_check"></i>퇴실일 : <input type="date" name="outdate"></li>
							
				
							<br>
							<li><i class="icon_check"></i><button type="submit"> 예약하기</button></li>
							</form>
                            </ul>
                    </div>
                </div>
            </div>

<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->
</body>
</html>
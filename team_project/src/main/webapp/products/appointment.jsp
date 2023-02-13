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



    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        
<!-- 검색기능 넣기 -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog-section blog-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    
                        <div class="bi-text">
                        	<div class="blog-item set-bg" data-setbg="img/blog/blog-1.jpg"></div>
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="./blog-details.html">Tremblant In Canada</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                        
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="load-more">
                        <a href="#" class="primary-btn">Load More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->


    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
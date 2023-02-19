<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />



<!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        
<!-- 검색기능 넣기 -->
<%-- <jsp:include page="a.jsp" /> --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<!-- 펜션 정보 리스트 -->
<jsp:include page="maindetail.jsp" />

    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
<!--     <section class="blog-section spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="section-title"> -->
<!--                         <span>Hotel News</span> -->
<!--                         <h2>Our Blog & Event</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-4"> -->
<!--                     <div class="blog-item set-bg" data-setbg="../img/blog/blog-1.jpg"> -->
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Travel Trip</span> -->
<!--                             <h4><a href="#">Tremblant In Canada</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!-- 			</div> -->
<!--       	</div> -->
<!--     </section>           -->
                
    <!-- Blog Section End -->
    



     

<%-- <jsp:include page="../inc/footer.jsp" /> --%>
</div>
</body>
</html>
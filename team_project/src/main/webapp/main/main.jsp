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
  <!-- ##### Book Now Area Start ##### -->

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10">
                    <div class="book-now-form">
                        <form action="#">
                            <!-- Form Group -->
                            <div class="form-group">
                                
                                 <label for="date-in">입실일</label>
                                <input type="text" class="date-input" id="date-in" readonly>
                                                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select2">퇴실일</label>
                                <input type="text" class="date-input" id="date-in" readonly>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select3">인원 수</label>
                                <select class="form-control" id="select3">
                                  <option>1명</option>
                                  <option>2명</option>
                                  <option>3명</option>
                                  <option>4명</option>
                                  <option>5명</option>
                                  <option>6명</option>
                                  <option>7명</option>
                                  <option>8명</option>
                                  <option>9명</option>
                                </select>
                            </div>

                            <!-- Form Group -->
                            <div class="form-group">
                                <label for="select4">지역</label>
                                <select class="form-control" id="select4">
                                  <option>서귀포시</option>
                                  <option>제주시</option>
                                </select>
                            </div>

                            <!-- Button -->
                            <button type="submit">Book Now</button>
                        </form>
                    </div>
                </div>
            </div>
    <!-- ##### Book Now Area End ##### -->


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
                        	<div class="blog-item set-bg" data-setbg="../img/blog/blog-1.jpg"></div>
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="../blog-details.html">Tremblant In Canada</a></h4>
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
    



<!--     Js Plugins -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/jquery.slicknav.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/main.js"></script>

<jsp:include page="../inc/footer.jsp" />
</div>
</body>
</html>
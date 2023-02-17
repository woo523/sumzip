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
    <div class="hotel_booking_table">
        <div class="col-md-3">
            <h2>Book<br> Your Room</h2>
        </div>
        <div class="col-md-9">
            <div class="boking_table">
                <div class="row">
                    <div class="col-md-4">
                        <div class="book_tabel_item">
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker11'>
                                    <input type='text' class="form-control" placeholder="Arrival Date"/>
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker1'>
                                    <input type='text' class="form-control" placeholder="Departure Date"/>
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="book_tabel_item">
                            <div class="input-group">
                                <select class="wide">
                                    <option data-display="인원수">인원수</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <select class="wide">
                                    <option data-display="지역">지역</option>
                                    <option value="서귀포시">서귀포시</option>
                                    <option value="제주시">제주시</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="book_tabel_item">
                             <a class="book_now_btn button_hover" href="#">검색</a>
                        </div>
                    </div>
                </div>
            </div>
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
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Hotel News</span>
                        <h2>Our Blog & Event</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog-item set-bg" data-setbg="img/blog/blog-1.jpg">
                        <div class="bi-text">
                            <span class="b-tag">Travel Trip</span>
                            <h4><a href="#">Tremblant In Canada</a></h4>
                            <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                        </div>
                    </div>
                </div>
			</div>
      	</div>
    </section>          
                
    <!-- Blog Section End -->
    



     

<%-- <jsp:include page="../inc/footer.jsp" /> --%>
</div>
</body>
</html>
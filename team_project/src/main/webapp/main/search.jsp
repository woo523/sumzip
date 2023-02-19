<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../css1/bootstrap.css">
        <link rel="stylesheet" href="../vendors/linericon/style.css">
        <link rel="stylesheet" href="../css1/font-awesome.min.css">
        <link rel="stylesheet" href="../vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="../vendors/nice-select/css/nice-select.css">
        <!-- main css -->
        <link rel="stylesheet" href="../css1/style.css">

</head>
<body>
<!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        
<!-- 						검색기능                         -->
                         <!--================Banner Area =================-->
       
            <div class="hotel_booking_area position">
                <div class="container">
                    <div class="hotel_booking_table">
                        <div class="col-md-3">
                            <h2>펜션<br> 검색하기</h2>
                        </div>
                        <div class="col-md-9">
                            <div class="boking_table">
                                <div class="row">
                                    <div class="col-md-4">
                                    	<form action="result.jsp" method="post">
                                    	<div class="book_tabel_item">
                                            <div class="form-group">
                                                <div class='input-group date' id='datetimepicker11'>
                                                    <input type='text' name="indate" class="form-control" placeholder="입실일"/>
                                                    <span class="input-group-addon">
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class='input-group date' id='datetimepicker1'>
                                                    <input type='text' name="outdate" class="form-control" placeholder="퇴실일"/>
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
                                                <select class="wide" name="guest">
                                                    <option data-display="인원 수">인원 수 선택</option>
                                                    <option value="1">1명</option>
                                                    <option value="2">2명</option>
                                                    <option value="3">3명</option>
                                                    <option value="4">4명</option>
                                                    <option value="5">5명</option>
                                                    <option value="6">6명</option>
                                                    <option value="7">7명</option>
                                                    <option value="8">8명</option>
                                                    <option value="9">9명</option>
                                                </select>
                                            </div>
                                            <div class="input-group">
                                                <select class="wide" name="region">
                                                    <option data-display="지역">지역 선택</option>
                                                    <option value="서귀포시">서귀포시</option>
                                                    <option value="제주시">제주시</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                      <input type="submit" class="book_now_btn button_hover" value="검색">
                                    </form>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!--================Banner Area =================-->     
       
                    </div>
                </div>
            </div>
        </div>
    </div>
     
<!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="../js1/jquery-3.2.1.min.js"></script>
        <script src="../js1/popper.js"></script>
        <script src="../js1/bootstrap.min.js"></script>
        <script src="../vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="../js1/jquery.ajaxchimp.min.js"></script>
        <script src="../js1/mail-script.js"></script>
        <script src="../vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="../vendors/nice-select/js/jquery.nice-select.js"></script>
        <script src="../js1/mail-script.js"></script>
        <script src="../js1/stellar.js"></script>
        <script src="../vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="../js1/custom.js"></script>
</body>
</html>
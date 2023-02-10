<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>review.JSP</title>
	<meta charset="UTF-8">
	
	<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
	
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	
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
	
	<script type="text/javascript">
		// 별점 마킹 모듈 프로토타입으로 생성
		function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
			// 별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
			this.rate = newrate;	// 선택한 별점 값을 저장하는 변수
			let items = document.querySelectorAll('.rate_radio');
			items.forEach(function(item, idx) {
				if(idx < newrate) {
					item.checked = true;
				} else {
					item.checked = false;
				}
			});
		}
		
		let rating = new Rating();	// 별점 인스턴스 생성
		
		document.addEventListener('DOMContentLoaded', function(){
			// 별점선택 이벤트 리스너
			// 별 이미지를 클릭하면 setRate() 메서드 호출
			document.querySelector('.star_rating').addEventListener('click', function(e) {
				let elem = e.target;
				if(elem.classList.contains('rate_radio')) {
					rating.setRate(parseInt(elem.value));
				}
			});
		});
		
		// 후기 작성 글자수 초과 체크 이벤트 리스너 (해결중)
	// 	document.querySelector('#review_textarea').addEventListener('keydown', function() {
	// 		// 리뷰 400자 초과 안되게 자동 자름
	// 		let review = document.querySelector('#review_textarea');
	// 		let lengthCheck = /^.{10,}$/;
	// 		if(lengthCheck.test(review.value)){
	// 			// 400자 초과 컷
	// 			review.value = review.value.substr(0,10);
	// 		}
	// 	});
		
	
		function formCheck() {
			// submit 버튼을 누르면 onsubmit에 의해 formCheck() 함수 호출
			if(document.querySelector('.title').value.length == 0) {
				alert("제목을 입력하세요");
				document.reviewForm.title.focus();
			}
			// 별점 선택 안했으면 메시지 표시, 체크된 값을 배열 형태로 받아서 length 확인
			if(document.querySelectorAll('input[name="rating"]:checked').length==0) {
				alert("만족도를 선택해주세요.");
				return false;
			}
			// 리뷰 5자 미만이면 메시지 표시
			if(document.querySelector('#review_textarea').value.length < 5) {
				alert(" 5자 이상으로 작성해 주세요.");
				document.reviewForm.content.focus();
				return false;
			}
			// 작성 여부 확인
			if(!confirm("작성하시겠습니까?")) {
				return false;	// 폼 전송 X
			} else 
				return true;	// 폼 전송
			
		}
	</script>
</head>

<body>
<!-- 리뷰 작성 페이지 -->
<%
// 	String id = (String)session.getAttribute("id");
	// 아이디 없으면 로그인 페이지로 이동
// 	if(id == null) {
		%>
<!-- 		<script type="text/javascript"> -->
<!--   			alert("로그인을 해주세요"); -->
<!-- 		</script> -->
		<%
// 		response.sendRedirect("login.jsp");
// 	}
%>
<div class="container">
	<!-- 헤더 들어가는 곳 -->
<%-- 	<jsp:include page="../inc/head.jsp" /> --%>

	    <!-- Page Preloder -->
	    <div id="preloder">
	        <div class="loader"></div>
	    </div>
	
	    <!-- Offcanvas Menu Section Begin -->
	    <div class="offcanvas-menu-overlay"></div>
	    <div class="canvas-open">
	        <i class="icon_menu"></i>
	    </div>
	    <div class="offcanvas-menu-wrapper">
	        <div class="canvas-close">
	            <i class="icon_close"></i>
	        </div>
	        <div class="search-icon search-switch">
	            <i class="icon_search"></i>
	        </div>
	        <div class="header-configure-area">
	            <div class="language-option">
	                <img src="img/flag.jpg" alt="">
	                <span>EN <i class="fa fa-angle-down"></i></span>
	                <div class="flag-dropdown">
	                    <ul>
	                        <li><a href="#">Zi</a></li>
	                        <li><a href="#">Fr</a></li>
	                    </ul>
	                </div>
	            </div>
	            <a href="#" class="bk-btn">Booking Now</a>
	        </div>
	        <nav class="mainmenu mobile-menu">
	            <ul>
	                <li class="active"><a href="./index.html">Home</a></li>
	                <li><a href="./rooms.html">Rooms</a></li>
	                <li><a href="./about-us.html">About Us</a></li>
	                <li><a href="./pages.html">Pages</a>
	                    <ul class="dropdown">
	                        <li><a href="./room-details.html">Room Details</a></li>
	                        <li><a href="./blog-details.html">Blog Details</a></li>
	                        <li><a href="#">Family Room</a></li>
	                        <li><a href="#">Premium Room</a></li>
	                    </ul>
	                </li>
	                <li><a href="./blog.html">News</a></li>
	                <li><a href="./contact.html">Contact</a></li>
	            </ul>
	        </nav>
	        <div id="mobile-menu-wrap"></div>
	        <div class="top-social">
	            <a href="#"><i class="fa fa-facebook"></i></a>
	            <a href="#"><i class="fa fa-twitter"></i></a>
	            <a href="#"><i class="fa fa-tripadvisor"></i></a>
	            <a href="#"><i class="fa fa-instagram"></i></a>
	        </div>
	        <ul class="top-widget">
	            <li><i class="fa fa-phone"></i> (12) 345 67890</li>
	            <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
	        </ul>
	    </div>
	    <!-- Offcanvas Menu Section End -->
	
	    <!-- Header Section Begin -->
	    <header class="header-section">
	        <div class="top-nav">
	            <div class="container">
	                <div class="row">
	                    <div class="col-lg-6">
	                        <ul class="tn-left">
	                            <li><i class="fa fa-phone"></i> (12) 345 67890</li>
	                            <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
	                        </ul>
	                    </div>
	                    <div class="col-lg-6">
	                        <div class="tn-right">
	                            <div class="top-social">
	                                <a href="#"><i class="fa fa-facebook"></i></a>
	                                <a href="#"><i class="fa fa-twitter"></i></a>
	                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
	                                <a href="#"><i class="fa fa-instagram"></i></a>
	                            </div>
	                            <a href="#" class="bk-btn">Booking Now</a>
	                            <div class="language-option">
	                                <img src="img/flag.jpg" alt="">
	                                <span>EN <i class="fa fa-angle-down"></i></span>
	                                <div class="flag-dropdown">
	                                    <ul>
	                                        <li><a href="#">Zi</a></li>
	                                        <li><a href="#">Fr</a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="menu-item">
	            <div class="container">
	                <div class="row">
	                    <div class="col-lg-2">
	                        <div class="logo">
	                            <a href="./index.html">
	                                <img src="img/logo.png" alt="">
	                            </a>
	                        </div>
	                    </div>
	                    <div class="col-lg-10">
	                        <div class="nav-menu">
	                            <nav class="mainmenu">
	                                <ul>
	                                    <li><a href="./index.html">Home</a></li>
	                                    <li><a href="./rooms.html">Rooms</a></li>
	                                    <li><a href="./about-us.html">About Us</a></li>
	                                    <li><a href="./pages.html">Pages</a>
	                                        <ul class="dropdown">
	                                            <li><a href="./room-details.html">Room Details</a></li>
	                                            <li><a href="./blog-details.html">Blog Details</a></li>
	                                            <li><a href="#">Family Room</a></li>
	                                            <li><a href="#">Premium Room</a></li>
	                                        </ul>
	                                    </li>
	                                    <li class="active"><a href="./blog.html">News</a></li>
	                                    <li><a href="./contact.html">Contact</a></li>
	                                </ul>
	                            </nav>
	                            <div class="nav-right search-switch">
	                                <i class="icon_search"></i>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </header>
	    <!-- Header End -->
	
	<article>
	<!-- 펜션 정보 가져오는 곳..?-->
		
	<form name="reviewForm" action="reviewPro.jsp" id="reviewForm" method ="post" onsubmit="return formCheck()">
		<div>
		글제목 : <input type="text" name="title" class="title">
		</div>
		
		<!-- 별점 -->
		<div id="reviewStars">
			<h3>??? 만족하셨나요?</h3>
			
			<div class="star_rating">
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
				<label for="rating1"></label>
				<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
				<label for="rating2"></label>
				<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점">
				<label for="rating3"></label>
				<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
				<label for="rating4"></label>
				<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
				<label for="rating5"></label>
			</div>
		</div>
		
		<!-- 	후기를 남겨주세요 -->
		<div class="review_contents">
			<h3>후기를 남겨주세요.</h3>
			<textarea name="content" id="review_textarea" rows="10" cols="30" 
					  placeholder="후기를 남겨주세요! 사장님께 큰 도움이 됩니다."></textarea>
		</div>
			
		<p>
			<button type="button" name="rpic1"> 사진 첨부1 </button>
			<button type="button" name="rpic2"> 사진 첨부2 </button>
			<button type="button" name="rpic3"> 사진 첨부3 </button>
		</p>
		
		<div id="Buttons">
			<input type="reset" value="취소" class="cancelButton" id="cancel" >
			<input type="submit" value="작성하기" class="submitButton" id="submit">
		</div>
		
	</form>
	</article>
	
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<style>
	.container{
		max-width: 480px;
		margin: 0 auto;
		background-color: #fff;
		height: 100%;
		padding: 20px;
		box-sizing: border-box;
	}
	
	#reviewForm textarea{
		width: 100%;
		padding: 10px;
		box-sizing: border-box;
	}
	
	.star_rating .rate_radio {
		position: relative;
		display: inline-block;
		z-index: 20;
		opacity: 0.001;
		width: 60px;
		height: 60px;
		background-color: #fff;
		cursor: pointer;
		vertical-align: top;
		display: none;
	}
	
	.star_rating .rate_radio + label {
		position: relative;
		display: inline-block;
		margin-left: -4px;
		z-index: 10;
		width: 60px;
		height: 60px;
		background-image: url('../img/starrate.png');
		background-repeat: no-repeat;
		background-size: 60px 60px;
		cursor: pointer;
		background-color: #f0f0f0;
	}
	
	.star_rating .rate_radio:checked + label {
		background-color: #FCC419;
	}
	
</style>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/admain.css" type="text/css" >
<title>Insert title here</title>
</head>
<body>


<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/ad_header.jsp" />
<!-- 헤더들어가는 곳 -->
		
<!-- Backgrounds -->
<div class="menu-item">
	<div class="container">
    	<div class="row">
        	<div class="col-lg-2">
				<div class="sidenav">		
					<button class="dropdown-btn">Q&A <i class="fa fa-caret-down"></i>
					</button>
				<div class="dropdown-container">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a> 
				</div>
					<button class="dropdown-btn">공지사항 <i class="fa fa-caret-down"></i>
					</button>
				<div class="dropdown-container">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
				</div> 
					<a href="AdminAppointNow.ad">숙소예약현황</a> 
					<a href="AdminUserList.ad">유저관리</a>
					<button class="dropdown-btn">기타 <i class="fa fa-caret-down"></i>
					</button>
				<div class="dropdown-container">
					<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
				</div>	
				</div>
			</div>
			
			<div class="col-lg-10">
				<div class="content-main">
				<h1>Admin Page</h1>	
				</div>
			</div>
		</div>
	</div>	
</div>
		
<script>

var dropdown = document.getElementsByClassName("dropdown-btn");
var i;
for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>
	
</body>
</html>
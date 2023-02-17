<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* Fixed sidenav, full height */
.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #00B72E;
	overflow-x: hidden;
	padding-top: 20px;
	margin-top: 26px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 20px;
	color: #CAF0D3;
	display: block;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #f1f1f1;
}

/* Main content */
.main {
	margin-left: 200px; /* Same as the width of the sidenav */
	font-size: 20px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

/* Add an active class to the active dropdown button */
.active {
	background-color: green;
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: #262626;
	padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}
</style>


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
		
			<button class="dropdown-btn">
				Q&A <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a> 
			</div>
			<button class="dropdown-btn">
				공지사항 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
			</div> 
			<a href="#clients">숙소예약현황</a> 
			<a href="AdminUserList.ad">유저관리</a>
			<button class="dropdown-btn">
				기타 <i class="fa fa-caret-down"></i>
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
		
<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
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
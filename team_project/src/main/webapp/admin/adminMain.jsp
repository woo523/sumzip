<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#sidebar {
	width: 250px;
	height: 1000px;
	/*  	background-color: #98FD5D;  */
	float: left;
}

/* Fixed sidenav, full height */
.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 20px;
	color: #818181;
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
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<%-- 		<jsp:include page="../inc/header.jsp" /> --%>
		<!-- 헤더들어가는 곳 -->

		<div class="sidenav">
		
			<a href="#about">Q&A</a> <a href="#services">공지사항</a> <a
				href="#clients">숙소예약현황</a> <a href="#contact">유저관리</a>
			<button class="dropdown-btn">
				Dropdown <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="#">Link 1</a> <a href="#">Link 2</a> <a href="#">Link 3</a>
			</div>
			<a href="#contact">Search</a>
			
		</div>
		
		<nav id="sidebar">
<!-- 			<ul> -->
<!-- 				<li><a href="MemberMyPage_user.me">내 정보 조회</a></li> -->
<!-- 				<li><a href="MemberMyList.me">내 이용목록</a></li> -->
<!-- 				<li><a href="../products/appointManage.jsp">예약관리</a></li> -->
<!-- 				<li><a href="#">찜 목록</a></li> -->
<!-- 				<li><a href="deleteForm.jsp">회원탈퇴</a></li> -->
<!-- 			</ul> -->
		</nav>
		
		
	</div>



		<div class="content-main">
			<div class="row">
				<div class="col-sm-9">
					<h1>Admin Page</h1>

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
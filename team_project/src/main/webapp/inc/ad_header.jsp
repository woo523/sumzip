<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>섬집</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
    
    
    
    
    <link rel="stylesheet" href="../css1/bootstrap.css">
    <link rel="stylesheet" href="../vendors/linericon/style.css">
    <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="../vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="../vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="../css1/font-awesome.min.css">
    <link rel="stylesheet" href="../css1/styles.css">
    <link rel="stylesheet" href="../css1/style.css">
    <link rel="stylesheet" href="../css1/responsive.css">
    
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
    
     <script src="../js1/jquery-3.3.1.min.js"></script>
    <script src="../js1/bootstrap.min.js"></script>
    <script src="../js1/jquery.magnific-popup.min.js"></script>
    <script src="../js1/jquery.nice-select.min.js"></script>
    <script src="../js1/jquery-ui.min.js"></script>
    <script src="../js1/jquery.slicknav.js"></script>
    <script src="../js1/owl.carousel.min.js"></script>
    <script src="../js1/main.js"></script>
    <script src="../js1/jquery-3.2.1.min.js"></script>
    <script src="../js1/popper.js"></script>
    <script src="../js1/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<header class="header-section">
	<div class="top-nav">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="tn-left">
                        </ul>
                    </div>
                    <div class="col-lg-6">
                        <div class="tn-right">
                        	<%
                           		String id=(String)session.getAttribute("id");
                            	UserDAO dao = new UserDAO();
                        		// MemberDTO dto = getMember(id) 메서드호출
                        		UserDTO dto = dao.getUser(id);
                        		if(id!=null){
									%>
									<div id="login">♥<%=id %> 님♥ |
									<a href="logout.jsp">Logout</a>	|
									<a href="user.jsp">Mypage</a></div>	
								  <%
								}else{
									%>
									<div id="login">
									<a href="login.jsp">Login</a>
									</div>	
									<%
								}
							%>
										
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
                            
                            
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            
                            <div class="nav-right search-switch">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>
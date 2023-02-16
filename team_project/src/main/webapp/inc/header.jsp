<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

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
									if(dto.getUtype()==1){
									%>
										<div id="login">♥<%=id %> 님♥ |
										<a href="../member/logout.jsp">Logout</a>	|
										<a href="../member/myPage_user.jsp">Mypage</a></div>
										<% 
									}else if(dto.getUtype()==2){
										%>
										<div id="login">♥<%=id %> 님♥ |
										<a href="../member/logout.jsp">Logout</a>	|
										<a href="../member/myPage_owner.jsp">Mypage</a></div>
										<%
									}
									%>
								 <%
								}else{
									%>
									<div id="login"><a href="MemberLogin.me">Login</a> |
													<a href="../member/agree.jsp">Join</a></div>	
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
                            <a href="../index.jsp">
                                <img src="../img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul> 
                                    <li><a href="#">지역별 조회</a></li>
                                    <li><a href="#">테마별 조회</a></li>
                                    <li><a href="#">추천 펜션</a></li>
                                    <li><a href="BoardList.bo">공지사항</a></li>
                                    <li><a href="../qna/qnaList.jsp">Q&A</a></li>
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



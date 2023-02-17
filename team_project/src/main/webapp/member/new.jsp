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
    <link rel="stylesheet" href="css/table.css" type="text/css">
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
    
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    

<script type="text/javascript">
 
$(document).ready(function(){
	$('#join').submit(function(){
	if($('.id').val()==""){
		alert("아이디를 입력하세요.");
		$('.id').focus();
		return false;
	}
	if($('.pass').val()==""){
		alert("비밀번호를 입력하세요.");
		$('.pass').focus();
		return false;
	}
	if($('.pass2').val()==""){
		alert("비밀번호를 입력하세요.");
		$('.pass2').focus();
		return false;
	}
	if($('.pass').val() != $('.pass2').val()){
		alert("비밀번호가 일치하지 않습니다.");
		$('.pass2').focus();
		return false;
	}
	if ( ! (document.joinform.pass.value.length >= 8 && document.joinform.pass.value.length <= 16)) {
			alert("비밀번호 8 ~ 16자 사이로 입력해주세요");
			document.joinform.pass.focus();
			return false;
		}
	if($('.uname').val()==""){
		alert("이름을 입력하세요.");
		$('.uname').focus();
		return false;
	}
	if($('.birth').val()==""){
		alert("생년월일을 입력하세요.");
		$('.birth').focus();
		return false;
	}
	if($('.email').val()==""){
		alert("이메일을 입력하세요.");
		$('.email').focus();
		return false;
	}
	if($('.tel').val()==""){
		alert("전화번호를 입력하세요.");
		$('.tel').focus();
		return false;
	}
	if($('.address').val()==""){
		alert("주소를 입력하세요.");
		$('.address').focus();
		return false;
	}
		}); //
	$('.dup').click(function(){
//		alert("클릭");
		if($('.id').val()==""){
			alert("아이디 입력하세요");
			$('.id').focus();
			return false;
		}
	$.ajax({
		url:'idCheck.jsp',
		data:{'id':$('.id').val()},
		success:function(result){
			if(result.trim()=="중복확인"){
				$('.divresult').html(result).css("color","red");	
			}else{
				$('.divresult').html(result).css("color","green");	
			}			
		}
	});
	}); 
		
 }); //준비
 </script>
 
 <!-- 주소값 api -->
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
    
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<style>
.fpmgBt1{background-color: #bbb;color:#FFFFFF; font-weight: bold; border-width: 0px;}
.fpmgBt2{background-color: #119208;color: #FFFFFF; font-weight: bold; border-width: 0px;}
</style>
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
										<a href="MemberLogout.me">Logout</a>	|
										<a href="MemberMyPage_user.me">Mypage</a></div>
										<% 
									}else if(dto.getUtype()==2){
										%>
										<div id="login">♥<%=id %> 님♥ |
										<a href="MemberLogout.me">Logout</a>	|
										<a href="MemberMyPage_owner.me">Mypage</a></div>
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
                            <a href="Main.me">
                                <img src="img/logo.png" alt="">
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
                                    <li><a href="QnaList.qa">Q&A</a></li>
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
</body>
</html>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<%-- <jsp:include page="../inc/header.jsp" /> --%>
<!-- 헤더들어가는 곳 -->
	<article>
		<form action="joinPro.jsp" method="post" id="join" name="joinform">
		    <table width="800">
		        <tr height="40">
		            <td align="center"><b>[회원가입]</b></td>
		        </tr>
		    </table>    
		    <table width="700" height="600" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
		    	<tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">회원구분</td>
		            <td>
		                일반회원<input type="radio" name="utype" value="1" checked />&nbsp;사장님<input type="radio" name="utype" value="2"/>
		            </td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">회원 ID</td>
		            <td><input type="text" name="id" class="id"/>&nbsp;<input type="button" value="중복확인" class="dup"></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">비밀번호</td>
		            <td><input type="password" name="pass" class="pass"/></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">비밀번호 확인</td>
		            <td><input type="password" name="pass2" class="pass2"/></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">이 름</td>
		            <td><input type="text" name="uame" class="uname"/></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">성 별</td>
		            <td>
		            	<select name="gender">
							<option value="남">남</option>
							<option value="여">여</option>
							<option value="선택안함">선택안함</option>
						</select>
		            </td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">생년월일</td>
		            <td><input type="date" name="birth" class="birth"/></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">이메일</td>
		            <td><input type="email" name="email" class="email"/></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        <tr class="register" height="30">
		            <td width="5%" align="center">*</td>
		            <td width="15%">휴대전화</td>
		            <td><input type="tel" name="tel" class=""/></td>
		        </tr>
		        <tr height="7">
		            <td colspan="3"><hr /></td>
		        </tr>
		        
		        <tr>
		            <td width="5%" align="center">*</td>
		            <td width="15%">주 소</td>
		            <td>
		                <input type="text" size="10" id="sample4_postcode" name="postnum" placeholder="우편번호" readonly="readonly" >
		                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br><br />
		                <input type="text" id="sample4_roadAddress"  size="30" name="address1" class="address1" placeholder="도로명주소" readonly="readonly">
		                <br /><span id="guide" style="color:#999;font-size:10px;"></span>   
		                <br /><br /><input type="text" id="sample4_detailAddress" name="address2" class="address2"  placeholder="상세주소" size="70" />
		            </td>
		        </tr>
		
		    </table>
		    <br />
		    <table>
		        <tr height="40">
		            <td>
			            <input type="submit" value="가입하기" class="fpmgBt2" onclick="fun1()"> 
						<input type="reset" value="초기화하기" class="fpmgBt1">
						
		            </td>
		        </tr>
		    </table>
		    
		</form>
	</article>
</div>
</body>
</html>
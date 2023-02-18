<%@page import="member.ReviewDTO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>
<%@page import="member.ReviewDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>myList.JSP</title>
<style type="text/css">
  	#myList {
 		font-family: 'NanumSquareNeo';
		max-width: 750px;
		height: 1000px;
		margin: 0 auto;
		height: 100%;
		padding: 20px;
		box-sizing: border-box;
 	}
 	
 	#myList h3 {
 		font-family: 'NanumSquareNeoBold';
		margin: 10px;
 	}
 	
 	#myList h5 {
 		font-family: 'NanumSquareNeoBold';
		margin: 10px;
 	}
 	
 	#myList ul {
 		margin: 30px 0px 30px 0px;
 	}
 	
 	#myList ul li {
 		list-style: none;
 	}
 	
 	#myList #timecheck {
 		margin: 0px 20px 10px 0px;
 		color : black;
        display: inline-block;
 	}
 	
 	#myList ul button {
 		margin-top: 10px;
 		display: inline-block;
 	}
</style>
</head>

<body>
<%
	// 아이디 세션 값
	String id = (String)session.getAttribute("id");
	
	// 예약정보
	ArrayList<AppointmentDTO> userappointmentlist = (ArrayList<AppointmentDTO>)request.getAttribute("userappointmentlist");
	
	// 체크인 / 체크아웃 날짜
	Date appointIndate = (Date)request.getAttribute("appointIndate");
	Date appointOutdate = (Date)request.getAttribute("appointOutdate");
	Date today = (Date)request.getAttribute("today");
	
	// 페이징
	int currentPage = (Integer)request.getAttribute("currentPage");
	int startPage = (Integer)request.getAttribute("startPage");
	int pageBlock = (Integer)request.getAttribute("pageBlock");
	int endPage = (Integer)request.getAttribute("endPage");
	int pageCount = (Integer)request.getAttribute("pageCount");
%>
<!-- header -->
<jsp:include page="../inc/header.jsp" />

<form name="myListForm" action="" id="myList" method="get">
	<h3>내 이용 내역</h3>
	<% 
	for(int i = 0 ; i < userappointmentlist.size(); i++){
		// 예약정보
		AppointmentDTO adto = userappointmentlist.get(i);
		
		// 펜션정보 => 펜션 이름, 체크인/체크아웃 시간
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(adto.getPno());
		
	%>
	<ul>
		<li>예약일자 : <%=adto.getAdate() %></li>
		<h5><%=pdto.getPname() %></h5>
		<li id="timecheck">체크인 appointIndate <%=pdto.getCheckin() %>:00</li>
		<li id="timecheck">체크아웃 appointOutdate <%=pdto.getCheckout() %>:00</li>

		<!-- 후기 작성 여부 확인 후 버튼 활성화 -->
		<%			
		ReviewDAO rdao = new ReviewDAO();
		
		System.out.println(appointIndate);
		System.out.println(appointOutdate);
		System.out.println(today);
		
		int resultIn = appointIndate.compareTo(today);
		int resultOut = appointOutdate.compareTo(today);
		
		if(id != null) {
			// 후기 작성 여부 확인
			if(rdao.checkReview(adto.getAno()) == true) {
				// 입실일이 지나면 예약완료 상태로 갈음
				if(resultIn < 0) {
					System.out.println("appointIndate is before today");
					
					if(resultOut > 0) {
						// 퇴실일 지나기전 후기 작성 불가
						System.out.println("appointOutdate is after today");
					} else if(resultOut <= 0){
						// 후기 작성 가능
						System.out.println("appointOutdate is before today");
						%>
						<li><button type="button" class="btn btn-outline-success" onclick="location.href='MemberReviewModifyForm.me?ano=<%=adto.getAno()%>'">후기 수정하기</button>
							<button type="button" class="btn btn-outline-secondary" onclick="location.href='MemberReviewDelete.me?ano=<%=adto.getAno()%>'">후기 삭제하기</button></li>
						<%
					}
				}
			} else {
				// rdao.checkReview(no, adto.getPno()) == false
				if(resultIn < 0) {
					System.out.println("appointIndate is before today");
					
					if(resultOut > 0) {
						// 퇴실일 지나기전 후기 작성 불가
						System.out.println("appointOutdate is after today");
					} else if(resultOut <= 0){
						// 후기 작성 가능
						System.out.println("appointOutdate is before today");
						%>
						<li><button type="button" id="reviewBtn" class="btn btn-outline-success" onclick="location.href='MemberReview.me?ano=<%=adto.getAno()%>&pno=<%=adto.getPno()%>'">이용 후기 작성하기</button></li>
						<%
					}
				}
			} // rdao.checkReview(no, adto.getPno()) 
		} else {
			%>
 			<script type="text/javascript">
   				alert("로그인을 해주세요");
 			</script>
			<%
			response.sendRedirect("login.jsp");
		} %>
	</ul> <% // id 확인 메서드
	
	} // userappointmentlist
%>
	
</form>


<!-- footer -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>

</body>
</html>
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

	// 유저정보 no 값
	UserDAO udao = new UserDAO();
	UserDTO udto = udao.getUser(id);
	int no = udto.getNo();
	
	// 판매정보 => 입실일 / 퇴실일
	SalesDAO salesdao = new SalesDAO();
	SalesDTO salesdto = salesdao.getSales(no);

%>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
	
	<form name="myListForm" action="" id="myList" method="get">
		<h3>내 이용 내역</h3>
		
		<%  
		AppointmentDAO adao = new AppointmentDAO();
		ArrayList<AppointmentDTO> userappointmentlist = adao.getUserAppointmentList(no);
		
		for(int i = 0 ; i < userappointmentlist.size(); i++){
			AppointmentDTO adto = userappointmentlist.get(i);
			
			ProductDAO pdao = new ProductDAO();
			ProductDTO pdto = pdao.getProduct(adto.getPno());
		%>
		<ul>
			<li>예약일자 : <%=adto.getAdate() %></li>
 			<h5><%=pdto.getPname() %></h5>
			<li id="timecheck">체크인 <%=salesdto.getIndate() %> <%=pdto.getCheckin() %>:00</li>
			<li id="timecheck">체크아웃 <%=salesdto.getOutdate() %> <%=pdto.getCheckout() %>:00</li>

			<!-- 후기 작성 여부 확인 후 버튼 활성화 -->
			<%			
			ReviewDAO rdao = new ReviewDAO();
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			Date appointIndate = formatter.parse("2023-02-01"); // 임시 체크인 날짜
			// Date appointIndate = salesdto.getIndate();
			Date appointOutdate = formatter.parse("2023-02-05"); // 임시 체크아웃 날짜
			// Date appointOutdate = salesdto.getOutdate();
			Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
			
			System.out.println("appointIndate: " + formatter.format(appointIndate));
			System.out.println("appointOutdate: " + formatter.format(appointOutdate));
			System.out.println("today : " + formatter.format(today));
			
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
							<li><button type="button" class="btn btn-outline-success" onclick="location.href='reviewModify.jsp?ano=<%=adto.getAno()%>'">후기 수정하기</button>
								<button type="button" class="btn btn-outline-secondary" onclick="location.href='reviewDelete.jsp?ano=<%=adto.getAno()%>'">후기 삭제하기</button></li>
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
							<li><button type="button" id="reviewBtn" class="btn btn-outline-success" onclick="location.href='MemberReview.me?ano=<%=adto.getAno() %>'">이용 후기 작성하기</button></li>
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
			} // id 확인 메서드
		} // userappointmentlist
	%>
		</ul>
	</form>

	
	<!-- footer -->
<%-- 	<jsp:include page="../inc/footer.jsp" /> --%>
	
</body>
</html>
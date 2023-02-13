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
	
	// 판매정보 => 퇴실일
	SalesDAO salesdao = new SalesDAO();
	SalesDTO salesdto = salesdao.getSales(no);
	
	// 후기 작성 여부 확인
	

%>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
		
	<form name="myListForm" action="" id="myList" method="get">
		<h3>내 이용 내역</h3>
		
		<%
	  	if(id != null) {
	  		// 아이디 값 있음
	  		// 예약완료 상태 => 입실일 기준으로 판별
 			// 현재 날짜가 퇴실일보다 이전일 경우 후기 작성 버튼 비활성화
//  			try {
//  				String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
// //  				String outdatefm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(salesdto.getOutdate()));
//  				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
 				
//  				Date appointIndate = formatter.parse("2023-02-15"); // 임시 체크인 날짜
// //  				Date appointIndate = salesdto.getIndate();
//  				Date appointOutdate = formatter.parse("2023-02-17"); // 임시 체크아웃 날짜
//  				Date today = new Date(formatter.parse(todayfm).getTime());
 				
//  				System.out.println("appointIndate: " + formatter.format(appointIndate));
//  				System.out.println("appointOutdate: " + formatter.format(appointOutdate));
//  				System.out.println("today : " + formatter.format(today));
 				
//  				int resultIn = appointIndate.compareTo(today);
//  				int resultOut = appointOutdate.compareTo(today);
 				
//  				if(resultIn < 0) {
//  					// 입실일이 지나면 예약완료 상태로 대신함 = 후기 작성 가능
//  					System.out.println("appointIndate is before today");
//  					if(resultOut > 0) {
//  						// 후기 작성 불가
//  	 					System.out.println("appointOutdate is after today");
//  	 				} else if(resultOut <= 0){
//  	 					// 후기 작성 가능
//  	 					System.out.println("appointOutdate is before today");
 	  					
//  	 				} 
//  				}
 				
//  			} catch(ParseException ex) {
//  				ex.printStackTrace();
//  			}

	 	} else {
			%>
 			<script type="text/javascript">
	   			alert("로그인을 해주세요");
	 		</script>
			<%
			response.sendRedirect("login.jsp");
 		}
		%>
		
		<%  
		AppointmentDAO adao = new AppointmentDAO();
		ArrayList<AppointmentDTO> userappointmentlist = adao.getUserAppointmentList(no);
		for(int i = 0 ; i < userappointmentlist.size(); i++){
			AppointmentDTO adto = userappointmentlist.get(i);
			
			ProductDAO pdao = new ProductDAO();
			ProductDTO pdto = pdao.getProduct(adto.getPno());
		%>
		<ul>
<%-- 		<li>펜션이름 : <%=adto.getPno() %></li> --%>
			<li>펜션이름 : <%=pdto.getPname() %></li>
			<li>숙박일자 : <%=adto.getAdate() %></li>

			<!-- 후기 작성 여부 확인 후 버튼 활성화 -->
			<%			
			ReviewDAO rdao = new ReviewDAO();
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			
			Date appointIndate = formatter.parse("2023-02-15"); // 임시 체크인 날짜
			Date appointOutdate = formatter.parse("2023-02-17"); // 임시 체크아웃 날짜
			Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
			
			System.out.println("appointIndate: " + formatter.format(appointIndate));
			System.out.println("appointOutdate: " + formatter.format(appointOutdate));
			System.out.println("today : " + formatter.format(today));
			
			int resultIn = appointIndate.compareTo(today);
			int resultOut = appointOutdate.compareTo(today);
			
			if(id != null) {
				// 후기 작성 여부 확인
				if(rdao.checkReview(no, adto.getPno()) == true) {
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
							<li><button type="button" onclick="location.href='reviewModify.jsp'">후기 수정하기</button></li>
							<li><button type="button" onclick="location.href='reviewDelete.jsp'">후기 삭제하기</button></li>
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
							<li><button type="button" id="reviewBtn" onclick="location.href='review.jsp'">이용 후기 작성하기</button></li>
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
	<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>
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
// 	SalesDAO salesdao = new SalesDAO();
// 	SalesDTO salesdto = salesdao.getSales(no);

%>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
		
	<form name="myListForm" action="" id="myList" method="get">
		<h3>내 이용 내역</h3>
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>아이디</td>
				<td>글제목</td>
				<td>작성날짜</td>
<!-- 				<td>펜션이름</td> -->
<!-- 				<td>숙박일자</td> -->
			</tr>
		</table>
		<%
// 	  	if(id != null) {
	  		// 아이디 값 있음
 			// 현재 날짜가 퇴실일보다 이전일 경우 후기 작성 버튼 비활성화
 			try {
 				String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
//  				String outdatefm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(salesdto.getOutdate()));
 				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
 				
 				Date appointOutdate = formatter.parse("2023-02-05"); // 임시 체크아웃 날짜
 				Date today = new Date(formatter.parse(todayfm).getTime());
 				
 				System.out.println("appointOutdate: " + formatter.format(appointOutdate));
 				System.out.println("today : " + formatter.format(today));
 				
 				int result = appointOutdate.compareTo(today);
 				
 				if(result > 0) {
 					System.out.println("appointOutdate is after today");
 				} else if(result <= 0){
 					System.out.println("appointOutdate is before today");
  					%>
 					<button type="button" id="reviewBtn" onclick="location.href='review.jsp'">이용 후기 작성하기</button>
  					<%
 				} 
 				
 			} catch(ParseException ex) {
 				ex.printStackTrace();
 			}
			
			// 예약완료 상태가 아닌 경우 후기 작성 버튼 비활성화 (해결중)
			try {
				AppointmentDAO apdao = new AppointmentDAO();
				ArrayList<AppointmentDTO> appointList = apdao.getUserAppointmentList(no);
				
				for(int i = 0; i < appointList.size(); i++) {
					AppointmentDTO apdto = appointList.get(i);
					
					if(apdto.getAstatus() == 4) {
						%>
						<button type="button" id="reviewBtn" onclick="location.href='review.jsp'">이용 후기 작성하기</button>
 						<%
					}
				}
			} catch(Exception e) {
				e.printStackTrace();	
			}

// 	 	} else {
			%>
<!-- 			<script type="text/javascript">
	   			alert("로그인을 해주세요");
	 		</script> -->
			<%
// 			response.sendRedirect("login.jsp");
//  		}
		%>
		<!-- 후기 작성했으면 버튼 활성화 -->
		<button type="button" onclick="location.href='reviewModify.jsp'">후기 수정하기</button>
		<button type="button" onclick="location.href='reviewDelete.jsp'">후기 삭제하기</button>
	</form>
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>
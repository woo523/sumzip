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
	
// 	// 판매정보 => 펜션정보 & 퇴실일
// 	SalesDAO salesdao = new SalesDAO();
// 	SalesDTO salesdto = new SalesDTO();
// 	SalesDTO salesdto = salesdao.getSales(no);	

%>
	<!-- header -->
	<jsp:include page="../inc/header.jsp" />
		
	<form name="myListForm" action="" id="myList" method="get">
		<h3>내 이용 내역</h3>
		<table border="1">
			<tr>
				<td>펜션이름</td>
				<td>숙박일자</td>
			</tr>
		</table>
		<%
		String id = (String)session.getAttribute("id");
		
	  	if(id == null) {
 		// 아이디 값이 없으면 후기 작성 버튼 비활성화
 		%>
 		<script>
  			function buttonHide() {
   				document.getElementById("reviewBtn").style.display="none";
   			}
  		</script>
 		<%
	 	} else {
			// 아이디 값 있음
			// 현재 날짜가 퇴실일보다 이전일 경우, 예약완료 상태가 아닌 경우 후기 작성 버튼 비활성화
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date appointOutdate = new Date(2023, 2, 17);
			Date today = new Date(formatter.parse(todayfm).getTime());
			
			int result = appointOutdate.compareTo(today);
			
			if(result > 0) {
				// 후기 작성 불가능
				System.out.println("appoint가 today보다 큼");
			} else {
				// 후기 작성 가능
				System.out.println("today가 appoint보다 큼");
				%>
				<button type="button" id="reviewBtn" onclick="location.href='review.jsp'">이용 후기 작성하기</button>
				<%
			}
			
// 			AppointmentDAO apdao = new AppointmentDAO();
// 			ArrayList<AppointmentDTO> apdto = apdao.getUserAppointmentList(no);
			
// 			if(apdto.getAstatus().value == 4) {
				%>
<!-- 				<button type="button" id="reviewBtn" onclick="location.href='review.jsp'">이용 후기 작성하기</button> -->
				<%
// 			}
		
 		}
		%>
		
	</form>
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</body>
</html>
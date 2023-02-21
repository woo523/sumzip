<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html>
<head>
<meta charset="UTF-8">
<title>products/appointManage</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<br><br><br>

    <%
 String id=(String)session.getAttribute("id"); //id 세션값 불러오기 

 ArrayList<AppointmentDTO> AppointmentList=(ArrayList<AppointmentDTO>)request.getAttribute("AppointmentList");

 int startPage=(Integer)request.getAttribute("startPage");
 int pageBlock=(Integer)request.getAttribute("pageBlock");
 int endPage=(Integer)request.getAttribute("endPage");
 int pageCount=(Integer)request.getAttribute("pageCount");
	
	
	
 	%>
  <div class="breadcrumb-section">
        <div class="container"> 
            <div class="row"> 
               <div class="col-lg-12"> 
                   <div class="breadcrumb-text"> 
                       <h2>예약 관리</h2> 
                    </div>
               </div> 
            </div> 
         </div> 
    </div>
	<div class="tb"><table border="1"> 
<!-- 	 로그인한 사용자의 예약 리스트와 예약취소 --> 
 	<tr><td class="tb"> 예약번호 </td><td class="tb"> 펜션이름 </td><td class="tb"> 예약상태 </td> 
 	<td class="tb"> 예약일자 </td><td class="tb"> 예약취소 </td></tr> 
 	<% 
 	for(int i=0;i<AppointmentList.size();i++){
 		//배열 한칸에 내용 가져오기 
 		AppointmentDTO adto=AppointmentList.get(i);
 		
		ProductDAO pdao = new ProductDAO();
		ProductDTO pdto = pdao.getProduct(adto.getPno());
 		
 		%> 
 	<tr><td class="tb"> <%=adto.getAno()%> </td> 
	    <td class="tb"> <%=pdto.getPname()%> </td> 
	        <td class="tb"> <% 
	    if(adto.getAstatus()==1){
 	    	out.print("입금대기");
 	    }else if(adto.getAstatus()==2){
 	    	out.print("입금확인");
 	    }else if(adto.getAstatus()==3){
 	    	out.print("예약완료");
  	    }%> </td>
	    <td class="tb"> <%=adto.getAdate()%> </td> 
	    <td class="tb"><a href="ProductsAppointManagePro.pr?ano=<%=adto.getAno()%>">취소하기</a></td></tr>

		<%
 	}
 	%> 
	</table>
	</div>

<%
// 한 화면에 보여줄 페이지 개수 설정
// int pageBlock=10;
// 시작하는 페이지 번호 구하기
// currentPage			pageBlock	=> startPage
//		1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
//		11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
//		21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
// startPage pageBlock => endPage
//	1			10	   =>	1+10-1  => 10
//	11			10	   =>	11+10-1 => 20
//	21			10	   =>	21+10-1 => 30
// int endPage=startPage+pageBlock-1;
//전체글 개수 select count(*) from Appointment
// int 리턴할형 getAppointmentCount() 메서드 정의
// getAppointmentCount() 메서드 호출
// int count = dao2.getAppointmentCount(no);
//끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
//전체페이지(pageCount) 구하기
//=> 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3 글 남아있으면 1페이지 추가)
//
// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// if(endPage > pageCount){
// 	endPage = pageCount;
// }
//10페이지 이전



if(startPage > pageBlock){
	%>
	<a href="ProductsAppointManage.pr?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
 %>
<div class="room-pagination">
<%
 for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="ProductsAppointManage.pr?pageNum=<%=i%>"><%=i%></a>
	<%
}
 %> 
</div>
<%

// //10페이지 다음
if(endPage < pageCount){
	%>
	<a href="ProductsAppointManage.pr?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
 }
 %>



<!-- <!-- 푸터 들어가는 곳 --> 
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- <!-- 푸터 들어가는 곳 -->
</body>
</html>
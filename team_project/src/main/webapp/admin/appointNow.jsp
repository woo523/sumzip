<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/appointNow</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>숙소 예약 현황 (관리자용)</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%
// String id="admin";
// String id=(String)session.getAttribute("id");
// if(id.equals("admin")){

// 	AppointmentDAO dao=new AppointmentDAO();
	
	
//     int pageSize=10;
// 현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정
// http://localhost:8080/webProject/Appointment/list.jsp
// http://localhost:8080/webProject/Appointment/list.jsp?pageNum=2
// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
// 	=> 페이지번호가 없으면 1페이지 설정
// 	pageNum="1";
// }
// pageNum => 숫자변경
// int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기
// pageNum(currentPage)	   pageSize	=> startRow
// 	1						10		=> 	(1-1)*10+1 => 0*10+1 =>  0+1 -> 1  ~10
// 	2						10		=> 	(2-1)*10+1 => 1*10+1 => 10+1 -> 11 ~20
// 	3						10		=> 	(3-1)*10+1 => 2*10+1 => 20+1 -> 21 ~30
// int startRow=(currentPage-1)*pageSize+1;
// 끝나는 행번호 구하기
// startRow	pageSize	=>	endRow
//		1		10		=>	1+10-1	=>	10
// 		11		10		=>	11+10-1	=>	20
//		21		10		=>	21+10-1	=>	30
// int endRow = startRow+pageSize-1;

//select * from Appointment order by num desc limit 시작행-1, 몇개
// 리턴할형 ArrayList<AppointmentDTO>  getAppointmentList(int startRow, int pageSize) 메서드 정의 
// ArrayList<AppointmentDTO>  AppointmentList = dao.getAppointmentList(startRow, pageSize) 메서드 호출
// ArrayList<AppointmentDTO> AppointmentList=dao.getAppointmentList2(startRow, pageSize);
ArrayList<AppointmentDTO> AppointmentList=(ArrayList<AppointmentDTO>)request.getAttribute("AppointmentList");

int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");

	%>
	<form action="AdminAppointNowUpdate.ad" method="post">
	<div class="tb2"><table border="1">
	<tr><td class="tb2">유저번호</td><td class="tb2">예약번호</td><td class="tb2">예약상태</td><td class="tb2">예약상태 변경</td><td class="tb2">예약일자</td><td class="tb2">예약취소</td></tr>
	<%
	 for(int i=0;i<AppointmentList.size();i++){
	 	//배열 한칸에 내용 가져오기
	 	AppointmentDTO dto=AppointmentList.get(i);
	 	
		%>
	<tr><td class="tb2"><%=dto.getNo()%></td>
	    <td class="tb2"><%=dto.getAno()%></td>
	    <td class="tb2"><%
	    if(dto.getAstatus()==1){
	    	out.print("입금대기");
	    }else if(dto.getAstatus()==2){
	    	out.print("입금완료");
	    }else if(dto.getAstatus()==3){
	    	out.print("예약완료");
	    }	    
	    %>
	    </td>
	   	<%
	    if(dto.getAstatus()!=3){
	   	%>
	    	<td class="tb2"><a href="AdminAppointNowUpdate.ad?Astatus=<%=dto.getAstatus()%>&ano=<%=dto.getAno()%>">다음 예약단계로 변경</a></td>
	    <%
	    }else if(dto.getAstatus()==3){
	    	%>
	    	<td class="tb2">이미 최종단계입니다.</td>
	    	<%
	    }
	   	%>	    
	    <td class="tb2"><%=dto.getAdate()%></td>
	    <td class="tb2"><a href="AdminAppointNowDelete.ad?num=<%=dto.getAno()%>">예약취소</a></td></tr>    
	   <%
	   }
	%>
	</table></div>
	</form>
	<%
// 	int pageBlock=10;
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
// int count = dao.getAdminAppointmentCount();
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
	<a href="AdminAppointNow.ad?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
%>
<div class="room-pagination">
<%
for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="AdminAppointNow.ad?pageNum=<%=i%>"><%=i%></a>
	<%
}
%>
</div>
<%
//10페이지 다음
if(endPage < pageCount){
	%>
	<a href="AdminAppointNow.ad?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}

//  }else {
// 	response.sendRedirect("AdminLogin.ad");
//  }
 %> 
<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->
</body>
</html>
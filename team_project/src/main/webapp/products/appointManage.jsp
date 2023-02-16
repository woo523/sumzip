<%@page import="products.SalesDTO"%>
<%@page import="products.SalesDAO"%>
<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.AppointmentDAO"%>
<%@page import="products.AppointmentDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
UserDTO dto =(UserDTO)request.getAttribute("dto");
SalesDTO dto3=(SalesDTO)request.getAttribute("dto3");
ProductDTO dto4=(ProductDTO)request.getAttribute("dto4");
//로그인 확인 (비로그인시 로그인 화면으로 이동)
 if(id!=null){
//  	UserDAO dao=new UserDAO();
//  	UserDTO dto=dao.getUser(id);
//  	int no=dto.getNo();
//  	AppointmentDAO dao2=new AppointmentDAO();
//  	SalesDAO dao3=new SalesDAO();
//  	SalesDTO dto3=dao3.getSales(dto.getNo());
//  	ProductDAO dao4=new ProductDAO();
//  	ProductDTO dto4=dao4.getProduct(dto3.getPno());
    int no=dto.getNo();
    int pageSize=10;
// 현 페이지 번호 가져오기 => 페이지번호가 없으면 1페이지 설정
// http://localhost:8080/webProject/Appointment/list.jsp
// http://localhost:8080/webProject/Appointment/list.jsp?pageNum=2
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	//=> 페이지번호가 없으면 1페이지 설정
	pageNum="1";
}
// pageNum => 숫자변경
int currentPage=Integer.parseInt(pageNum);
// 시작하는 행번호 구하기
// pageNum(currentPage)	   pageSize	=> startRow
// 	1						10		=> 	(1-1)*10+1 => 0*10+1 =>  0+1 -> 1  ~10
// 	2						10		=> 	(2-1)*10+1 => 1*10+1 => 10+1 -> 11 ~20
// 	3						10		=> 	(3-1)*10+1 => 2*10+1 => 20+1 -> 21 ~30
int startRow=(currentPage-1)*pageSize+1;
// 끝나는 행번호 구하기
// startRow	pageSize	=>	endRow
//		1		10		=>	1+10-1	=>	10
// 		11		10		=>	11+10-1	=>	20
//		21		10		=>	21+10-1	=>	30
int endRow = startRow+pageSize-1;

//select * from Appointment order by num desc limit 시작행-1, 몇개
// 리턴할형 ArrayList<AppointmentDTO>  getAppointmentList(int startRow, int pageSize) 메서드 정의 
// ArrayList<AppointmentDTO>  AppointmentList = dao.getAppointmentList(startRow, pageSize) 메서드 호출
// ArrayList<AppointmentDTO> AppointmentList=dao2.getAppointmentList(no, startRow, pageSize);
ArrayList<AppointmentDTO> AppointmentList=(ArrayList<AppointmentDTO>)request.getAttribute("AppointmentList");


	
	
	
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
		AppointmentDTO dto2=AppointmentList.get(i);
		
		%>
	<tr><td class="tb"> <%=dto2.getAno()%> </td>
	    <td class="tb"> <%=dto4.getPname()%> </td>
	    <td class="tb"> <%
	    if(dto2.getAstatus()==1){
	    	out.print("입금대기");
	    }else if(dto2.getAstatus()==2){
	    	out.print("입금확인");
	    }else if(dto2.getAstatus()==3){
	    	out.print("예약완료");
	    }%> </td>
	    <td class="tb"> <%=dto2.getAdate()%> </td>
	    <td class="tb"><a href="appointManagePro.jsp?num=<%=dto2.getAno()%>">취소하기</a></td></tr>

		<%
	}
	%>
	</table>
	</div>

<%
// 한 화면에 보여줄 페이지 개수 설정
int pageBlock=10;
// 시작하는 페이지 번호 구하기
// currentPage			pageBlock	=> startPage
//		1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
//		11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
//		21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
// startPage pageBlock => endPage
//	1			10	   =>	1+10-1  => 10
//	11			10	   =>	11+10-1 => 20
//	21			10	   =>	21+10-1 => 30
int endPage=startPage+pageBlock-1;
//전체글 개수 select count(*) from Appointment
// int 리턴할형 getAppointmentCount() 메서드 정의
// getAppointmentCount() 메서드 호출
int count = dao2.getAppointmentCount(no);
//끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
//전체페이지(pageCount) 구하기
//=> 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3 글 남아있으면 1페이지 추가)
//
int pageCount=count/pageSize+(count%pageSize==0?0:1);
if(endPage > pageCount){
	endPage = pageCount;
}
//10페이지 이전

if(startPage > pageBlock){
	%>
	<a href="appointManage.jsp?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
%>
<div class="room-pagination">
<%
for(int i=startPage;i<=endPage;i++){
	%>
	
	<a href="appointManage.jsp?pageNum=<%=i%>"><%=i%></a>
	
	<%-- <a href="appointManage.jsp?pageNum=<%=i%>"><%=i%></a> --%>
	<%
}
%>
</div>
<%

//10페이지 다음
if(endPage < pageCount){
	%>
	<a href="appointManage.jsp?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}
%>

<%
}else {
	// 비로그인시 로그인 페이지로 이동
	response.sendRedirect("MemberLogin.me");
}
%>



<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
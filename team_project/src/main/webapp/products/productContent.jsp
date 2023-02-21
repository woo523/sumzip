<%@page import="member.UserDTO"%>
<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/productContent.jsp</title>
</head>
<body>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />


<!-- 상품리스트 부분 -->
<%

// int pno=Integer.parseInt(request.getParameter("pno"));

// ProductDAO dao=new ProductDAO();
// ProductDTO dto=dao.getProduct(pno);
// UserDTO udto=new UserDTO();

String id=(String)session.getAttribute("id");

int pno = (Integer)request.getAttribute("pno");

ProductDTO dto=(ProductDTO)request.getAttribute("dto");
UserDTO udto=(UserDTO)request.getAttribute("udto");
%>

<h2>글내용 [로그인 : <%=id %>]</h2>
<table border="1">
<tr><td>상품번호</td><td><%=dto.getPno() %></td></tr>
<tr><td>유저번호</td><td><%=dto.getNo() %></td></tr>
<tr><td>펜션이름</td><td><%=dto.getPname() %></td></tr>
<tr><td>펜션주소</td><td><%=dto.getPaddress() %></td></tr>
<tr><td>우편번호</td><td><%=dto.getPpostnum() %></td></tr>
<tr><td>상세주소</td><td><%=dto.getPaddress2() %></td></tr>
<tr><td>전화번호</td><td><%=dto.getPtel() %></td></tr>
<tr><td>체크인시간</td><td><%=dto.getCheckin() %></td></tr>
<tr><td>체크아웃시간</td><td><%=dto.getCheckout() %></td></tr>
<tr><td>가격</td><td><%=dto.getPprice() %></td></tr>
<tr><td>최대숙박인원</td><td><%=dto.getMax_men() %></td></tr>
<tr><td>등록유효기간</td><td><%=dto.getExpiration() %></td></tr>
<tr><td>숙소등록일</td><td><%=dto.getReser_date() %></td></tr>
<tr><td>펜션사진1</td>
<td>
<img src="upload/<%=dto.getPpic1() %>" width="200" height="200">
</td>
<tr><td>펜션사진2</td>
<td>
<img src="upload/<%=dto.getPpic2() %>" width="200" height="200">
</td>
<tr><td>펜션사진3</td>
<td>
<img src="upload/<%=dto.getPpic3() %>" width="200" height="200">
</td>
<tr><td>주의사항</td><td><%=dto.getCaution() %>
</td>
<tr><td>펜션설명</td><td><%=dto.getPexplain() %></td></tr>
<tr><td colspan="2">
<%
// 로그인 => 세션값 있음
if(id != null){
	// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
	if(id.equals("owner")){
		%>
<input type="button" value="상품수정"
 onclick="location.href='ProductUpdateForm.pr?pno=<%=dto.getPno() %>'">
 <input type="button" value="상품삭제"
 onclick="location.href='ProductDeletePro.pr?pno=<%=dto.getPno() %>'">		

		<%
	}
}
%>

<input type="button" value="상품목록"
 onclick="location.href='ProductList.pr'">
 <input type="button" value="숙소예약"
 onclick="location.href='ProductsAppointment.pr?pno=<%=dto.getPno() %>'">

 </td></tr>
 </table>

<jsp:include page="productReviewList.jsp" flush="false">
	<jsp:param value="<%=dto.getPno() %>" name="getPno"/>
</jsp:include>
 
 <!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>

</body>
</html>
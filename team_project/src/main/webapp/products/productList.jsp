<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/productList.jsp</title>
</head>
<body>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />


<!--  한페이지에 보여줄 글 개수 -->
<%
ProductDAO dao= new ProductDAO();

int pageSize=10;

String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	 pageNum="1";
	}

int currentPage=Integer.parseInt(pageNum);

int startRow=(currentPage-1)*pageSize+1;

int endRow= startRow+pageSize-1;

ArrayList<ProductDTO> productList=dao.getProductList(startRow, pageSize);
%>

<h1>product/productList.jsp</h1>
<h2><a href="productWrite.jsp">글쓰기</a></h2>

<!-- 펜션리스트 부분 -->
<table border="1">
<tr><td>상품번호</td><td>유저번호</td><td>펜션이름</td>
   <td>펜션주소</td><td>우편번호</td><td>상세주소</td>
   <td>전화번호</td><td>체크인시간</td><td>체크아웃시간</td><td>가격</td><td>최대숙박인원</td>
   <td>등록유효기간</td><td>숙소등록일</td><td>펜션사진1</td>
   <td>펜션사진2</td><td>펜션사진3</td><td>주의사항</td><td>펜션 설명</td>
   </tr>
   
<%
for(int i=0; i<productList.size(); i++){
	ProductDTO dto=productList.get(i);
%>
<tr><td><%=dto.getPno() %></td> <td><%=dto.getNo() %></td>
    <td>
    <a href="content.jsp?pno<%=dto.getPno()%>">
   <%=dto.getPname() %>
</a></td>
    <td><%=dto.getPaddress() %></td> <td><%=dto.getPpostnum() %></td>
    <td><%=dto.getPpostnum() %></td>
    <td><%=dto.getPaddress2() %></td>
<td><%=dto.getPtel() %></td>
<td><%=dto.getCheckin() %></td>
<td><%=dto.getCheckout() %></td>
<td><%=dto.getPprice() %></td>
<td><%=dto.getMax_men() %></td>
<td><%=dto.getExpiration() %></td>
<td><%=dto.getReser_date() %></td>
<td><%=dto.getPpic1() %></td>
<td><%=dto.getPpic2() %></td>
<td><%=dto.getPpic3() %></td>
<td><%=dto.getCaution() %></td>
<td><%=dto.getPexplain() %></td></tr>

	<%
}
%>    

</table>

<!-- 페이징 부분 -->
<% 
// 한 화면에 보여줄 페이지개수
int pageBlock=10;

// 시작하는 페이지 번호
int startPage=(currentPage-1)/pageBlock*pageBlock+1;

// 끝나는 페이지 번호
int endPage=startPage+pageBlock-1;

// 전체글 개수를 정의한 getBoardCount()메서드 호출
int count= dao.getProductCount();

// 전체페이지
int pageCount=count/pageSize+(count%pageSize==0?0:1);
if(endPage > pageCount){
	endPage = pageCount;
}


if(startPage > pageBlock){
	%>
<a href="productList.jsp?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="productList.jsp?pageNum=<%=i%>"><%=i %></a> 
	<%
}

if(endPage < pageCount){
	%>
<a href="productList.jsp?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}
%>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />

</body>
</html>
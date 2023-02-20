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
// ProductDAO dao= new ProductDAO();

// int pageSize=10;

// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
// 	 pageNum="1";
// 	}

// int currentPage=Integer.parseInt(pageNum);

// int startRow=(currentPage-1)*pageSize+1;

// int endRow= startRow+pageSize-1;

// ArrayList<ProductDTO> productList=dao.getProductList(startRow, pageSize);

ArrayList<ProductDTO> productList = (ArrayList<ProductDTO>)request.getAttribute("productList");
int currentPage =(Integer)request.getAttribute("currentPage");
int pageBlock =(Integer)request.getAttribute("pageBlock");
int startPage =(Integer)request.getAttribute("startPage");
int endPage =(Integer)request.getAttribute("endPage");
int pageCount =(Integer)request.getAttribute("pageCount");


%>

<!-- 글쓰기 버튼 부분 -->
<h1>products/productList.jsp</h1>

<table border="0" width="50%">
<tbody><tr align="right">
<td>
<button type="button" onclick="location.href='ProductWriteForm.pr'">
상품등록</button></td>
</tr>
</tbody></table>

<!-- 펜션리스트 부분 -->
<table border="1">
<tr><td>상품번호</td>
	<td>펜션이름</td>
    <td>가격</td>
    <td>펜션사진1</td>
    <td>펜션설명</td>
    </tr>
   
<%
for(int i=0; i<productList.size(); i++){
	ProductDTO dto=productList.get(i);
%>
    <tr><td><%=dto.getPno() %></td>
    <td>
    <a href="ProductContent.pr?pno=<%=dto.getPno()%>">
    <%=dto.getPname() %>
    </a></td>
    <td><%=dto.getPprice() %></td>
	<td><%=dto.getPpic1() %></td>
	<td><%=dto.getPexplain() %></td></tr>

	<%
}
%>    

</table>

<!-- 페이징 부분 -->
<% 
// // 한 화면에 보여줄 페이지개수
// int pageBlock=10;

// // 시작하는 페이지 번호
// int startPage=(currentPage-1)/pageBlock*pageBlock+1;

// // 끝나는 페이지 번호
// int endPage=startPage+pageBlock-1;

// // 전체글 개수를 정의한 getBoardCount()메서드 호출
// int count= dao.getProductCount();

// // 전체페이지
// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// if(endPage > pageCount){
// 	endPage = pageCount;
// }


if(startPage > pageBlock){
	%>
<a href="ProductList.pr?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="ProductList.pr?pageNum=<%=i%>"><%=i %></a> 
	<%
}

if(endPage < pageCount){
	%>
<a href="ProductList.pr?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}
%>

<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>

</body>
</html>
<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/productContent.jsp</title>
</head>
<body>

<%
// 상품페이지 수정중,,
int pno=Integer.parseInt(request.getParameter("pno"));

ProductDAO dao=new ProductDAO();

ProductDTO dto=dao.getProduct(pno);

String id=(String)session.getAttribute("id");
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
<tr><td>펜션사진1</td><td><%=dto.getPpic1() %></td></tr>
<tr><td>펜션사진2</td><td><%=dto.getPpic2() %></td></tr>
<tr><td>펜션사진3</td><td><%=dto.getPpic3() %></td></tr>
<tr><td>주의사항</td><td><%=dto.getCaution() %></td></tr>
<tr><td>펜션 설명</td><td><%=dto.getPexplain() %></td></tr>

<tr><td colspan="2">
<%
// 로그인 => 세션값 있음
if(id != null){
	// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
	if(id.equals(dto.getPname())){
		%>
<input type="button" value="상품수정"
 onclick="location.href='product_updateForm.jsp?pno=<%=dto.getPno() %>'">
 <input type="button" value="상품삭제"
 onclick="location.href='product_deletePro.jsp?pno=<%=dto.getPno() %>'">		
		<%
	}
}
%>

<input type="button" value="상품목록"
 onclick="location.href='productList.jsp'">
 <input type="button" value="상품수정"
 onclick="location.href='product_updateForm.jsp'">
 <input type="button" value="상품삭제"
 onclick="location.href='product_deletePro.jsp'">
 
 </td></tr>
 </table>
</body>
</html>
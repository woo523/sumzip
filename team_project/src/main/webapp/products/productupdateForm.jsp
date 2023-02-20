<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardupdateForm.jsp</title>
</head>
<body>
<%
// int pno=Integer.parseInt(request.getParameter("pno"));

// ProductDAO dao=new ProductDAO();

// ProductDTO dto=dao.getProduct(pno);

ProductDTO dto=(ProductDTO)request.getAttribute("dto");
%>
<h2>상품등록 수정</h2>

<form action="ProductUpdatePro.pr" method="post">
<input type="hidden" name="pno" value="<%=dto.getPno()%>">
<table border="1">
<tr><td>유저번호</td>
    <td><input type="text" name="no" value="<%=dto.getNo()%>"></td></tr>
<tr><td>펜션이름</td>
    <td><input type="text" name="pname" value="<%=dto.getPname() %>"></td></tr>
<tr><td>체크인</td>
    <td><input type="time" name="checkin" value="<%=dto.getCheckin()%>"></td></tr>
<tr><td>체크아웃</td>
    <td><input type="time" name="checkout" value="<%=dto.getCheckout()%>"></td></tr>
<tr><td>가격</td>
    <td><input type="text" name="pprice" value="<%=dto.getPprice() %>"></td></tr>   
<tr><td>최대숙박인원</td>
    <td><input type="text" name="max_men" value="<%=dto.getMax_men() %>"></td></tr>    
<tr><td>등록유효기간</td>
    <td><input type="text" name="expiration" value="<%=dto.getExpiration() %>"></td></tr>
<tr><td>펜션사진1</td>
    <td><input type="file" name="ppic1" value="<%=dto.getPpic1()%>"></td></tr>
<tr><td>펜션사진2</td>
    <td><input type="file" name="ppic2" value="<%=dto.getPpic2() %>"></td></tr>
<tr><td>펜션사진3</td>
    <td><input type="file" name="ppic3" value="<%=dto.getPpic3() %>"></td></tr>
<tr><td>주의사항</td>
    <td><textarea name="caution" rows="10" cols="20"><%=dto.getCaution() %></textarea></td></tr>                      
<tr><td>펜션설명</td>
    <td><textarea name="pexplain" rows="10" cols="20"><%=dto.getPexplain()%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="상품등록 수정"></td></tr>    
</table>
</form>
</body>
</html>

<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/fupdateForm.jsp</title>
</head>
<body>
<%
// //http://localhost:8080/webProject/board/updateForm.jsp?num=2
// //request 에 저장된 num 파라미터값 가져오기
// int num=Integer.parseInt(request.getParameter("num"));
// //BoardDAO 객체생성
// BoardDAO dao=new BoardDAO();
// //BoardDTO  dto = dao.getBoard(num) 메서드 호출
// BoardDTO dto=dao.getBoard(num);

ProductDTO dto=(ProductDTO)request.getAttribute("dto");
%>
<h1>파일 글수정</h1>
<form action="FileProductUpdatePro.pr" method="post" enctype="multipart/form-data">
<input type="hidden" name="pno" value="<%=dto.getPno() %>">
<table border="1">
<tr><td>첨부파일</td>
    <td><input type="file" name="ppic1" ><%=dto.getPpic1() %>
    <input type="hidden" name="oldfile" value="<%=dto.getPpic1() %>">
    </td></tr>   
<tr><td>펜션이름</td>
    <td><input type="text" name="name" value="<%=dto.getPname() %>"></td></tr>
<tr><td>펜션가격</td>
    <td><input type="text" name="pprice" value="<%=dto.getPprice() %>"></td></tr>  
<tr><td>펜션설명</td>
    <td><textarea name="content" rows="10" cols="20"><%=dto.getPexplain() %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>    
</table>
</form>
</body>
</html>
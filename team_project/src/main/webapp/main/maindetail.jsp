<%@page import="products.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>maindetail.jsp</title>

<style type="text/css">
.class{

}
</style>
</head>
<body>
<%
ArrayList<ProductDTO> productlist = (ArrayList<ProductDTO>)request.getAttribute("productlist");
int currentPage = (Integer)request.getAttribute("currentPage");
int pageBlock = (Integer)request.getAttribute("pageBlock");
int startPage = (Integer)request.getAttribute("startPage");
int endPage = (Integer)request.getAttribute("endPage");
int pageCount = (Integer)request.getAttribute("pageCount");

%>

<%
for(int i = 0;i<productlist.size();i++){
ProductDTO dto = productlist.get(i);
%>
<div class="productitem" style="float: left; width: 33%;">
<img src ="<%=dto.getPpic1() %>">
<div class="productinfo">
<h3><%=dto.getPname() %></h3>
<p> <%=dto.getPprice() %></p>
</div>
</div>

<%} %>

</body>
</html>
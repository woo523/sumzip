<%@page import="products.ProductDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 상품삭제 부분 -->
<%
// products/product_deletePro.jsp

int pno=Integer.parseInt(request.getParameter("pno"));

ProductDAO dao=new ProductDAO();

dao.deleteProduct(pno);

response.sendRedirect("productList.jsp");

%>
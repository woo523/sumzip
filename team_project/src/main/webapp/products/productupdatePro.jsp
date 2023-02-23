<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/productupdatePro.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

int pno=Integer.parseInt(request.getParameter("pno"));
String pname=request.getParameter("pname");
String checkin=request.getParameter("checkin");
String checkout=request.getParameter("checkout");
int pprice=Integer.parseInt(request.getParameter("pprice"));
int max_men=Integer.parseInt(request.getParameter("max_men"));
String ppic1=request.getParameter("ppic1");
String ppic2=request.getParameter("ppic2");
String ppic3=request.getParameter("ppic3");
String caution=request.getParameter("caution");
String pexplain=request.getParameter("pexplain");

ProductDTO dto=new ProductDTO();

dto.setPno(pno);
dto.setPname(pname);
dto.setCheckin(checkin);
dto.setCheckout(checkout);
dto.setPprice(pprice);
dto.setMax_men(max_men);
dto.setPpic1(ppic1);
dto.setPpic2(ppic2);
dto.setPpic3(ppic3);
dto.setCaution(caution);
dto.setPexplain(pexplain);

ProductDAO dao=new ProductDAO();

dao.updateProduct(dto);

response.sendRedirect("ProductList.pr");

%>
</body>
</html>
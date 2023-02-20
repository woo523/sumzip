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
// int no=Integer.parseInt(request.getParameter("no"));
String pname=request.getParameter("pname");
// String paddress=request.getParameter("paddress");
// int ppostnum=Integer.parseInt(request.getParameter("ppostnum"));
// String paddress2=request.getParameter("paddress2");
// String ptel=request.getParameter("ptel");
int checkin=Integer.parseInt(request.getParameter("checkin"));
int checkout=Integer.parseInt(request.getParameter("checkout"));
int pprice=Integer.parseInt(request.getParameter("pprice"));
int max_men=Integer.parseInt(request.getParameter("max_men"));
int expiration=Integer.parseInt(request.getParameter("expiration"));
String ppic1=request.getParameter("ppic1");
String ppic2=request.getParameter("ppic2");
String ppic3=request.getParameter("ppic3");
String caution=request.getParameter("caution");
String pexplain=request.getParameter("pexplain");

ProductDTO dto=new ProductDTO();

dto.setPno(pno);
// dto.setNo(no);
dto.setPname(pname);
// dto.setPaddress(paddress);
// dto.setPpostnum(ppostnum);
// dto.setPaddress2(paddress2);
// dto.setPtel(ptel);
dto.setCheckin(checkin);
dto.setCheckout(checkout);
dto.setPprice(pprice);
dto.setMax_men(max_men);
dto.setExpiration(expiration);
dto.setPpic1(ppic1);
dto.setPpic2(ppic2);
dto.setPpic3(ppic3);
dto.setCaution(caution);
dto.setPexplain(pexplain);

ProductDAO dao=new ProductDAO();

dao.updateProduct(dto);

response.sendRedirect("productList.jsp");

%>
</body>
</html>
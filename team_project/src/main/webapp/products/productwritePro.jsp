<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//products/productwritePro.jsp
request.setCharacterEncoding("utf-8");

// [유저번호, 제목, 내용] 변수에 저장
// int pno = Integer.parseInt(request.getParameter("pno"));
String pname= request.getParameter("pname");
String paddress= request.getParameter("paddress");
int ppostnum= Integer.parseInt(request.getParameter("ppostnum"));
String paddress2= request.getParameter("paddress2");
String ptel= request.getParameter("ptel");
int checkin= Integer.parseInt(request.getParameter("checkin"));
int checkout= Integer.parseInt(request.getParameter("checkout"));
int pprice= Integer.parseInt(request.getParameter("pprice"));
int max_men= Integer.parseInt(request.getParameter("max_men"));
int expiration= Integer.parseInt(request.getParameter("expiration"));
Timestamp reser_date=new Timestamp(System.currentTimeMillis());
String ppic1= request.getParameter("ppic1");
String ppic2= request.getParameter("ppic2");
String ppic3= request.getParameter("ppic3");
String caution= request.getParameter("caution");
String pexplain= request.getParameter("pexplain");
ProductDTO dto=new ProductDTO();

// 값 저장
// dto.setPno(pno);
// dto.setNo(no);
dto.setPname(pname);
dto.setPaddress(paddress);
dto.setPpostnum(ppostnum);
dto.setPaddress2(paddress2);
dto.setPtel(ptel);
dto.setCheckin(checkin);
dto.setCheckout(checkout);
dto.setPprice(pprice);
dto.setMax_men(max_men);
dto.setExpiration(expiration);
dto.setReser_date(reser_date);
dto.setPpic1(ppic1);
dto.setPpic2(ppic2);
dto.setPpic3(ppic3);
dto.setCaution(caution);
dto.setPexplain(pexplain);

ProductDAO dao=new ProductDAO();

dao.insertProduct(dto);

// 글목록(productList.jsp)으로 이동
response.sendRedirect("productList.jsp");


%>


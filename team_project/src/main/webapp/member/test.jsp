<%@page import="products.ProductDTO"%>
<%@page import="products.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

ProductDAO dao = new ProductDAO();
ProductDTO dto = dao.getProduct(100);




%>

<%= dto.getPname() %>
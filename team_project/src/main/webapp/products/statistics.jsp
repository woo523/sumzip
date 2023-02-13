<%@page import="products.SalesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.SalesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/statistics</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<h1>통계 (관리자용)</h1>
<%
SalesDAO dao=new SalesDAO();
ArrayList<SalesDTO> salesList = dao.getSalesList();
%>
<table border="1">
<caption>달별 이용자수</caption>
<tr><td>1월</td><td>2월</td><td>3월</td><td>4월</td><td>5월</td><td>6월</td><td>7월</td><td>8월</td><td>9월</td><td>10월</td><td>11월</td><td>12월</td></tr>
<%
int count;
for(int i=0;i<salesList.size();i++){
	
}
%>
</table>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>
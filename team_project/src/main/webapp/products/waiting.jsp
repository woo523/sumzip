<%@page import="products.WaitingDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="products.WaitingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/waiting</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<h1>예약대기(보류)</h1>
<%
WaitingDAO dao=new WaitingDAO();
ArrayList<WaitingDTO> WaitingList=dao.getWaitingList();
%>
<table border="1">
<tr><td>대기번호</td><td>상품번호</td><td>유저번호</td><td>예약대기일자</td></tr>
<%
for(int i=0;i<WaitingList.size();i++){
	WaitingDTO dto=WaitingList.get(i);
%>
<tr><td><%=dto.getWno()%></td>
    <td><%=dto.getPno()%></td>
    <td><%=dto.getNo()%></td>
    <td><%=dto.getWdate()%></td></tr>    
	<%
	
}
%>
</table>
<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->
</body>
</html>
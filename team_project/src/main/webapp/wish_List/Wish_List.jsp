<%@page import="products.ProductDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.WishListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->
<h1>위시리스트</h1>
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	UserDAO udao=new UserDAO();
	UserDTO dto=udao.getUser(id); //no
	WishListDAO dao= new WishListDAO();
	int no=dto.getNo();
	ArrayList<ProductDTO> list=new ArrayList<ProductDTO>();
	int pno=3;

	%>

	<table border=1>
	<tr><td>유저이름</td><td>숙박가격</td><td>주소</td><td>ppic1</td></tr>
	<%
		list = dao.getWishArrayList(pno,no);
		for(int i=0; i<list.size(); i++){
		ProductDTO d=list.get(i);
	%>
	<tr>
		<td><%=d.getPname()%></td>
		<td><%=d.getPprice()%></td>
		<td><%=d.getPaddress()%></td>
		<td><%=d.getPpic1()%></td>
	</tr>
	<%
		}
	%>
</table>
<a href="../member/myPage_user.jsp">마이페이지로 돌아가기</a><br>
<%
}else {
	response.sendRedirect("../member/login.jsp");
}
%>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
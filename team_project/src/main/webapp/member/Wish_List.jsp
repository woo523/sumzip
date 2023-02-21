<%@page import="products.ProductDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.WishListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <meta charset="UTF-8">
    <title>Wish_List</title>
    </head>
<!-- 헤더파일들어가는 곳 -->
<%-- <jsp:include page="../inc/header.jsp" /> --%>
<!-- 헤더파일들어가는 곳 -->


<h1>위시리스트</h1>

<%
String id=(String)session.getAttribute("id");
System.out.println("id="+id);
//int pno = 7;
if(id!=null){
	UserDAO udao=new UserDAO();
	WishListDAO dao= new WishListDAO();
	UserDTO dto=udao.getUser(id); //no
	int no=dto.getNo();
	System.out.println("no="+no);
	ArrayList<ProductDTO> list=dao.getWishArrayList(no);

	

	%>
	<table border=1>
	<tr><td>숙소이름</td><td>숙박가격</td><td>주소</td></tr>
	<%
		
	for(int i=0; i<list.size(); i++){
		ProductDTO d=list.get(i);
		int ppno=d.getPno();
	%>
	<tr>
		<td><%=d.getPname()%></td>
		<td><%=d.getPprice()%></td>
		<td><%=d.getPaddress()%></td>
		<td><form action="Wish_ListPro.jsp">
<input type="hidden" name="pno" value=<%=ppno%>>
<input type="submit" name="button" value="X">; 
</form></td>
		<%System.out.println("ppno="+ppno);%>
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
    
<form action="Wish_ListPro.jsp">
<%-- <input type="hidden" name="pno" value=<%=ppno%>> --%>
<input type="submit" name="button" value="X">; 
<input type="submit" name="button" value="찜">; 
</form>



<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->

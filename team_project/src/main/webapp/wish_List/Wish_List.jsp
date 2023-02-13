<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.WishListDAO"%>
<%@page import="member.WishListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
String id=(String)session.getAttribute("id");

UserDAO udao = new UserDAO();
UserDTO udto = udao.getUser(id); //no

int pno=3;
int no=udto.getNo();
%>


<table border=1>
	<%
		
		WishListDAO dao= new WishListDAO();
		ArrayList<WishListDTO> list = dao.getWishArrayList(pno);
		for(int i=0; i<list.size(); i++){	
	%>
	<tr>
		<td><%= list.get(i).getNo() %></td>
		<td><%= list.get(i).getPno() %></td>
		
	</tr>
	<%
		}
	%>
</table>

<!-- 넘어온 값이 on이면 insertWish, off면 deletewish -->

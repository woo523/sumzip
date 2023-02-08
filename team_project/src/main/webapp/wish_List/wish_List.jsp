<%@page import="member.WishListDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.WishListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 찜목록 테이블구현 -->
<tr>
	<td colspan="5" align="left" bgcolor="beige">&nbsp;&nbsp;[제목]&nbsp;&nbsp;<%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
	<%	WishListDAO dao = new WishListDAO();
		ArrayList<Jjim> list1 = jjimDAO.getJjim(userID, bbsID);
		if (list1.isEmpty()){%>
	<td align="right" bgcolor="beige"><button onclick = "location.href='/wishAction.jsp?bbsID=<%=%>'">찜하기</button></td>
	<%	}
		else{%>
	<td align="right" bgcolor="beige"><button onclick = "location.href='/wishAction.jsp?bbsID=<%=%>'">찜해제</button></td>
	<%	} %>						
</tr>
<!-- 찜목록 테이블구현 -->


</body>
</html>
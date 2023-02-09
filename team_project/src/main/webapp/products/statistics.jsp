<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/statistics</title>
</head>
<body>
<h1>통계 (관리자용)</h1>
<%
// MemberDAO dao=new MemberDAO();
//리턴할형 ArrayList<MemberDTO>  getMemberList() 메서드 정의 
//ArrayList<MemberDTO>  memberList = dao.getMemberList() 메서드 호출
// ArrayList<MemberDTO> memberList =dao.getMemberList();
%>
<table border="1">
<caption>달별 이용자수</caption>
<tr><td>1월</td><td>2월</td><td>3월</td><td>4월</td><td>5월</td><td>6월</td><td>7월</td><td>8월</td><td>9월</td><td>10월</td><td>11월</td><td>12월</td></tr>
<%
// for(int i=0;i<memberList.size();i++){
	//배열 한칸에 내용 가져오기 
// 	MemberDTO dto=memberList.get(i);
 %>
<%-- <tr><td><%=dto.getId() %></td> --%>
<%--     <td><%=dto.getPass() %></td> --%>
<%--     <td><%=dto.getName() %></td> --%>
<%--     <td><%=dto.getDate() %></td></tr>	 --%>
<%-- 	<% --%>
<!-- } -->


%>
</table>
</body>
</html>
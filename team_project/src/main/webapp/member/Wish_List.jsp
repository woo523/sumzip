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
<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/header.jsp" />
		<!-- 헤더들어가는 곳 -->
		<nav id="sidebar">
			<ul>
				<li><a href="MemberMyPage_user.me">내 정보 조회</a></li>
				<li><a href="MemberMyList.me">내 이용목록</a></li>
				<li><a href="ProductAppointManage.pr">예약관리</a></li>
				<li><a href="MemberWishList.me">찜 목록</a></li>
				<li><a href="MemberDeleteForm.me">회원탈퇴</a></li>
			</ul>
		</nav>
	</div>


<h2>위시리스트</h2>

<%
request.setCharacterEncoding("utf-8");
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

    <style>
      table {
    text-align:center;
    width: 80%;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }

 
  
  #end{
  	border:none;
  }
  
  #button{
  	padding-top: 5px;
  	text-align:left;
  	border-top: none;
  	border-right: none;
  	border-bottom:none;
  }
  
  input{
  margin-top: 10px;
  }
  
  #sidebar{
 	width: 250px; 
   	height: 1000px;   
/*  	background-color: #98FD5D;  */
	float: left;
}
    </style>
  

    <table>
      <thead>
        <tr>
          <th>숙소이름</th><th>숙박가격</th><th>주소</th><th id="end"></th>
        </tr>
      </thead>
      <tbody>
        
        <%                   	
	for(int i=list.size()-1; i>=0; i--){
		ProductDTO d=list.get(i);
		System.out.println("i="+i);
		int ppno=d.getPno();
	%>
		<tr>
          <td><%=d.getPname()%></td><td><%=d.getPprice()%></td><td><%=d.getPaddress()%></td>

<td id="button"><form action="MemberWishListPro.me">
<input type="hidden" name="pno" value=<%=ppno%>>
<input type="submit" name="button" value="찜해제">
</form></td>
		<%System.out.println("ppno="+ppno);%>
        </tr><%} %>
      </tbody>
    </table>
<a href="MemberMyPage_user.me">마이페이지로 돌아가기</a><br><%
        }else {
	response.sendRedirect("MemberLogin.me");
}
%>





<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->

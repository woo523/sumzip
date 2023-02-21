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
  
  
    </style>
  

    <table>
      <thead>
        <tr>
          <th>숙소이름</th><th>숙박가격</th><th>주소</th><th id="end"></th>
        </tr>
      </thead>
      <tbody>
        
        <%                   	
	for(int i=0; i<list.size(); i++){
		ProductDTO d=list.get(i);
		int ppno=d.getPno();
	%>
		<tr>
          <td><%=d.getPname()%></td><td><%=d.getPprice()%></td><td><%=d.getPaddress()%></td>

<td id="button"><form action="MemberWishListPro.me">
<input type="submit" name="button" value="찜">
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
<%-- <input type="hidden" name="pno" value=<%=ppno%>> --%>
<input type="submit" name="button" value="찜">; 




<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- 푸터 들어가는 곳 -->

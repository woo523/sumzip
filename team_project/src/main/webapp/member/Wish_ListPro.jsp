<%@page import="products.ProductDTO"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.WishListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String id=(String)session.getAttribute("id");
String order=request.getParameter("button");
System.out.println("order="+order);
UserDAO udao=new UserDAO();
UserDTO dto=udao.getUser(id);
int no=dto.getNo();
WishListDAO dao= new WishListDAO();
int pno=Integer.parseInt(request.getParameter("pno"));
System.out.println("pno="+pno);
boolean result=true, answer=true;

//담으려는 숙소의 pno값을 가져와야함

		if(id!=null){ //로그인 되어있을때
			if ("찜".equals(order)){
			result=dao.WishCheck(no,pno);
			System.out.println("result="+result);
			if (result==false){ //DB에 숙소가 안담겨있을때
				dao.insertWish(no,pno);
				System.out.println("wishcheck");
				%>
				<script type="text/javascript">
				alert("해당항목을 찜 목록에 담았습니다.");
				location.href = "Wish_List.jsp"; //나중에 버튼을 눌렀던 그 페이지 주소로 바꿔놓기
				</script>
			
			<%}else if (result==true){
					System.out.println("wishcheck2");
				%>
				<script type="text/javascript">
				 var answer= confirm('이미 담긴 항목입니다.);
				   if (answer) {
					   location.href = "Wish_List.jsp";
				      
				   }
				   else {
					   location.href = "Wish_List.jsp"; //나중에 버튼을 눌렀던 그 페이지 주소로 바꿔놓기
				   }
				</script>

				<%
				}
			}
			else if("X".equals(order)){
				dao.deleteWish(no, pno);%>
				<script type="text/javascript">
				alert("해당항목을 찜 목록에서 삭제하였습니다.");
				location.href = "MemberLogin.me";
				</script><% 
			}
				}
				
				else { //로그인 안되어있을때
					response.sendRedirect("MemberLogin.me");}
					%>

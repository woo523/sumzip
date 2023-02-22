package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import member.WishListDAO;

public class MemberWishListPro implements Action {

	@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
HttpSession session = request.getSession();
String id=(String)session.getAttribute("id");
String order=request.getParameter("button");
System.out.println("order="+order);
UserDAO udao=new UserDAO();
UserDTO dto=udao.getUser(id);
int no=dto.getNo();
WishListDAO dao= new WishListDAO();
int pno=Integer.parseInt(request.getParameter("pno"));
System.out.println("pno="+pno);

ActionForward forward=null;
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
//담으려는 숙소의 pno값을 가져와야함

		if(id!=null){ //로그인 되어있을때
			if ("찜".equals(order)){
			boolean result=dao.WishCheck(no,pno);
			System.out.println("result="+result);
				if (result==false){ //DB에 숙소가 안담겨있을때
					dao.insertWish(no,pno);
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out=response.getWriter();
					System.out.println("wishcheck");
					out.println("<script type='text/javascript'>");
					out.println("alert('해당항목을 찜 목록에 담았습니다.');");
					out.println("history.back();");
					out.println("</script>");
					}else if (result==true){
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out=response.getWriter();
						System.out.println("wishcheck2");
						out.println("<script type='text/javascript'>");
						out.println("alert('이미 담긴 항목입니다.');");
						out.println("history.back();");
						out.println("</script>");
					
						}
			}
			else if("찜해제".equals(order)){
				System.out.println("찜해제");
				dao.deleteWish(no, pno);
				response.sendRedirect("MemberWishList.me");
				}
				
				
	}
		else { //로그인 안되어있을때
			System.out.println("로그인안됨");
			forward = new ActionForward();
		 	forward.setPath("MemberLogin.me");
		 	forward.setRedirect(true);
		 	return forward;
		}
		return null;
		}

}
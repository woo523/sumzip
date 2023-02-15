package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.ReviewDAO;

public class MemberReviewDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberDelete execute()");
		
		// 후기 삭제 페이지
		// reviewDelete.jsp
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		ReviewDAO rdao = new ReviewDAO();
		rdao.deleteReview(ano);
		
		//response.sendRedirect("myList.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("member/myList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}

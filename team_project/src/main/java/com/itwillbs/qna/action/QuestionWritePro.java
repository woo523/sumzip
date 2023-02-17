package com.itwillbs.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QuestionWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaWritePro execute()");
		
		//request 한글처리
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		
		return null;
	}

}
  
package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.ReplyDAO;
import board.ReplyDTO;
import member.UserDAO;
import member.UserDTO;

public class BoardReplyDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		


		int rno=Integer.parseInt(request.getParameter("rno"));
		ReplyDAO rdao=new ReplyDAO();
		ReplyDTO rdto=rdao.getReply(rno);
		int bno = rdto.getBno();
		
		rdao.deleteReply(rno);
		
		ActionForward forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno+"");
		forward.setRedirect(true);
	
		return forward;
	}

}

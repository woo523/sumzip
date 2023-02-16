package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ReplyDAO;
import board.ReplyDTO;

public class BoardReplyUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardReplyUpdatePro execute()");
		request.setCharacterEncoding("utf-8");

		int rno=Integer.parseInt(request.getParameter("rno"));
		int bno=Integer.parseInt(request.getParameter("bno"));

		String riply=request.getParameter("riply");

		ReplyDTO dto=new ReplyDTO();

		dto.setRno(rno);
		dto.setRiply(riply);

		ReplyDAO dao=new ReplyDAO();

		dao.updateReply(dto);

		ActionForward forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno+"");
		forward.setRedirect(true);
		return forward;
	}

}

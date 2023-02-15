package com.itwillbs.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.ReplyDAO;
import board.ReplyDTO;

public class BoardReplyInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyInsert excute()");
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int no = Integer.parseInt(request.getParameter("no"));
		String riply = request.getParameter("riply");

		Timestamp rdate = new Timestamp(System.currentTimeMillis());

		ReplyDTO dto = new ReplyDTO();
		dto.setBno(bno);
		dto.setNo(no);
		dto.setRiply(riply);
		dto.setRdate(rdate);


		ReplyDAO dao = new ReplyDAO();
		dao.insertReply(dto);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno+"");
		forward.setRedirect(true);
		
		
		return forward;
	}
	
	

}

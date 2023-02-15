package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommendDAO;
import board.CommendDTO;

public class BoardCommendDeletePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int cno=Integer.parseInt(request.getParameter("cno"));
		
		CommendDAO dao=new CommendDAO();
		CommendDTO dto = dao.getCommend(cno);
		int bno = dto.getBno();
		dao.deleteCommend(cno);

		
		ActionForward forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno);
		forward.setRedirect(true);
		
		return forward;
		
	}

}

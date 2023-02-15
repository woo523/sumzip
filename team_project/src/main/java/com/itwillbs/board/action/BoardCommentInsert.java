package com.itwillbs.board.action;



import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommendDAO;
import board.CommendDTO;

public class BoardCommentInsert implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentInsert execute()");
		request.setCharacterEncoding("utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int no = Integer.parseInt(request.getParameter("no"));
		String commend = request.getParameter("commend");
		int rno = Integer.parseInt(request.getParameter("rno"));

		Timestamp cdate = new Timestamp(System.currentTimeMillis());

		CommendDTO dto = new CommendDTO();
		dto.setBno(bno);
		dto.setNo(no);
		dto.setRno(rno);
		dto.setCommend(commend);
		dto.setCdate(cdate);

		CommendDAO dao = new CommendDAO();
		dao.insertCommend(dto);

		ActionForward forward = new ActionForward();
		forward.setPath("BoardContent.bo?bno="+bno);
		forward.setRedirect(true);
		
		return forward;

	}

}

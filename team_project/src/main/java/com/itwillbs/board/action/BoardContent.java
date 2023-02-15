package com.itwillbs.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.BoardDAO;
import board.BoardDTO;
import board.CommendDAO;
import board.ReplyDAO;
import board.ReplyDTO;
import member.UserDAO;
import member.UserDTO;

public class BoardContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int bno=Integer.parseInt(request.getParameter("bno"));

		BoardDAO bdao=new BoardDAO();
		BoardDTO bdto=bdao.getBoard(bno);
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		int no = udto.getNo();

		ReplyDAO rdao = new ReplyDAO();

		int count = rdao.countReply(bno); // 댓글 개수 계산

		ArrayList<ReplyDTO> replylist = rdao.getReplyList(bno);

		CommendDAO cdao = new CommendDAO();
		
		request.setAttribute("bdto", bdto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}

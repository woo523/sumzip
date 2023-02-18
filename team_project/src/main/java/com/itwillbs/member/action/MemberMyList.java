package com.itwillbs.member.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.ReviewDAO;
import member.ReviewDTO;
import member.UserDAO;
import member.UserDTO;
import products.AppointmentDAO;
import products.AppointmentDTO;
import products.SalesDAO;
import products.SalesDTO;

public class MemberMyList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberMyList execute()");
		
		// 아이디 세션 값
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		session.setAttribute("id", id);

		// 유저정보 no 값
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUser(id);
		int no = udto.getNo();
		
		// 판매정보 => 입실일 / 퇴실일
		SalesDAO salesdao = new SalesDAO();
		SalesDTO salesdto = salesdao.getSales(no);
		
		String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date appointIndate = salesdto.getIndate(); // 체크인 날짜
		Date appointOutdate = salesdto.getOutdate(); // 체크아웃 날짜
		Date today = new Date(formatter.parse(todayfm).getTime()); // 오늘 날짜
		
		request.setAttribute("appointIndate", appointIndate);
		request.setAttribute("appointOutdate", appointOutdate);
		request.setAttribute("today", today);
		
		
		ReviewDAO rdao = new ReviewDAO();
		
		// 페이징
		AppointmentDAO adao = new AppointmentDAO();
		
		int pageSize = 2;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum="1";
		}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize+1; 
		int endRow = startRow + pageSize-1;
		
		ArrayList<AppointmentDTO> userappointmentlist = adao.getAppointmentList(no, startRow, pageSize);
		
		// 한 화면에 보여줄 '페이지 개수' 구하기
		int pageBlock = 5;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		
		int endPage = (startPage+pageBlock)-1;
		
		int count = rdao.getReviewCount();
		
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		// request에 가져온 데이터 담기
		request.setAttribute("userappointmentlist", userappointmentlist);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		// 이동
		ActionForward forward = new ActionForward();
		forward.setPath("member/myList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}

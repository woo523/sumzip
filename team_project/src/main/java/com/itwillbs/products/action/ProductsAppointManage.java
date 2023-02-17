package com.itwillbs.products.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.products.action.ActionForward;

import member.UserDAO;
import member.UserDTO;
import products.AppointmentDAO;
import products.AppointmentDTO;
import products.ProductDAO;
import products.ProductDTO;
import products.SalesDAO;
import products.SalesDTO;

public class ProductsAppointManage implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductsAppointManage execute()");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		UserDAO dao=new UserDAO();
	 	UserDTO dto=dao.getUser(id);
	 	AppointmentDAO dao2=new AppointmentDAO();
	 	SalesDAO dao3=new SalesDAO();
	 	SalesDTO dto3=dao3.getSales(dto.getNo());
	 	ProductDAO dao4=new ProductDAO();
	 	ProductDTO dto4=dao4.getProduct(dto3.getPno());
	 	
	 	
	     
	 		int no=dto.getNo();
		 	int pageSize=10;
	     
	 
	 String pageNum=request.getParameter("pageNum");
	 if(pageNum==null){
	 	//=> 페이지번호가 없으면 1페이지 설정
	 	pageNum="1";
	 }
	 int currentPage=Integer.parseInt(pageNum);
	// 시작하는 행번호 구하기
	// pageNum(currentPage)	   pageSize	=> startRow
//	 	1						10		=> 	(1-1)*10+1 => 0*10+1 =>  0+1 -> 1  ~10
//	 	2						10		=> 	(2-1)*10+1 => 1*10+1 => 10+1 -> 11 ~20
//	 	3						10		=> 	(3-1)*10+1 => 2*10+1 => 20+1 -> 21 ~30
	int startRow=(currentPage-1)*pageSize+1;
	// 끝나는 행번호 구하기
	// startRow	pageSize	=>	endRow
//			1		10		=>	1+10-1	=>	10
//	 		11		10		=>	11+10-1	=>	20
//			21		10		=>	21+10-1	=>	30
	int endRow = startRow+pageSize-1;
	 	
	 	ArrayList<AppointmentDTO> AppointmentList=dao2.getAppointmentList(no, startRow, pageSize);
	 	
		
			
			int pageBlock=10;
			// 시작하는 페이지 번호 구하기
			// currentPage			pageBlock	=> startPage
//					1~  10(0~9)			10		=>	(-1)/10*10+1 => 0*10+1 => 0+1 => 1
//					11~ 20(10~19)		10		=>	(-1)/10*10+1 => 1*10+1 => 10+1 => 11
//					21~ 30(20~29)		10		=>	(-1)/10*10+1 => 2*10+1 => 20+1 => 21

			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			// startPage pageBlock => endPage
//				1			10	   =>	1+10-1  => 10
//				11			10	   =>	11+10-1 => 20
//				21			10	   =>	21+10-1 => 30
			int endPage=startPage+pageBlock-1;
			//전체글 개수 select count(*) from Appointment
			// int 리턴할형 getAppointmentCount() 메서드 정의
			// getAppointmentCount() 메서드 호출
			int count = dao2.getAppointmentCount(no);
			//끝나는 페이지(endPage) = 10  <=  전체페이지(pageCount) = 2
			//전체페이지(pageCount) 구하기
			//=> 전체글의 개수 13 /글개수 10 => 1 페이지 +(0.3 글 남아있으면 1페이지 추가)
			//
			int pageCount=count/pageSize+(count%pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
	 	
	 	//dto 정보 들고 가기(request 정보를 담아가기)
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);
	 			request.setAttribute("dto", dto);
	 			request.setAttribute("AppointmentList", AppointmentList);
	 			request.setAttribute("dto3", dto3);
	 			request.setAttribute("dto4", dto4);
	 			
	 			ActionForward forward=new ActionForward();
	 			forward.setPath("products/appointManage.jsp");
	 			forward.setRedirect(false);
	 			return forward;
	}
	
}

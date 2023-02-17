package com.itwillbs.products.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.products.action.ActionForward;

import products.AppointmentDAO;
import products.AppointmentDTO;

public class ProductsAppointmentPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductsAppointmentPro execute()");
		
		//폼에서 입력한 내용이 서버에 전달 => request 내장객체 저장
				//request 한글처리
				request.setCharacterEncoding("utf-8");
				//폼에서 입력한 내용이 서버에 전달 => request 내장객체 저장
				
				int ano=Integer.parseInt(request.getParameter("ano"));
				int pno=Integer.parseInt(request.getParameter("pno"));
				int no=Integer.parseInt(request.getParameter("no"));
				int astatus=1;
				Timestamp adate=new Timestamp(System.currentTimeMillis());


				//dto에 값 저장
				AppointmentDTO dto=new AppointmentDTO();
				dto.setAno(ano);
				dto.setPno(pno);
				dto.setNo(no);
				dto.setAstatus(astatus);
				dto.setAdate(adate);

				AppointmentDAO dao=new AppointmentDAO();
				//DB에 예약정보 저장
				dao.insertAppointment(dto);

				//예약관리 페이지로 이동
//				response.sendRedirect("ProductsAppointManage.pr");
		
				
		ActionForward forward=new ActionForward();
		forward.setPath("ProductsAppointManage.pr");
		forward.setRedirect(true);
				
		return forward;	
	}
	
}

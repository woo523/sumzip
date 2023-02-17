package com.itwillbs.products.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.products.action.ActionForward;

import products.AppointmentDAO;
import products.AppointmentDTO;

public class ProductsAppointManagePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductsAppointManagePro execute()");

		
		// 가져온 넘버값 num에 저장
		int num=Integer.parseInt(request.getParameter("num"));

		// 체크
		AppointmentDAO dao=new AppointmentDAO();
		AppointmentDTO dto=dao.AppointmentCheck(num);
		// AppointmentDTO dto=(AppointmentDTO)request.getAttribute("dto");
		ActionForward forward=null;
		if(dto != null){
			// 일치 확인
			// 리턴값없음 deleteAppointment(int num) 메서드 정의 
			// dao.deleteAppointment(num) 메서드 호출
			dao.deleteAppointment(num);
			// => 세션값 초기화
//		 	session.invalidate();		
			// => appointManage.jsp 이동
			response.sendRedirect("appointManage.jsp");
		}else{
			// 일치하지 않을 시
		    
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('예약리스트에 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			forward=null;
		    
		}		
		
		return forward;
	}

}

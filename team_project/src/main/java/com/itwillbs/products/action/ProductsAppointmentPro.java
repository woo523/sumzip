package com.itwillbs.products.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.products.action.ActionForward;

import products.AppointmentDAO;
import products.AppointmentDTO;
import products.ProductDAO;
import products.ProductDTO;
import products.SalesDAO;
import products.SalesDTO;

public class ProductsAppointmentPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("ProductsAppointmentPro execute()");

			int pno=Integer.parseInt(request.getParameter("pno"));
			int no=Integer.parseInt(request.getParameter("no"));
			Timestamp adate=new Timestamp(System.currentTimeMillis());
			Timestamp sdate=new Timestamp(System.currentTimeMillis());
				
			String indate = request.getParameter("indate");
			String outdate = request.getParameter("outdate");
				
			// 총 숙박일 계산
			LocalDate startDate = LocalDate.parse(indate);
			LocalDate endDate = LocalDate.parse(outdate);
		   	int daycount = (int)startDate.until(endDate, ChronoUnit.DAYS);
				
		   	// 총 숙박료 계산
			ProductDAO pdao = new ProductDAO();
			ProductDTO pdto = pdao.getProduct(pno);
			int sprice = pdto.getPprice()*daycount;
				
			//Appointment dto에 값 저장
			AppointmentDTO adto=new AppointmentDTO();
			adto.setPno(pno);
			adto.setNo(no);
			adto.setAdate(adate);

			AppointmentDAO dao=new AppointmentDAO();
			// DB에 예약정보 저장
			dao.insertAppointment(adto);

			// 저장된 예약정보 ano 가져오기
			adto = dao.getAppointment(no, pno);
			int ano = adto.getAno();
			
			// Sales dto에 값 저장
			SalesDTO sdto = new SalesDTO();
			sdto.setAno(ano);
			sdto.setPno(pno);
			sdto.setNo(no);
			sdto.setSdate(sdate);
			sdto.setIndate(indate);
			sdto.setOutdate(outdate);
			sdto.setSprice(sprice);
			
			SalesDAO sdao = new SalesDAO();
			sdao.insertSales(sdto);
			
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('총 "+daycount+"박 숙박료 "+sprice+"원 입니다')");
			out.println("alert('예약 입금 대기 되었습니다.')");
			out.println("alert('입금 확인 후 예약 완료 됩니다.')");
			out.println("location.href='ProductsAppointManage.pr';");
			out.println("</script>");
			out.close();

	
		return null;	
	}
	
}

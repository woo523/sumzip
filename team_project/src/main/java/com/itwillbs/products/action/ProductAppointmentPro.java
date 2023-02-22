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

public class ProductAppointmentPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("ProductAppointmentPro execute()");

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
				
			SalesDAO sdao = new SalesDAO();
			// 퇴실일이 입실일보다 이전이거나 같은경우 경고창 띄우고 history.back
			boolean check1=sdao.checksSales1(pno, indate, outdate);
			if(check1==true){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('퇴실일이 입실일 이전이거나 입실일과 같습니다.')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}else {
			// 이미 예약된 경우 경고창 띄우고 history.back
			boolean check2=sdao.checksSales2(pno, indate, outdate);
			if(check2==true) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('이미 예약된 날짜입니다.')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			
			// 예약 가능한 날짜일 경우 진행
			}else if(check2!=true) {
			
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
			
			
			sdao.insertSales(sdto);
			
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('총 "+daycount+"박 숙박료 "+sprice+"원 입니다')");
			out.println("alert('예약 입금 대기 되었습니다.')");
			out.println("alert('입금 확인 후 예약 완료 됩니다.')");
			out.println("location.href='ProductAppointManage.pr';");
			out.println("</script>");
			out.close();
			}
			}
		return null;	
	}
	
}

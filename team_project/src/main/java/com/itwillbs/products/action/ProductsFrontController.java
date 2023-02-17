package com.itwillbs.products.action;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductsFrontController extends HttpServlet {
	
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("ProductsFrontController doGet()");
			//방식 상관없이 호출
			doProcess(request, response);
		}//doGet()

		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("ProductsFrontController doPost()");
			//방식 상관없이 호출
			doProcess(request, response);
		}//doPost()
		

		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("ProductsFrontController doProcess()");
			System.out.println("뽑은 가상주소 : " + request.getServletPath());
			String sPath=request.getServletPath();
		
			// 이동정보를 저장하는 자바파일 선언
			ActionForward forward=null;
			//부모 인터페이스 틀 선언
			Action action=null;
		
			if(sPath.equals("/ProductWriteForm.pr")) {
			
				forward=new ActionForward();
				forward.setPath("products/productWrite.jsp");
				forward.setRedirect(false);
			}else if(sPath.equals("/ProductWritePro.pr")) {
				action=new ProductWritePro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/ProductList.pr")){
				action = new ProductList();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/FileProductWriteForm.pr")) {
				// board/fwriteForm.jsp 이동
				forward=new ActionForward();
				forward.setPath("products/fwriteForm.jsp");
				forward.setRedirect(false);
			}else if(sPath.equals("/FileProductWritePro.pr")) {
				action=new FileProductWritePro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}	
			}else if(sPath.equals("/ProductContent.pr")) {
				action = new ProductContent();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
//			}else if(sPath.equals("/ProductUpdateForm.pr")) {
//				action=new ProductUpdateForm();
//				try {
//					forward=action.execute(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}else if(sPath.equals("/ProductUpdatePro.pr")) {
//				action=new ProductUpdatePro();
//				try {
//					forward=action.execute(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}else if(sPath.equals("/ProductDeletePro.pr")) {
//				action=new ProductDeletePro();
//				try {
//					forward=action.execute(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}	
			}if(sPath.equals("/ProductsAppointment.pr")) {
				
				//이동정보를 저장하는 자바파일 객체생성
				forward=new ActionForward();
				forward.setPath("products/appointment.jsp");
				forward.setRedirect(false);
				
			}else if(sPath.equals("/ProductsAppointmentPro.pr")) {
				
				// 부모 = 자식 객체생성
				action=new ProductsAppointmentPro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}else if(sPath.equals("/ProductsAppointManage.pr")) {
				action=new ProductsAppointManage();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/ProductsAppointManagePro.pr")) {
				action=new ProductsAppointManagePro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
	
//	------------------------------------------------------------------------		
			if(forward != null) {
				//이동방식비교
				if(forward.isRedirect()==true) {
					response.sendRedirect(forward.getPath());
				}else {
			
					RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
			        dispatcher.forward(request, response);
				}
			}
			
		}//doProcess
}

package com.itwillbs.admin.action;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.action.Action;
import com.itwillbs.admin.action.ActionForward;
import com.itwillbs.board.action.BoardContent;
//import com.itwillbs.board.action.BoardDeletePro;
import com.itwillbs.board.action.BoardList;
//import com.itwillbs.board.action.BoardUpdateForm;
//import com.itwillbs.board.action.BoardUpdatePro;
//import com.itwillbs.board.action.BoardWritePro;

public class AdminFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController doGet()");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController doPost()");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController doProcess()");
		System.out.println("뽑은 가상주소 : " + request.getServletPath());
		String sPath=request.getServletPath();
		
		Action action = null;
		ActionForward forward=null;
		
		if(sPath.equals("/AdminAppointNow.ad")) {
			action=new AdminAppointNow();
			try {
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/AdminAppointNowUpdate.ad")) {
			action=new AdminAppointNowUpdate();
			try {
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/AdminAppointNowDelete.ad")) {
			action=new AdminAppointNowDelete();
			try {
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(sPath.equals("/AdminMain.ad")) {
			forward = new ActionForward();
			forward.setPath("admin/adminMain.jsp");
			forward.setRedirect(false);				
		}else if(sPath.equals("/AdminLogin.ad")) {
			forward = new ActionForward();
			forward.setPath("admin/login.jsp");
			forward.setRedirect(false);		
		}else if(sPath.equals("/AdminLoginPro.ad")) {
			action = new AdminLoginPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if(sPath.equals("/AdminLogout.ad")) {
			action = new AdminLogout();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   }else if(sPath.equals("/AdminUserList.ad")) {
			action = new AdminUserList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   }else if(sPath.equals("/AdminUserDelete.ad")) {
			action = new AdminUserDelete();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	   }if(sPath.equals("/AdminBoardWriteForm.ad")) {
				// board/writeForm.jsp 이동
				forward=new ActionForward();
				forward.setPath("admin/boardWrite.jsp");
				forward.setRedirect(false);
			}else if(sPath.equals("/AdminBoardWritePro.ad")) {
				action=new AdminBoardWritePro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/AdminBoardList.ad")){
				action = new AdminBoardList();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/AdminBoardContent.ad")) {
				action = new AdminBoardContent();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/AdminBoardUpdateForm.ad")) {
				action=new AdminBoardUpdateForm();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/AdminBoardUpdatePro.ad")) {
				action=new AdminBoardUpdatePro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(sPath.equals("/AdminBoardDeletePro.ad")) {
				action=new AdminBoardDeletePro();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}		    
		
			}else if(sPath.equals("/AdminQnaList.ad")) {
				action=new AdminQnaList();
				try {
					forward=action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		
		
		
		
		
		
		
		
		
		if(forward!=null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response); // request값 들고감
			}
		}
		
	}//doProcess()
	
}

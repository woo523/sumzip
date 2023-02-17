package com.itwillbs.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.action.ActionForward;

public class AdminAppointNow implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminAppointNow execute()");
		
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("admin/appointNow.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}

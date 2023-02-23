package com.itwillbs.admin.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.UserDAO;
import member.UserDTO;

public class AdminUserCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		UserDAO dao=new UserDAO();
		UserDTO dto=dao.userCheck(id, pass);
		
		ActionForward forward = null;
		if(id != "admin"){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // html로 출력할 권한 받음
			out.println("<script type='text/javascript'>");
			out.println("alert('관리자페이지는 관리자만 접속할 수 있습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			
			forward = new ActionForward();
			forward.setPath("AdminLogin.ad");
			forward.setRedirect(false);	
			
		}else {
			forward = new ActionForward();
			forward.setPath("admin/adminMain.jsp");
			forward.setRedirect(false);		
		}
		
		return forward;
				
	}

}

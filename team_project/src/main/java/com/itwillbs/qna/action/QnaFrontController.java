package com.itwillbs.qna.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnaFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaFrontController doGet()");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaFrontController doPost()");
		doProcess(request,response);
	}
		
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaFrontController doProcess()");		
		
		// 가상주소 뽑아오기
		System.out.println("뽑은 가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		// 가상주소 비교
		Action action=null; 
		ActionForward forward=null;
		
	if(sPath.equals("/QnaList.qa")) {
		action = new QnaList();
		try {
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
	}else if(sPath.equals("/QnaQuestion.qa")) {
		action = new QnaQuestion();
		try {
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}else if(sPath.equals("/QnaWriteForm.qa")) {
		// board/writeForm.jsp 이동
		forward=new ActionForward();
		forward.setPath("qna/question_writeForm.jsp");
		forward.setRedirect(false);
	}else if(sPath.equals("/QnaWritePro.qa")) {
		action = new QnaWritePro();
		try {
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}
}
	


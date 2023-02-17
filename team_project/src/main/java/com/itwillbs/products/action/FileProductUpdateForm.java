package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import products.ProductDAO;
import products.ProductDTO;



public class FileProductUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileProductUpdateForm execute()");
		
		int pno=Integer.parseInt(request.getParameter("pno"));
		
		ProductDAO dao=new ProductDAO();
		
		//file 추가
		ProductDTO dto=dao.getProduct(pno);
		
		// dto request 담아서 이동 => board/updateForm.jsp
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("products/fupdateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

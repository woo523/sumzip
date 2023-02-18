package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import member.UserDTO;
import products.ProductDAO;
import products.ProductDTO;

public class ProductContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductContent execute()");
		
		int pno=Integer.parseInt(request.getParameter("pno"));
		
		ProductDAO dao=new ProductDAO();
		
		ProductDTO dto=dao.getProduct(pno);
		
		UserDTO udto=new UserDTO();
		
		request.setAttribute("dto", dto);
		request.setAttribute("udto", udto);

		ActionForward forward=new ActionForward();
		forward.setPath("board/content.jsp");
		forward.setRedirect(false);
		return forward;
	}

}

package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import products.ProductDAO;
import products.ProductDTO;

public class ProductUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductUpdatePro execute()");
		
		request.setCharacterEncoding("utf-8");

		//파라미터 변수저장
		int pno=Integer.parseInt(request.getParameter("pno"));
		String pname=request.getParameter("pname");
		int checkin=Integer.parseInt(request.getParameter("checkin"));
		int checkout=Integer.parseInt(request.getParameter("checkout"));
		int pprice=Integer.parseInt(request.getParameter("pprice"));
		int max_men=Integer.parseInt(request.getParameter("max_men"));
		int expiration=Integer.parseInt(request.getParameter("expiration"));
		String ppic1=request.getParameter("ppic1");
		String ppic2=request.getParameter("ppic2");
		String ppic3=request.getParameter("ppic3");
		String caution=request.getParameter("caution");
		String pexplain=request.getParameter("pexplain");

		ProductDTO dto=new ProductDTO();

		// set메서드 호출 ->저장
		dto.setPno(pno);
		dto.setPname(pname);
//		dto.setCheckin(checkin);
//		dto.setCheckout(checkout);
		dto.setPprice(pprice);
		dto.setMax_men(max_men);
		dto.setExpiration(expiration);
		dto.setPpic1(ppic1);
		dto.setPpic2(ppic2);
		dto.setPpic3(ppic3);
		dto.setCaution(caution);
		dto.setPexplain(pexplain);

		ProductDAO dao=new ProductDAO();

		dao.updateProduct(dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("ProductList.pr");
		forward.setRedirect(true);
		return forward;		
	}

}

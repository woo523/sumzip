package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import products.ProductDAO;
import products.ProductDTO;

public class ProductUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductUpdatePro execute()");
		
		String uploadPath=request.getRealPath("/upload");
		System.out.println(uploadPath);		

		int maxSize=10*1024*1024;
		
		MultipartRequest multi=new MultipartRequest
		(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		//파라미터 변수저장
		int pno=Integer.parseInt(multi.getParameter("pno"));
//		int no=Integer.parseInt(multi.getParameter("no"));
		String pname=multi.getParameter("pname");
		String checkin=multi.getParameter("checkin");
		String checkout=multi.getParameter("checkout");
		int pprice=Integer.parseInt(multi.getParameter("pprice"));
		int max_men=Integer.parseInt(multi.getParameter("max_men"));
		int expiration=Integer.parseInt(multi.getParameter("expiration"));
		String ppic1=multi.getParameter("ppic1");
		String ppic2=multi.getParameter("ppic2");
		String ppic3=multi.getParameter("ppic3");
		String caution=multi.getParameter("caution");
		String pexplain=multi.getParameter("pexplain");
		
		if(ppic1==null) {
			ppic1=multi.getParameter("oldppic1");
//		}if(ppic2==null) {
//			ppic2=multi.getParameter("oldppic2");
//		}if(ppic3==null) {
//			ppic3=multi.getParameter("oldppic3");
		}

		ProductDTO dto=new ProductDTO();

		// set메서드 호출 ->저장
		dto.setPno(pno);
//		dto.setNo(no);
		dto.setPname(pname);
		dto.setCheckin(checkin);
		dto.setCheckout(checkout);
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

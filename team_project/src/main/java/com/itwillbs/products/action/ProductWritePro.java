package com.itwillbs.products.action;

import java.sql.Timestamp;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import products.ProductDAO;
import products.ProductDTO;

public class ProductWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductWritePro execute()");
		//products/productwritePro.jsp
		String uploadPath=request.getRealPath("/upload");
		System.out.println(uploadPath);

		int maxSize=10*1024*1024;
		
		// 업로드 파일이름 동일할때 => 파일이름변경(DefaultFileRenamePolicy)
		MultipartRequest multi=new MultipartRequest
		(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

		// [all 컬럼] 변수에 저장
		// int no = Integer.parseInt(request.getParameter("no"));
		int no=2;
		String pname= request.getParameter("pname");
		String paddress= request.getParameter("paddress");
		int ppostnum= Integer.parseInt(request.getParameter("ppostnum"));
		String paddress2= request.getParameter("paddress2");
		String ptel= request.getParameter("ptel");
		String checkin=request.getParameter("checkin");
		String checkout=request.getParameter("checkin");
		int pprice= Integer.parseInt(request.getParameter("pprice"));
		int max_men= Integer.parseInt(request.getParameter("max_men"));
		int expiration= Integer.parseInt(request.getParameter("expiration"));
		Timestamp reser_date=new Timestamp(System.currentTimeMillis());
		String ppic1= request.getParameter("ppic1");
		String ppic2= request.getParameter("ppic2");
		String ppic3= request.getParameter("ppic3");
		String caution= request.getParameter("caution");
		String pexplain= request.getParameter("pexplain");

		ProductDTO dto=new ProductDTO();

		// 값 저장
		// dto.setPno(pno);
		dto.setNo(no);
		dto.setPname(pname);
		dto.setPaddress(paddress);
		dto.setPpostnum(ppostnum);
		dto.setPaddress2(paddress2);
		dto.setPtel(ptel);
		dto.setCheckin(checkin);
		dto.setCheckout(checkout);
		dto.setPprice(pprice);
		dto.setMax_men(max_men);
		dto.setExpiration(expiration);
		dto.setReser_date(reser_date);
		dto.setPpic1(ppic1);
		dto.setPpic2(ppic2);
		dto.setPpic3(ppic3);
		dto.setCaution(caution);
		dto.setPexplain(pexplain);

		ProductDAO dao=new ProductDAO();

		dao.insertProduct(dto);

		// 글목록 이동
		ActionForward forward=new ActionForward();
		forward.setPath("ProductList.pr");
		forward.setRedirect(true);
		return forward;
	}

}

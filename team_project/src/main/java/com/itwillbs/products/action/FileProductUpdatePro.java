package com.itwillbs.products.action;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import products.ProductDAO;
import products.ProductDTO;

public class FileProductUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileProductUpdatePro execute()");
		
		//객체생성
				// 1. request 
				// 2. 웹서버 업로드 폴더 위치 => webapp - upload 폴더 만들기
				String uploadPath=request.getRealPath("/upload");
				System.out.println(uploadPath);
				// 3. 파일크기  10M
				int maxSize=10*1024*1024;
				// 4. 한글처리
		// 5. 업로드 파일이름 동일할때 => 파일이름변경(DefaultFileRenamePolicy)
		MultipartRequest multi=new MultipartRequest
		(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		
		// multi  =>  파라미터 => 변수 저장 
				int pno=Integer.parseInt(multi.getParameter("pno"));
				//첨부파일
				// 추가 -> 업로드된 파일이름 정보
				String ppic1=multi.getFilesystemName("ppic");
				String pname=multi.getParameter("pname");
				int pprice= Integer.parseInt(multi.getParameter("pprice"));
				String pexplain=multi.getParameter("pexplain");
				// 수정할 업로드 파일이 없으면 기존파일 유지
				if(ppic1==null) {
					ppic1=multi.getParameter("oldppic1");
				}
				
				// BoardDTO 객체생성
				ProductDTO dto=new ProductDTO();
				// set메서드호출 num, name, subject, content 저장
				dto.setPno(pno);
				// ppic ->file 
				dto.setPpic1(ppic1);
				dto.setPname(pname);
				dto.setPprice(pprice);
				dto.setPexplain(pexplain);

				// BoardDAO 객체생성
				ProductDAO dao=new ProductDAO();
				// 리턴할형 없음 fupdateBoard(BoardDTO dto) 메서드 정의
				// fupdateBoard(dto) 메서드 호출
				dao.fupdateProduct(dto);

				// list.jsp 이동
				ActionForward forward=new ActionForward();
				forward.setPath("BoardList.bo");
				forward.setRedirect(true);
				return forward;
	}

}

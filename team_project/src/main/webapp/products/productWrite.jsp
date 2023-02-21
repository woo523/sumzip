
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>products/productWrite.jsp</title>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />


<!-- 상품등록 하기 -->
<%

ProductDTO dto=new ProductDTO();

String id=(String)session.getAttribute("id");
// String utype=(String)session.getAttribute("utype");

if(id==null){
	response.sendRedirect("MemberLogin.me");	
}else if(id.equals("owner")){
	
}else{
	%>
	<script type="text/javascript">
	alert("글쓰기 권한이 없습니다.");
	history.back();
	</script>
	<%
}
%>

<h3>상품등록</h3>

<div class="content-main">
		<div class="row">
			<div class="col-sm-9">
				<hr>
				<div class="bg-white rounded shadow-sm container p-3">
					<form action="ProductWritePro.pr" method="POST" enctype="multipart/form-data"
						 class="form-horizontal" role="form">

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>유저번호</label> <input type="text" name="no" value="<%=id%>"
									readonly>
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>펜션이름</label> <input type="text" name="pname">
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>펜션주소</label> <input type="text" name="paddress" >
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>우편번호</label> <input type="text" name="ppostnum"> 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>상세주소</label> <input type="text" name="paddress2"> 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>전화번호</label> <input type="tel" name="ptel"> 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>체크인시간</label> <input type="time" name="checkin" > 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>체크아웃시간</label> <input type="time" name="checkout" > 
							</div>		
						</div>						
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>가격</label> <input type="text" name="pprice" > 
							</div>		
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>최대숙박인원</label> <input type="text" name="max_men" > 
							</div>		
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>등록유효기간</label> <input type="text" name="expiration" > 
							</div>		
						</div>
																								
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>펜션사진1</label> <input type="file" name="ppic1" > 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>펜션사진2</label> <input type="file" name="ppic2" > 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>펜션사진3</label> <input type="file" name="ppic3" > 
							</div>		
						</div>												
	
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>주의사항</label> <input type="text" name="caution" > 
							</div>		
						</div>
						
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>펜션 설명</label> <input type="text" name="pexplain" > 
							</div>		
						</div>
										
							<input type="submit" class="btnChange" value="상품등록">											
<!-- 						<div class="btnChange"> -->
<!-- 							<a href="ProductWritePro.pr"><input type="button"  -->
<!-- 								value="상품등록"></a>  -->
<!-- 						</div> -->
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>

</body>
</html>
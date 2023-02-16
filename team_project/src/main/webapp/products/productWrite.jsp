
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
	response.sendRedirect("../member/login.jsp");
	
}
%>

<h5>상품등록</h5>

<div class="content-main">
		<div class="row">
			<div class="col-sm-9">
				<hr>
				<div class="bg-white rounded shadow-sm container p-3">
					<form method="POST" action="updateAction" name="updateForm"
						onsubmit="return updateValidate();" class="form-horizontal"
						role="form">
						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>상품번호</label> <input type="text" name="pno"
									value="<%=dto.getPno() %>" readonly>
							</div>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-3">
								<label>유저번호</label> <input type="text" name="no" value="<%=dto.getNo()%>"
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
								<label>펜션사진</label> <input type="file" name="productImage" > 
							</div>		
						</div>
						
						<div class="btnChange">
							<a href="productwritePro.jsp"><input type="button" name="product"
								value="상품등록"></a> 
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />

</body>
</html>
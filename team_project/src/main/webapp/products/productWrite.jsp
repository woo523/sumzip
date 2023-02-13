
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
<!-- <form action="productwritePro.jsp" method="post"> -->

<!-- <table border="1"> -->
<!-- <tr><td>유저번호</td> -->
<%--     <td><input type="text" name="name" value=<%=id %> readonly></td></tr> --%>
<!-- <tr><td>펜션이름</td> -->
<!--     <td><input type="text" name="pname" ></td></tr>    -->
<!-- <tr><td>펜션주소</td> -->
<!--     <td><input type="text" name="paddress" ></td></tr>  -->
<!-- <tr><td>우편번호</td> -->
<!--     <td><input type="text" name="ppostnum"></td></tr> -->
<!-- <tr><td>상세주소</td>    -->
<!--     <td><input type="text" name="paddress2"></td></tr> -->
<!-- <tr><td>전화번호</td>  -->
<!--     <td><input type="text" name="ptel"></td></tr> -->
<!-- <tr><td>체크인시간</td>     -->
<!--     <td><input type="text" name="checkin"></td></tr> -->
<!-- <tr><td>체크아웃시간</td>    -->
<!--     <td><input type="text" name="checkout"></td></tr> -->
<!-- <tr><td>가격</td>    -->
<!--     <td><input type="text" name="pprice"></td></tr> -->
<!-- <tr><td>최대숙박인원</td> -->
<!--     <td><input type="text" name="max_men"></td></tr> -->
<!-- <tr><td>등록유효기간</td> -->
<!--     <td><input type="text" name="expiration"></td></tr> -->
<!-- <tr><td>숙소등록일</td> -->
<!--     <td><input type="text" name="datetime"></td></tr> -->
<!-- <tr><td>펜션사진1</td> -->
<!--     <td><input type="text" name="ppic1"></td></tr> -->
<!-- <tr><td>펜션사진1</td> -->
<!--     <td><input type="text" name="ppic2"></td></tr> -->
<!-- <tr><td>펜션사진1</td> -->
<!--     <td><input type="text" name="ppic3"></td></tr>     -->
<!-- <tr><td>주의사항</td> -->
<!--     <td><input type="text" name="caution"></td></tr>  -->
<!-- <tr><td>펜션 설명</td>     -->
<!--     <td><textarea name="pexplain" rows="10" cols="20"></textarea></td></tr> -->
<!-- <tr><td colspan="2"><input type="submit" value="상품등록"></td></tr>     -->
<!-- </table> -->


<!-- </form> -->
</body>
</html>
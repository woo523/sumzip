<%@page import="products.ProductDAO"%>
<%@page import="products.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@1,300&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>board/boardupdateForm.jsp</title>
<style>
article{
	font-family: 'NanumSquareNeo';
  	max-width: 1000px;
 	margin: 0 auto;
 	padding: 20px;
 	margin-bottom: 50px;
}
#wrap{ 
	max-width: 800px;
	margin: 0 auto;
	margin-bottom: 50px; 

} 

td.thead {
	background: #99b19c;
	font-weight: bold;
	color: #FFFFFF;
	text-align: center;
	
}
/* td.tcontent{ */
/* text-align: center; */
/* background-color: white; */
/* } */

.heading-section {
    font-size: 35px;
    color: #393939;
    line-height: 1.5;
    font-weight: 400;
    font-family: "Poppins", Arial, sans-serif;
    font-weight: bold;
    text-align: center;
    margin: 10px; 
     
}

.form-control {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #99b19c;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

input.form-control[readonly]{
	background-color: #99b19c;
	opacity: 1;
    color: #fff;
    font-weight: bold;
}

#table_search{
	float: right;
   
}
textarea.form-control{
	resize: none;  
}

input[type="text"],
input[type="time"],
input[type="file"], 
select {
          width: 100%;
          padding: 15px;
/*           margin-bottom: 10px; */
          font-size: 16px;
          border: 1px solid #ccc;
          border-radius: 5px;
        }

</style>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<%
// int pno=Integer.parseInt(request.getParameter("pno"));

// ProductDAO dao=new ProductDAO();

// ProductDTO dto=dao.getProduct(pno);

ProductDTO dto=(ProductDTO)request.getAttribute("dto");
%>
<article>
<div id="wrap">
<h2 class="heading-section">등록펜션 수정</h2>

<form action="ProductUpdatePro.pr" method="post" enctype="multipart/form-data">
<input type="hidden" name="pno" value="<%=dto.getPno()%>">
<table border="1" class="table">
<!-- <thead class="thead-primary"> -->
<!-- <tr><td>유저번호</td> -->
<%--     <td><input type="text" name="no" value="<%=dto.getNo()%>" readonly></td></tr> --%>
<tr><td class="thead">펜션이름</td>
    <td class="tcontent"><input type="text" name="pname" value="<%=dto.getPname() %>"></td></tr>
<tr><td class="thead">체크인</td>
    <td class="tcontent"><input type="time" name="checkin" value="<%=dto.getCheckin()%>"></td></tr>
<tr><td class="thead">체크아웃</td>
    <td class="tcontent"><input type="time" name="checkout" value="<%=dto.getCheckout()%>"></td></tr>
<tr><td class="thead">가격</td>
    <td class="tcontent"><input type="text" name="pprice" value="<%=dto.getPprice() %>"></td></tr>   
<tr><td class="thead">최대숙박인원</td>
    <td class="tcontent"><input type="text" name="max_men" value="<%=dto.getMax_men() %>"></td></tr>    
<tr><td class="thead">펜션사진1</td>
    <td class="tcontent"><input type="file" name="ppic1" value="<%=dto.getPpic1()%>">
    <input type="hidden" name="oldppic1" value="<%=dto.getPpic1()%>">
    </td></tr>
<tr><td class="thead">펜션사진2</td>
    <td class="tcontent"><input type="file" name="ppic2" value="<%=dto.getPpic2() %>">
    <input type="hidden" name="oldppic2" value="<%=dto.getPpic2()%>">    
    </td></tr>
<tr><td class="thead">펜션사진3</td>
    <td class="tcontent"><input type="file" name="ppic3" value="<%=dto.getPpic3() %>">
        <input type="hidden" name="oldppic3" value="<%=dto.getPpic3()%>">
        </td></tr>
<tr><td class="thead">주의사항</td>
    <td class="tcontent"><textarea name="caution" rows="10" cols="70"><%=dto.getCaution() %></textarea></td></tr>                      
<tr><td class="thead">펜션설명</td>
    <td class="tcontent"><textarea name="pexplain" rows="10" cols="70"><%=dto.getPexplain()%></textarea></td></tr>
<!-- <tr><td colspan="2"><input type="submit" value="상품등록 수정"></td></tr> -->   
<!-- </thead> -->
</table>
<div id="table_search">
<input type="submit" class="btn btn-outline-success" value="수정하기"> 
</div>

</form>
</div>
</article>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
</body>
</html>
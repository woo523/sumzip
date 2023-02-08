
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글/대댓글</title>


<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
<script type="text/javascript">

 $(document).ready(function(){
	 $.ajax({
			url:"replyJsonarr.jsp",
			dataType:"json",
			success:function(arr){
				$.each(arr,function(index,item){
					$('.reply').append('<span id="rno" style="display:inline-block; width:30px;">'+item.rno+
					'</span><span style="display:inline-block; width:400px;">'+item.riply+'</span><span>'
					+item.rdate+'</span><span> <a href="replyUpdateForm.jsp?rno='+item.rno+
					'" target="blank">수정</a> | <a href="replyDeletePro.jsp?rno='+item.rno+'">삭제<a> </span><br>');
					
				});// each
			}// success
		}); //ajax
	 }); // ready

 </script>



</head>
<body>
<%
//int bno = Integer.parseInt(request.getParameter("bno"));
int bno=1;
//String id=(String)session.getAttribute("id");
// UserDAO dao = new UserDAO();
// UserDTO dto = dao.getUser(id);
//int no = dto.getNo();
int no=1;
%>

<h2>댓글쓰기</h2>

<form action="replyInsertpro.jsp" method ="post">
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="bno" value="<%=bno%>">
<textarea rows="3" cols="80" name="riply" ></textarea>
<input type="submit" value="댓글쓰기">
</form>
<div class="reply">

<div class="rereply">
</div>
</div>

</body>
</html>
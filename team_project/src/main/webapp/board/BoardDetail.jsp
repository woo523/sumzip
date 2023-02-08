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
					$('table').append('<tr><td>'+item.riply+'</td><td>'+item.rdate+'</td></tr>');
				});// each
			}// success
		}); //ajax
	 }); // ready

 </script>

</head>
<body>
<%
int bno=1;
// int bno = Integer.parseInt(request.getParameter("bno"));
int no=1;
%>

<h2>댓글쓰기</h2>
<form action="replyInsertpro.jsp" method ="post">
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="bno" value="<%=bno%>">
<textarea rows="3" cols="80" name="riply" ></textarea>
<input type="submit" value="댓글쓰기">
</form>
<table>
</table>

</body>
</html>
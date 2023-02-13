<%@page import="board.CommendDTO"%>
<%@page import="board.CommendDAO"%>
<%@page import="board.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.ReplyDAO"%>
<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">

<!-- <script type="text/javascript" src="../script/jquery-3.6.3.js"></script> -->
<!-- <script type="text/javascript"> -->

<!--   $(document).ready(function(){ -->
<!--  	 $.ajax({ -->
<!--  			url:"replyJsonarr.jsp", -->
<!--  			dataType:"json", -->
<!--  			success:function(arr){ -->
<!--  				$.each(arr,function(index,item){ -->
<!--  					$('.comment1').append('<div><span>'+item.rdate+'</span><h5>'+item.id+'</h5><p>'+item.riply+ -->
<!--  					'</p><a href="replyUpdateForm.jsp?rno='+item.rno+ -->
<!--  					'"class="comment-btn">수정</a><a href="replyDeletePro.jsp?rno='+item.rno+'" class="comment-btn">삭제</a></div>'); -->

<!--  				});// each -->
<!--  			}// success -->
<!--  		}); //ajax	// 댓글 리스트 -->

<!--   }); // ready -->

<!--  </script> -->



</head>
<body>
<%
//int bno = Integer.parseInt(request.getParameter("bno"));
int bno=1; // 임시값
//String id=(String)session.getAttribute("id");
// UserDAO dao = new UserDAO();
// UserDTO dto = dao.getUser(id);
// int no = dto.getNo();
int no=1; // 임시값
String id="hong1234"; // 임시값
UserDAO dao = new UserDAO();
UserDTO dto = dao.getUser(id);
ReplyDAO rdao = new ReplyDAO();

int count = rdao.countReply(bno); // 댓글 개수 계산

ArrayList<ReplyDTO> replylist = rdao.getReplyList(bno);

CommendDAO cdao = new CommendDAO();

%>
   <section class="blog-details-section">
        <div class="conainer">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                       <div class="leave-comment">
<!-- 댓글쓰기 폼 -->
                            <h4>댓글 쓰기</h4>
                            <form action="replyInsertpro.jsp" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" value="<%=id%>" readonly>
                                    </div>
                                    <div class="col-lg-12 text-center">
                                        <textarea placeholder="댓글을 입력하세요" name="riply"></textarea>
                                        <button type="submit" class="site-btn">댓글 쓰기</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="comment-option">
<!-- 댓글 갯수 -->
                            <h4><%=count%> Comments</h4> 

<!-- 댓글 리스트 -->                       
                            <div class="single-comment-item first-comment">                             
                                <div class="sc-text">
								<% for(int i=0;i<replylist.size();i++){ 
									ReplyDTO rdto = replylist.get(i);
									dto = dao.getUserNo(rdto.getNo());
									%>
									<div><span><%=rdto.getRdate()%></span>
	                                <h5><%=dto.getId()%></h5>
	                                <p><%=rdto.getRiply()%></p>
	                                <a href="CommendForm.jsp?rno=<%=rdto.getRno()%>"class="comment-btn">답댓글</a>
	                                <%if(no==rdto.getNo()){ %>
	                                <a href="replyUpdateForm.jsp?rno=<%=rdto.getRno()%>&no=<%=rdto.getNo()%>"class="comment-btn">수정</a>
	                                <a href="replyDeletePro.jsp?rno=<%=rdto.getRno()%>" class="comment-btn">삭제</a><%} %></div>				
<!-- 대댓글 리스트 -->
									<%			
									ArrayList<CommendDTO> commendlist = cdao.getCommendList(rdto.getRno());
									for(int j=0;j<commendlist.size();j++){
										CommendDTO cdto = commendlist.get(j);
										if(rdto.getRno()==cdto.getRno()){
											dto = dao.getUserNo(cdto.getNo());
									if(j==0){%>
								<Br><div class="single-comment-item reply-comment"><%}%>
                                <div class="sc-text">
                                    <span><%=cdto.getCdate()%></span>
                                    <h5><%=dto.getId()%></h5>
                                    <p><%=cdto.getCommend()%></p>
                                    <%if(no==cdto.getNo()){ %>
                                    <a href="CommendUpdateForm.jsp?cno=<%=cdto.getCno()%>&no=<%=cdto.getNo()%>" class="comment-btn like-btn">수정</a>
                                    <a href="CommendDeletePro.jsp?cno=<%=cdto.getCno()%>" class="comment-btn reply-btn">삭제</a><%} %>
                                </div>
                                <%if(j==commendlist.size()-1){%>
                                </div>

										<%}}}} %>
                            
						        </div>  
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
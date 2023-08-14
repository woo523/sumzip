# 섬집🏡
제주도 펜션 예약사이트
<img width="976" alt="image" src="https://github.com/woo523/sumzip/assets/124018409/08b49d0f-f845-4d08-9ba4-0ad5a8af2c03">

## 호스팅 사이트 : http://itwillbs8.cafe24.com/sumzip/Main.me 
- 관리자 (ID : admin, PW : 123)
- 일반회원 (ID : jung123, PW : 234)
- 사장님회원 (ID : jungjy123, PW : 123)

프로젝트 기간 : 23년 1월 30일 ~ 2월 28일

## 담당 기능
메인 펜션 리스트 / 공지사항 - 댓글, 답댓글 / 내 펜션 예약조회(사장님) / 지역별 예약통계

### 개발환경
* 개발도구 : eclipse, Workbench
* 언어 : JAVA(SE-11), JSP, HTML, CSS, JAVASCRIPT
* 라이브러리 : JQUERY(3.6.3)
* DB : MySQL v8.0.17

### JSP MVC2 패턴 적용

## 개발 코드

### 💡 메인 펜션 리스트

* Model
  * 펜션 DTO [ProductDTO.java](team_project/src/main/java/products/ProductDTO.java)
  * 펜션 DAO [ProductDAO.java](team_project/src/main/java/products/ProductDAO.java#L73-L117)
  * 펜션 리스트 [Main.java](team_project/src/main/java/com/itwillbs/member/action/Main.java)
  
* View  
  * 펜션 리스트 [maindetail.jsp](team_project/src/main/webapp/main/maindetail.jsp)
    
* Controller
  * 컨트롤러 [MemberFrontController.java](team_project/src/main/java/com/itwillbs/member/action/MemberFrontController.java#L33-L39)

### 💡 댓글, 답댓글

* Model
  * 게시글 내용 [BoardContent.java](team_project/src/main/java/com/itwillbs/board/action/BoardContent.java#L48-L63)
  * 댓글 DTO [ReplyDTO.java](team_project/src/main/java/board/ReplyDTO.java)
  * 답댓글 DTO [CommendDTO.java](team_project/src/main/java/board/CommendDTO.java)
  * 댓글 DAO [ReplyDAO.java](team_project/src/main/java/board/ReplyDAO.java)
  * 답댓글 DAO [CommendDAO.java](team_project/src/main/java/board/CommendDAO.java)
  * 댓글 입력 [BoardReplyInsert.java](team_project/src/main/java/com/itwillbs/board/action/BoardReplyInsert.java)
  * 댓글 수정 [BoardReplyUpdateForm.java](team_project/src/main/java/com/itwillbs/board/action/BoardReplyUpdateForm.java)
     / [BoardReplyUpdatePro.java](team_project/src/main/java/com/itwillbs/board/action/BoardReplyUpdatePro.java)
  * 댓글 삭제 [BoardReplyDeletePro.java](team_project/src/main/java/com/itwillbs/board/action/BoardReplyDeletePro.java)
  * 답댓글 입력 [BoardCommendForm.java](team_project/src/main/java/com/itwillbs/board/action/BoardCommendForm.java)
  / [BoardCommentInsert.java](team_project/src/main/java/com/itwillbs/board/action/BoardCommentInsert.java)
  * 답댓글 수정 [BoardCommendUpdateForm.java](team_project/src/main/java/com/itwillbs/board/action/BoardCommendUpdateForm.java)
   / [BoardCommendUpdatePro.java](team_project/src/main/java/com/itwillbs/board/action/BoardCommendUpdatePro.java)
  * 답댓글 삭제 [BoardCommendDeletePro.java](team_project/src/main/java/com/itwillbs/board/action/BoardCommendDeletePro.java)
    
* View  
  * 댓글 입력폼 [replyForm.jsp](team_project/src/main/webapp/board/replyForm.jsp)
  * 댓글 수정폼 [replyUpdateForm.jsp](team_project/src/main/webapp/board/replyUpdateForm.jsp)
  * 답댓글 입력폼 [CommendForm.jsp](team_project/src/main/webapp/board/CommendForm.jsp)
  * 답댓글 수정폼 [CommendUpdateForm.jsp](team_project/src/main/webapp/board/CommendUpdateForm.jsp)
    
* Controller
  * 컨트롤러 [BoardFrontController.java](team_project/src/main/java/com/itwillbs/board/action/BoardFrontController.java#L56-L119)



### 💡 내 펜션 예약 조회(사장님)

* Model
  * 사장님예약 DTO [OwnerAppointmentDTO.java](team_project/src/main/java/products/OwnerAppointmentDTO.java)
  * 예약 DAO [AppointmentDAO.java](team_project/src/main/java/products/AppointmentDAO.java#L191-L232)
  * 팬션 예약 조회 [ProductOwnerAppointManage.java](team_project/src/main/java/com/itwillbs/products/action/ProductOwnerAppointManage.java)

* View
  * 펜션 예약 조회 [OwnerAppointManage.jsp](team_project/src/main/webapp/products/OwnerAppointManage.jsp)
  
* Controller
  * 컨트롤러 [ProductsFrontController.java](team_project/src/main/java/com/itwillbs/products/action/ProductsFrontController.java#L120-L126)


### 💡 지역별 예약 통계

* Model
  * 지역 DTO [RegionDTO.java](team_project/src/main/java/chart/RegionDTO.java)
  * 지역 DAO [CountRegion.java](team_project/src/main/java/chart/CountRegion.java)

* View
  * 관리자 페이지 메인 [adminMain.jsp](team_project/src/main/webapp/admin/adminMain.jsp#L78-119)
  
* Controller
  * 컨트롤러 [AdminFrontController.java](team_project/src/main/java/com/itwillbs/admin/action/AdminFrontController.java#L64-L67)


---

<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/updatePro.jsp
// 폼에서 입력한 내용이 서버에 전달 => request 내장객체 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
//request 태그이름에 해당하는 값을 가져오기 => 변수에 저장(id, pass, name)
String uname=request.getParameter("uname");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String tel=request.getParameter("tel");
String email=request.getParameter("email");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");

// 수정할 내용을 바구니 객체생성 => 바구니에 저장
UserDTO mypageDto=new UserDTO();
mypageDto.setId(id);
mypageDto.setPass(pass);
mypageDto.setUname(uname);
mypageDto.setEmail(email);
mypageDto.setAddress1(address1);
mypageDto.setAddress1(address2);
mypageDto.setTel(tel);


// MemberDAO 객체생성
UserDAO dao=new UserDAO();
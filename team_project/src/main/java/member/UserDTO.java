package member;

import java.sql.Timestamp;

public class UserDTO {
	private int no; // 유저번호
	private String uname; // 이름
	private String id; // 아이디
	private String pass1; // 비밀번호
	private int pass2; // 비밀번호확인
	private Timestamp birth; // 생년월일
	private String tel; // 전화번호
	private String address1; // 주소
	private String address2; // 주소(상셰)
	private int postnum; // 우편번호
	private String email; // 이메일
	private Timestamp joindate; // 가입일
	private int utype; // 회원유형
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass1() {
		return pass1;
	}
	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}
	public int getPass2() {
		return pass2;
	}
	public void setPass2(int pass2) {
		this.pass2 = pass2;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getPostnum() {
		return postnum;
	}
	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	public int getUtype() {
		return utype;
	}
	public void setUtype(int utype) {
		this.utype = utype;
	}
	
}

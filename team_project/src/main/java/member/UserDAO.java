package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.utility.MyAuthenticator;


public class UserDAO {
		public Connection getConnection() throws Exception{			
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
			
		}
		
		public UserDTO userCheck(String id, String pass) {
			// 바구니 주소가 저장되는 변수에 null 초기화
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2단계 디비연결 메서드 호출
				con = getConnection();
				// 3단계 SQL구문 만들어서 실행할 준비(select    where id=? and pass=?)
				String sql="select * from users where id=? and pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				//5단계 결과를 출력, 데이터 담기 (select)
				// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
//				                 => 세션값 생성 "id",id , main.jsp 이동
//				                         데이터 없으면 false => 아이디 비밀번호 틀림
//				                 => script   "아이디 비밀번호 틀림" 뒤로이동
				if(rs.next()){
					//next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
				    // => 세션값 생성 "id",id(페이지 상관없이 값을 유지) , main.jsp 이동
					// dto 바구니 객체생성 => 기억장소 할당
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setUname(rs.getString("uname"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}else{
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//userCheck()
		
		public void insertUser(UserDTO dto) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			try {
				con = getConnection();
				int no=1;
				String sql = "select max(no) from users";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					no=rs.getInt("max(no)")+1;
				}
				sql = "insert into users(no,id,pass,uname,birth,email,address1,address2,postnum,tel,joindate,utype) values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
								
				pstmt.setInt(1, no);
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPass());
				pstmt.setString(4, dto.getUname());
				pstmt.setString(5, dto.getBirth());
				pstmt.setString(6, dto.getEmail());
				pstmt.setString(7, dto.getAddress1());
				pstmt.setString(8, dto.getAddress2());
				pstmt.setInt(9, dto.getPostnum());
				pstmt.setString(10, dto.getTel());
				pstmt.setTimestamp(11, dto.getJoindate());
				pstmt.setInt(12, dto.getUtype());
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null)try {rs.close();} catch(Exception e2) {}
				if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
				
			}
		}	//insertUser
		
		public UserDTO getUser(String id) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				
				//3단계 SQL구문 만들어서 실행할 준비(select 조건 where id=?)
				String sql="select * from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);

				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				//5단계 결과를 출력, 데이터 담기 (select)
				// next() 다음행 => 리턴값 데이터 있으면 true/ 데이터 없으면 false
				//조건이 true 실행문=> 다음행 데이터 있으면 true =>  열접근 출력
				if(rs.next()){
					//next() 다음행 => 리턴값 데이터 있으면 true/ 아이디 일치
					// 바구니 객체생성 => 기억장소 할당
					dto=new UserDTO();
					// set메서드호출 바구니에 디비에서 가져온 값 저장
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//getUser()
		
		
		public UserDTO getUserNo(int no) { // no로 회원정보 찾기
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				
				String sql="select * from users where no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs=pstmt.executeQuery();

				if(rs.next()){
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//getUserNo()
		
		
		public UserDTO findId(String uname, String email) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				
				//3단계 SQL구문 만들어서 실행할 준비(select 조건 where id=?)
				String sql="select * from users where uname=? and email=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, uname);
				pstmt.setString(2, email);
				

				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto=new UserDTO();
		
					dto.setUname(rs.getString("uname"));
					dto.setEmail(rs.getString("email"));
					dto.setId(rs.getString("Id"));
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}// findId
		
		public void deleteUser(String id) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
			try {
				
				con = getConnection();
				
				String sql2 = "delete from users where id=?";
				pstmt2 = con.prepareStatement(sql2);
				
				pstmt2.setString(1, id);
				pstmt2.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				if (pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
			}
		} // deleteUser()
		
		public void updateUser(UserDTO updateDto) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
		
			try {
				con = getConnection();

				String sql2 = "update users set pass=?, uname=?, email=?, address1=?, address2=?, postnum=?, tel=? where id=?";
				pstmt2 = con.prepareStatement(sql2);
				//? 채워넣기				
				pstmt2.setString(1, updateDto.getPass());
				pstmt2.setString(2, updateDto.getUname());
				pstmt2.setString(3, updateDto.getEmail());
				pstmt2.setString(4, updateDto.getAddress1());
				pstmt2.setString(5, updateDto.getAddress2());
				pstmt2.setInt(6, updateDto.getPostnum());
				pstmt2.setString(7, updateDto.getTel());
				pstmt2.setString(8, updateDto.getId());
				
				pstmt2.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
			}
		}// updateUser()
		
		public void mypageUser(UserDTO mypageDto) {
			Connection con =null;
			PreparedStatement pstmt2=null;
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
				// => 3단계 pstmt2 SQL구문 만들어서 실행할 준비 (update set name=? where id=?)
				String sql2="mypage users set uname=?, pass=?, tel=?, email=?, address1=?, address2=? where id =?";
				pstmt2=con.prepareStatement(sql2);
				//? 채워넣기
				pstmt2.setString(1, mypageDto.getUname());//set 문자열(1번째 물음표, 값 name)
				pstmt2.setString(2, mypageDto.getPass());
				pstmt2.setString(3, mypageDto.getTel());
				pstmt2.setString(4, mypageDto.getEmail());
				pstmt2.setString(5, mypageDto.getAddress1());
				pstmt2.setString(5, mypageDto.getAddress2());
				pstmt2.setString(6, mypageDto.getId());  //set 문자열 (2번째 물음표, 값 id)
				
				// 4단계 SQL구문을 실행(insert,update,delete)
				pstmt2.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//mypageUser()
		
		public ArrayList<UserDTO> getUserList(int startRow, int pageSize){
			ArrayList<UserDTO> userList=new ArrayList<UserDTO>();
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				//3단계 SQL구문 만들어서 실행할 준비(select)

				String sql="select * from users order by uname desc limit ?, ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				
				
				rs=pstmt.executeQuery();	
				 
				while(rs.next()) {
					// UserDTO 객체생성
					UserDTO dto=new UserDTO();
					System.out.println("회원정보저장 주소 : "+dto);
					// set메서드 호출 <= 열접근
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
					// 배열 한칸에 회원정보주소 저장
					userList.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return userList;
		}//getMUserList()
		
		public void modifyPass(UserDTO modifyPassDto) {
			Connection con =null;
			PreparedStatement pstmt2=null;
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
				// => 3단계 pstmt2 SQL구문 만들어서 실행할 준비 (update set name=? where id=?)
				String sql2="update users set pass=? where id =?";
				pstmt2=con.prepareStatement(sql2);
				//? 채워넣기
				pstmt2.setString(1, modifyPassDto.getPass()); 
				pstmt2.setString(2, modifyPassDto.getId());  
				
				// 4단계 SQL구문을 실행(insert,update,delete)
				pstmt2.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//modifyPass()
		
		public UserDTO idCheck(String id) {
			// 바구니 주소가 저장되는 변수에 null 초기화
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2단계 디비연결 메서드 호출
				con = getConnection();
				// 3단계 SQL구문 만들어서 실행할 준비(select    where id=? and pass=?)
				String sql="select * from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				//5단계 결과를 출력, 데이터 담기 (select)
				// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
//				                 => 세션값 생성 "id",id , main.jsp 이동
//				                         데이터 없으면 false => 아이디 비밀번호 틀림
//				                 => script   "아이디 비밀번호 틀림" 뒤로이동
				if(rs.next()){
					//next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
				    // => 세션값 생성 "id",id(페이지 상관없이 값을 유지) , main.jsp 이동
					// dto 바구니 객체생성 => 기억장소 할당
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setUname(rs.getString("uname"));
					dto.setEmail(rs.getString("email"));
					dto.setTel(rs.getString("tel"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}else{
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//idCheck()
		
		public void delUserlist(String id){
			Connection con =null;
			PreparedStatement pstmt=null;
		    
		    try{//실행
		    	con = getConnection();
		    	String sql="delete from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				//4단계 SQL구문을 실행(select) => 결과 저장
				pstmt.executeUpdate();      
		           
		    }catch(Exception e){           
		    	e.printStackTrace();         
		    }finally{          
		    	// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
		    	if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		    }      
		   
		    
		 }// delUserlist 
		
		public int getUserCount() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				
				String sql="select count(*) from users";
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
					if(rs!=null) try { rs.close();} catch (Exception e2) {}
					if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
					if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return count;
		}//getBoardCount()
		
		public String findEmail(String id) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
		    String email = null;
		    try {
		    	con=getConnection();
		    	
		    	String sql="select email from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();

		        if (rs.next()) {
		            email = rs.getString("email");
		        }//if end

		    } catch (Exception e) {
		        System.out.println("아이디 찾기 실패 : " + e);
		    } finally {
		    	if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		    }//end
		    return email;
		}//findEmail() end

		public String tmpPasswd(UserDTO dto) {
			Connection con=null;
			PreparedStatement pstmt=null;
			
		    char[] upp = new char[26];
		    char[] low = new char[26];
		    int[] numInt = new int[10];

		    //대,소문자 배열에 넣기
		    char num = 65;
		    for (int i=0; i<26; i++) {
		        upp[i] = num;
		        low[i] = (char)(num+32);
		        num++;
		    }//for end

		    //숫자 배열에 넣기
		    for (int k=0; k<10; k++) {
		        numInt[k] = k;			
		    }//for end

		    //임시 비밀번호에 사용되는 대문자, 소문자, 숫자 각 개수 설정
		    int a = (int)Math.floor(Math.random()*10); //대문자 개수
		    int b = (int)Math.floor(Math.random()*(10-a)); //소문자 개수
		    int c = 10 - a - b; //숫자 개수

		    //임시 비밀번호 저장. (대문자, 소문자, 숫자가 나오는 자릿수를 임의로 지정하기 위해 set 사용)
		    Set set = new HashSet();
		    StringBuilder pw = new StringBuilder();

		    //임시 비밀번호 생성
		    while (true) { //set은 중복을 허용하지 않기 때문에 중복값이 들어가면 10자리가 안나온다. 따라서 10자리 나올때까지 반복
		        if(set.size()==10) { 
		            Iterator iter = set.iterator();
		            while (iter.hasNext()) {  //다음 cursor가 있는지?
		                //cursor가 가리키는 요소 가져오기
		                Object obj = iter.next();
		                pw.append(obj);
		            }//while end
		            break;

		        } else {
		            set.clear();

		            //대문자
		            for (int i=0; i<a; i++) {
		                int idx = (int)Math.floor(Math.random()*26); //배열에서 랜덤하게 값을 가져오기 위해
		                set.add(upp[idx]);
		            }

		            //소문자
		            for (int j=0; j<b; j++) {
		                int idx = (int)Math.floor(Math.random()*26);
		                set.add(low[idx]);
		            }

		            //숫자
		            for (int k=0; k<c; k++) {
		                int idx = (int)Math.floor(Math.random()*10);
		                set.add(numInt[idx]);
		            }

		        }//if end
		    }//while end

		    //임시 비밀번호로 수정
		    try {
		    	con=getConnection();
		    	
		    	String sql="update users set Pass=? where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, pw.toString());
				pstmt.setString(2, dto.getId());
				pstmt.executeUpdate();
				

		    } catch (Exception e) {
		        System.out.println("임시 비밀번호로 수정 실패 : " + e );
		    } finally {
		    	if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
		    }//end

		    return pw.toString();
		}//tmpPasswd() end

		public void sendTmpPw(String tmpPasswd, UserDTO dto) {
		    try {
		        String content = "* 임시 비밀번호로 로그인 한 후, 회원 정보 수정에서 비밀번호를 변경하시기 바랍니다.";
		        content += "<hr>";
		        content += "<table border='1'>";
		        content += "<tr>";
		        content += "	<th>임시 비밀번호</th>";
		        content += "</tr>";
		        content += "<tr>";
		        content += "	<td>"+ tmpPasswd +"</td>";
		        content += "</tr>";
		        content += "</table>";

		        String mailServer = "smtp.gmail.com"; // 메일서버
		        Properties props = new Properties();
		        props.put("mail.smtp.host", mailServer);
		        props.put("mail.smtp.auth", true);
		        
		        
		        
		        props.put("mail.smtp.port", 465);
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.ssl.enable", "true");
		        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		        Authenticator myAuth = new MyAuthenticator(); //다형성
		        Session sess = Session.getInstance(props, myAuth);

		        InternetAddress[] address = {new InternetAddress(dto.getEmail())};
		        Message msg = new MimeMessage(sess);
		        msg.setRecipients(Message.RecipientType.TO, address);
		        msg.setFrom(new InternetAddress("webmaster@itwill.co.kr"));
		        msg.setSubject("MyWeb 임시 비밀번호 입니다");
		        msg.setContent(content, "text/html; charset=UTF-8");
		        msg.setSentDate(new Date());
		        Transport.send(msg);
		    } catch (Exception e) {
		        System.out.println("메일 전송 실패 : " + e);
		    }//end
		}//sendTmpPw() end
				
		

}

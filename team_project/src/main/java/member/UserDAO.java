package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

}

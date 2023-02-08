package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WaitingDAO {
	public Connection getConnection() throws Exception{

		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	public ArrayList<WaitingDTO> getWaitingList(){
		ArrayList<WaitingDTO> WaitingList=new ArrayList<WaitingDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 디비연결 메서드
			con=getConnection();
			//3단계 SQL구문 만들어서 실행할 준비(select)
			String sql="select * from Waiting";
			pstmt=con.prepareStatement(sql);
			//4단계 SQL구문을 실행(select) => 결과 저장
			rs=pstmt.executeQuery();	
			//5단계	//조건이 true 실행문=> 다음행 데이터 있으면 true 
			//     =>  열접근 => 한 명 정보 WaitingDTO 저장 => 배열한칸 저장 
			while(rs.next()) {
				// WaitingDTO 객체생성
				WaitingDTO dto=new WaitingDTO();
				// set메서드 호출 <= 열접근
				dto.setWno(rs.getInt("wno"));
				dto.setPno(rs.getInt("pno"));
				dto.setNo(rs.getInt("no"));
				dto.setWdate(rs.getTimestamp("wdate"));
				// 배열 한칸에 회원정보주소 저장
				WaitingList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return WaitingList;
	}//getWaitingList()
}

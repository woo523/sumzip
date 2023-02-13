package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SalesDAO {
	public Connection getConnection() throws Exception{

		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
		
	public SalesDTO getSales(int no) {
		SalesDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 디비연결 메서드
			con=getConnection();
			
			//3단계 SQL구문 만들어서 실행할 준비(select 조건 where id=?)
			String sql="select * from sales where no=? order by sdate desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);

			//4단계 SQL구문을 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			//5단계 결과를 출력, 데이터 담기 (select)
			// next() 다음행 => 리턴값 데이터 있으면 true/ 데이터 없으면 false
			//조건이 true 실행문=> 다음행 데이터 있으면 true =>  열접근 출력
			if(rs.next()){
				//next() 다음행 => 리턴값 데이터 있으면 true/ 아이디 일치
				// 바구니 객체생성 => 기억장소 할당
				dto=new SalesDTO();
				// set메서드호출 바구니에 디비에서 가져온 값 저장
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getDate("indate"));
				dto.setOutdate(rs.getDate("outdate"));
				dto.setSprice(rs.getInt("sprice"));
				dto.setScount(rs.getInt("scount"));
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
	}//getSales()
	
	public ArrayList<SalesDTO> getSalesList(){
		ArrayList<SalesDTO> SalesList=new ArrayList<SalesDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2 디비연결 메서드
			con=getConnection();
			//3단계 SQL구문 만들어서 실행할 준비(select)
			String sql="select * from Sales";
			pstmt=con.prepareStatement(sql);
			//4단계 SQL구문을 실행(select) => 결과 저장
			rs=pstmt.executeQuery();	
			//5단계	//조건이 true 실행문=> 다음행 데이터 있으면 true 
			//     =>  열접근 => 한 명 정보 SalesDTO 저장 => 배열한칸 저장 
			while(rs.next()) {
				// SalesDTO 객체생성
				SalesDTO dto=new SalesDTO();
				// set메서드 호출 <= 열접근
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getDate("indate"));
				dto.setOutdate(rs.getDate("outdate"));
				dto.setSprice(rs.getInt("sprice"));
				dto.setScount(rs.getInt("scount"));
				// 배열 한칸에 회원정보주소 저장
				SalesList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return SalesList;
	}//getSalesList()
}
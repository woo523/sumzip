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
	
	// 날짜 기준으로 회원별 sales테이블 조회
	public SalesDTO getSales(int no) {
		SalesDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from sales where no=? order by sdate desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new SalesDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getDate("indate"));
				dto.setOutdate(rs.getDate("outdate"));
				dto.setSprice(rs.getInt("sprice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getSales()
	
	// sales 테이블 조회
	public ArrayList<SalesDTO> getSalesList(){
		ArrayList<SalesDTO> SalesList=new ArrayList<SalesDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from Sales";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();	
			while(rs.next()) {
				SalesDTO dto=new SalesDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getDate("indate"));
				dto.setOutdate(rs.getDate("outdate"));
				dto.setSprice(rs.getInt("sprice"));
				SalesList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return SalesList;
	}//getSalesList()
}
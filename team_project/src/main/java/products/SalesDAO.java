package products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


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
	
	
	public void insertSales(SalesDTO dto) { // 숙소판매 입력
		System.out.println("SalesDAO insertSales()");
    	Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
		con=getConnection();
		int sno=1;
		String sql="select max(sno) from sales";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			sno=rs.getInt("max(sno)")+1;
		}
		sql="insert into sales(sno, ano, pno, no, sdate, indate, outdate, sprice) values(?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, sno);  
		pstmt.setInt(2, dto.getAno()); 
		pstmt.setInt(3, dto.getPno());
		pstmt.setInt(4, dto.getNo());
		pstmt.setTimestamp(5, dto.getSdate());
		pstmt.setString(6, dto.getIndate());
		pstmt.setString(7, dto.getOutdate());
		pstmt.setInt(8, dto.getSprice());
		pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
		if(con!=null) try { con.close();} catch (Exception e2) {}
		
	}
	
	
	public void deleteSales(int ano) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from sales where ano=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//deleteSales
	
	
	
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
				dto.setIndate(rs.getString("indate"));
				dto.setOutdate(rs.getString("outdate"));
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
	
	// 날짜 기준으로 회원별 sales테이블 조회
	public SalesDTO getSalesAno(int ano) {
		SalesDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from sales where ano=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new SalesDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setAno(rs.getInt("ano"));
				dto.setPno(rs.getInt("pno"));
				dto.setSdate(rs.getTimestamp("sdate"));
				dto.setIndate(rs.getString("indate"));
				dto.setOutdate(rs.getString("outdate"));
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
	}//getSalesAno()
	
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
				dto.setIndate(rs.getString("indate"));
				dto.setOutdate(rs.getString("outdate"));
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
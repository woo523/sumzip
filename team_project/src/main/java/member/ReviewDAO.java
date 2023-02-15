package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	// 후기 등록
	// insertReview()
	public void insertReview(ReviewDTO dto) {
		System.out.println("ReviewDAO insertReview()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			// rno 구하기
			int rno = 1;
			String sql = "select max(rno) from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rno = rs.getInt("max(rno)") + 1;
			}
			
			sql = "insert into review(rno, no, pno, ano, rtitle, rstar, rcontent, rcount, rdate, rpic1, rpic2, rpic3)"
			    + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);  // 게시글번호
			pstmt.setInt(2, dto.getNo()); // 유저번호
			pstmt.setInt(3, dto.getPno()); // 상품번호
			pstmt.setInt(4, dto.getAno()); // 예약번호
			pstmt.setString(5, dto.getRtitle());
			pstmt.setString(6, dto.getRstar());	// 별점 길이 값 받아오기...
			pstmt.setString(7, dto.getRcontent());
			pstmt.setInt(8, dto.getRcount());
			pstmt.setTimestamp(9, dto.getRdate());
			pstmt.setString(10, dto.getRpic1());
			pstmt.setString(11, dto.getRpic2());
			pstmt.setString(12, dto.getRpic3());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		
	} // insertReview()
	
	// 후기 내용 받아오기
	// getReview()
	public ReviewDTO getReview(int ano) {
		System.out.println("ReviewDTO getReview()");
		
		ReviewDTO rdto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql = "select * from review where ano = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rdto = new ReviewDTO();
				rdto.setAno(rs.getInt("ano"));
				rdto.setNo(rs.getInt("rno"));
				rdto.setRtitle(rs.getString("rtitle"));
				rdto.setRcontent(rs.getString("rcontent"));
				rdto.setRstar(rs.getString("rstar"));
				rdto.setRpic1(rs.getString("rpic1"));
				rdto.setRpic2(rs.getString("rpic2"));
				rdto.setRpic3(rs.getString("rpic3"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		
		return rdto;
	
	} // getReview()
	
	// checkReview()
	public boolean checkReview(int ano) {
		System.out.println("ReviewDTO ReviewCheck()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean checkReview = true;
		try {
			con = getConnection();
			
			String sql = "select * from review where ano = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checkReview = true;
			} else {
				checkReview = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		return checkReview;
	
	} // ReviewCheck()
	
	// 후기 수정
	// updateReview()
	public void updateReview(ReviewDTO rdto) {
		System.out.println("ReviewDAO updateReivew()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "update review set rtitle=?, rstar=?, rcontent=?, rpic1=? where rno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdto.getRtitle());
			pstmt.setString(2, rdto.getRstar());
			pstmt.setString(3, rdto.getRcontent());
			pstmt.setString(4, rdto.getRpic1());
			pstmt.setInt(5, rdto.getRno());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
		}
		
	} // updateReview()
	
	// 후기 삭제
	// deleteReview()
	public void deleteReview(int ano) {
		System.out.println("ReviewDAO deleteReview()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "delete from review where ano = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
		}
		
	} // deleteReview()
	

}

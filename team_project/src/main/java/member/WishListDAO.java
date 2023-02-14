package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import products.ProductDTO;

public class WishListDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
public void insertWish(WishListDTO dto) {
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		con = getConnection();
		
		String sql = "insert into Wish_List(no,pno) values(?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, dto.getNo());
		pstmt.setInt(2, dto.getPno());
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
	}
	return;
	}	

public void deleteWish(WishListDTO dto) {
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		con = getConnection();
		
		String sql = "delete from Wish_List where pno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPno());
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
	}
	return;
	}	
//
//public ArrayList<WishListDTO> getWishArrayList(int pno) {
//	ArrayList<WishListDTO> wishArrayList = new ArrayList<WishListDTO>();
//	Connection con = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	try {
//		con = getConnection();
//		String sql = "select * from Wish_List where id=?";
//		pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1, pno);
//
//		rs = pstmt.executeQuery();
//
//		if (rs.next()) {
//			WishListDTO dto = new WishListDTO();
//			dto.setNo(rs.getInt("no"));
//			dto.setPno(rs.getInt("pno"));
//			wishArrayList.add(dto);
//			
//		}
//	} catch (Exception e) {
//		e.printStackTrace();
//	} finally {
//		if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
//		if (con != null) try {con.close();} catch (Exception e2) {}
//		if (rs != null) try {rs.close();} catch (Exception e2) {}
//	}
//	return wishArrayList;
//}


public ArrayList<ProductDTO> getWishArrayList(int pno,int no) {
	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = getConnection();
		String sql = "select * from Wish_List where pno=? and no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, pno);
		pstmt.setInt(2, no);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPname(rs.getString("Pname"));
			dto.setPprice(rs.getInt("Pprice"));
			dto.setPaddress(rs.getString("Paddress"));
			dto.setPpic1(rs.getString("Ppic1"));
			list.add(dto);
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
		if (con != null) try {con.close();} catch (Exception e2) {}
		if (rs != null) try {rs.close();} catch (Exception e2) {}
	}
	return list;
}
}

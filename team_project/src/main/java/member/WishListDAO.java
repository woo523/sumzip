package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import products.ProductDAO;
import products.ProductDTO;

public class WishListDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
public void insertWish(int pno) {
	Connection con = null;
	PreparedStatement pstmt = null;
	WishListDTO dto = new WishListDTO();
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

public void deleteWish(int pno) {
	Connection con = null;
	PreparedStatement pstmt = null;
	WishListDTO dto = new WishListDTO();
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


public ArrayList<ProductDTO> getWishArrayList(int no) {
	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
	ProductDAO pdao = new ProductDAO();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = getConnection();
		String sql = "select * from Wish_List where no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		

		if (rs.next()) {
			pdao = new ProductDAO();
			list.add(pdao.getProduct(rs.getInt("Pno")));
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
//
//public ArrayList<Jjim> getJjim(String userID, int bbsID) {
//	String SQL = "SELECT * FROM jjim WHERE userID = ? AND bbsID = ?";
//	ArrayList<Jjim> list = new ArrayList<Jjim>();
//	try {
//		PreparedStatement pstmt = conn.prepareStatement(SQL);
//		pstmt.setString(1,  userID);
//		pstmt.setInt(2,  bbsID);
//		rs = pstmt.executeQuery();
//		while (rs.next()) {
//			Jjim jjim = new Jjim();
//			jjim.setBbsID(rs.getInt(1));
//			jjim.setUserID(rs.getString(2));
//			list.add(jjim);
//		}
//	}catch(Exception e) {
//		e.printStackTrace();
//	}
//	return list;
//}
}

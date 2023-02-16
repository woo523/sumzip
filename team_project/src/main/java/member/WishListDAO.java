package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import products.ProductDTO;

public class WishListDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
public void wishbutton(int no,int pno) {
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		
		con = getConnection();
		
		String sql = "select * from where no=? and pno=?";
		
		if(sql.isEmpty()) {
			sql= "insert into wish_list values (?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, pno);
			pstmt.executeUpdate();
			System.out.println("insert");
		}
		
		else {
		sql = "delete from Wish_List where no=? and pno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setInt(2, pno);
		pstmt.executeUpdate();
		System.out.println("delete");
		}
		
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
	}
	return;
	}	

//public void deleteWish(int no,int pno) {
//	Connection con = null;
//	PreparedStatement pstmt = null;
//	WishListDTO dto = new WishListDTO();
//	try {
//		con = getConnection();
//		
//		String sql = "delete from Wish_List where no=? and pno=?";
//		pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1, pno);
//		
//		pstmt.executeUpdate();
//
//	} catch (Exception e) {
//		e.printStackTrace();
//	} finally {
//		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
//		if (con != null)try {con.close();} catch (Exception e2) {}
//	}
//	return;
//	}	

public ArrayList<ProductDTO> getWishArrayList(int no) {
	System.out.println("no="+no);
	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = getConnection();
		String sql = "select * from products where pno in (select pno from wish_list where no=?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		rs = pstmt.executeQuery();
		System.out.println(pstmt);
		while(rs.next()) {
			System.out.println("while문 실행");
			ProductDTO pdto = new ProductDTO();
			pdto.setPno(rs.getInt("pno"));
			pdto.setPname(rs.getString("pname"));
			pdto.setPprice(rs.getInt("pprice"));
			pdto.setPaddress(rs.getString("paddress"));
			list.add(pdto);
		}
		System.out.println(list.size());
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) try {rs.close();} catch (Exception e2) {}
		if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
		if (con != null) try {con.close();} catch (Exception e2) {}
	}
	return list;
}

//public ArrayList<ProductDTO> getWishArrayList(int no) {
//	System.out.println("no="+no);
//	ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
//	ProductDAO pdao = new ProductDAO();
//	Connection con = null;
//	PreparedStatement pstmt = null;
//	ResultSet rs = null;
//	try {
//		con = getConnection();
//		String sql = "select * from Wish_List where no=?";
//		pstmt = con.prepareStatement(sql);
//		pstmt.setInt(1, no);
//		rs = pstmt.executeQuery();
//		
//
//		while (rs.next()) {
//			pdao = new ProductDAO();
//			list.add(pdao.getProduct(rs.getInt("pno")));
//		}
//		System.out.println(list.size());
//	} catch (Exception e) {
//		e.printStackTrace();
//	} finally {
//		if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
//		if (con != null) try {con.close();} catch (Exception e2) {}
//		if (rs != null) try {rs.close();} catch (Exception e2) {}
//	}
//	return list;
//}
}
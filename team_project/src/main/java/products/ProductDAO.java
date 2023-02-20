package products;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




//DB연결
public class ProductDAO {
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
    		Connection con=ds.getConnection();
    		return con;
    	}
   
	// 펜션 등록
    public void insertProduct(ProductDTO dto) {
    	System.out.println("ProudctDAO insertProduct()");
    	Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	try {
		con=getConnection();
		int pno=1;
		String sql="select max(pno) from products";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			pno=rs.getInt("max(pno)")+1;
		}
		sql="insert into products(pno,no,pname,paddress,ppostnum,paddress2,ptel,checkin,checkout,pprice,max_men,expiration,reser_date,ppic1,ppic2,ppic3,caution,pexplain) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, pno);
		pstmt.setInt(2, dto.getNo());
		pstmt.setString(3, dto.getPname());
		pstmt.setString(4, dto.getPaddress());
		pstmt.setInt(5, dto.getPpostnum());
		pstmt.setString(6, dto.getPaddress2());
		pstmt.setString(7, dto.getPtel());
		pstmt.setString(8, dto.getCheckin());
		pstmt.setString(9, dto.getCheckout());
		pstmt.setInt(10, dto.getPprice());
		pstmt.setInt(11, dto.getMax_men());
		pstmt.setInt(12, dto.getExpiration());
		pstmt.setTimestamp(13, dto.getReser_date());
		pstmt.setString(14, dto.getPpic1());
		pstmt.setString(15, dto.getPpic2());
		pstmt.setString(16, dto.getPpic3());
		pstmt.setString(17, dto.getCaution());
		pstmt.setString(18, dto.getPexplain());
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(rs!=null) try { rs.close();} catch (Exception e2) {}
		if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
		if(con!=null) try { con.close();} catch (Exception e2) {}
	 }
	return;
	}// insertProduct()
	
	// 펜션 리스트(mypage)
	public ArrayList<ProductDTO> getProductList(int startRow, int pageSize){
		System.out.println("ProductDAO getProductList()");
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				System.out.println("상품정보저장 주소 : "+dto);
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getProductList()
	
	// 펜션 검색
	public ArrayList<ProductDTO> getSearchProductList(String indate, String outdate, int guest, String region, int startRow, int pageSize) {
		ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products where max_men>=? && paddress like ? && pno not in (select pno from sales where indate between ? and ? || outdate between ? and ?) order by pno desc limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, guest);
			pstmt.setString(2, "%"+region+"%");
			pstmt.setString(3, indate);
			pstmt.setString(4, outdate);
			pstmt.setString(5, indate);
			pstmt.setString(6, outdate);
			pstmt.setInt(7, startRow-1);
			pstmt.setInt(8, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				dto.setPno(rs.getInt("pno"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPexplain(rs.getString("pexplain"));
				productList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return productList;
	}// getSearchProductList()
	
	// pno로 펜션 조회
	public ProductDTO getProduct(int pno) {
		System.out.println("ProductDAO getProduct()");
		ProductDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			String sql="select * from products where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto = new ProductDTO();
				dto.setPno(rs.getInt("pno"));
//					dto.setNo(rs.getInt("no"));
				dto.setPname(rs.getString("pname"));
				dto.setPaddress(rs.getString("paddress"));
				dto.setPpostnum(rs.getInt("ppostnum"));
				dto.setPaddress2(rs.getString("paddress2"));
				dto.setPtel(rs.getString("ptel"));
				dto.setCheckin(rs.getString("checkin"));
				dto.setCheckout(rs.getString("checkout"));
				dto.setPprice(rs.getInt("pprice"));
				dto.setMax_men(rs.getInt("max_men"));
				dto.setExpiration(rs.getInt("expiration"));
				dto.setReser_date(rs.getTimestamp("reser_date"));
				dto.setPpic1(rs.getString("ppic1"));
				dto.setPpic2(rs.getString("ppic2"));
				dto.setPpic3(rs.getString("ppic3"));
				dto.setCaution(rs.getString("caution"));
				dto.setPexplain(rs.getString("pexplain"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getProduct()
	
	// 펜션 갯수 계산
	public int getProductCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from products";
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
	}//getProductCount()
	
	// 검색 후 펜션 갯수 계산
	public int getSearchProductCount(String indate, String outdate, int guest, String region) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from products where max_men>=? && paddress like ? && pno not in (select pno from sales where indate between ? and ? || outdate between ? and ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, guest);
			pstmt.setString(2, "%"+region+"%");
			pstmt.setString(3, indate);
			pstmt.setString(4, outdate);
			pstmt.setString(5, indate);
			pstmt.setString(6, outdate);
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
	}//getSearchProductCount()
			
	// 펜션 삭제
	public void deleteProduct(int pno) {
		System.out.println("ProductDAO deleteProduct()");
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="delete from products where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//deleteProduct()
	
	// 펜션 수정
	public void updateProduct(ProductDTO dto) {
		System.out.println("ProductDAO updateProduct()");
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update products set pname=?, checkin=?, checkout=?,pprice=?, max_men=?, expiration=?, ppic1=?, ppic2=?, ppic3=?,caution=?, pexplan=? where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getPname());
			pstmt.setString(2, dto.getCheckin());
			pstmt.setString(3, dto.getCheckout());
			pstmt.setInt(4, dto.getPprice());
			pstmt.setInt(5, dto.getMax_men());
			pstmt.setInt(6, dto.getExpiration());
			pstmt.setString(7, dto.getPpic1());
			pstmt.setString(8, dto.getPpic2());
			pstmt.setString(9, dto.getPpic3());
			pstmt.setString(10, dto.getCaution());
			pstmt.setString(11, dto.getPexplain());
			pstmt.setInt(12, dto.getPno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//updateProduct()
	
	// 
	public void fupdateProduct(ProductDTO dto) {
		System.out.println("ProductDAO fupdateProduct()");
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
			String sql="update products set ppic1=?, pname=?, pprice=?, pexplain=? where pno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getPpic1());
			pstmt.setString(2, dto.getPname());
			pstmt.setInt(3, dto.getPprice());
			pstmt.setInt(4, dto.getPno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//fupdateProduct
		
}//class
	   

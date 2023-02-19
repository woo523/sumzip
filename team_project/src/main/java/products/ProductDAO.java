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
   
	    //게시판에 넣을 데이터들의 메서드생성
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
			
			sql="insert into products(pno, no, pname, paddress, ppostnum,"
					+ " paddress2, ptel, checkin, checkout, pprice, max_men,"
					+ " expiration, reser_date, ppic1, ppic2, ppic3, caution,"
					+ " pexplain) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, dto.getNo());
			pstmt.setString(3, dto.getPname());
			pstmt.setString(4, dto.getPaddress());
			pstmt.setInt(5, dto.getPpostnum());
			pstmt.setString(6, dto.getPaddress2());
			pstmt.setString(7, dto.getPtel());
			pstmt.setInt(8, dto.getCheckin());
			pstmt.setInt(9, dto.getCheckout());
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
		
	    
		//-ProductList.jsp 연결메서드
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
					dto.setCheckin(rs.getInt("checkin"));
					dto.setCheckout(rs.getInt("checkout"));
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
		
		public ArrayList<ProductDTO> getSearchProductList(String indated, String outdated,
				String indatet, String outdatet, int guest, String region, int startRow, int pageSize) {
			ArrayList<ProductDTO> productList=new ArrayList<ProductDTO>();
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				
				String sql="select * from products where max_men>=? && paddress like ? && checkin > ? && checkout < ? && pno not in (select pno from sales where indate between ? and ? || outdate between ? and ?) order by pno desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, guest);
				pstmt.setString(2, "%"+region+"%");
				pstmt.setString(3, indatet);
				pstmt.setString(4, outdatet);
				pstmt.setString(5, indated);
				pstmt.setString(6, outdated);
				pstmt.setString(7, indated);
				pstmt.setString(8, outdated);
				pstmt.setInt(9, startRow-1);
				pstmt.setInt(10, pageSize);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO dto=new ProductDTO();
					
					dto.setPno(rs.getInt("pno"));
					dto.setPname(rs.getString("pname"));
					dto.setPaddress(rs.getString("paddress"));
					dto.setPaddress2(rs.getString("paddress2"));
					dto.setCheckin(rs.getInt("checkin"));
					dto.setCheckout(rs.getInt("checkout"));
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
		
		//-productContent.jsp 연결메서드
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
					dto.setCheckin(rs.getInt("checkin"));
					dto.setCheckout(rs.getInt("checkout"));
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
		
		//-ProuctList.jsp 연결메서드(페이징기능 메서드정의)
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
		
		//-result.jsp 연결메서드(페이징기능 메서드정의)
				public int getSearchProductCount(String indated, String outdated,
						String indatet, String outdatet, int guest, String region) {
					Connection con=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					int count=0;
					try {
						con=getConnection();
						
						String sql="select count(*) from products where max_men>=? && paddress like ? && checkin > ? && checkout < ? && pno not in (select pno from sales where indate between ? and ? || outdate between ? and ?)";
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, guest);
						pstmt.setString(2, "%"+region+"%");
						pstmt.setString(3, indated);
						pstmt.setString(4, outdated);
						pstmt.setString(5, indated);
						pstmt.setString(6, outdated);
						pstmt.setString(7, indatet);
						pstmt.setString(8, outdatet);
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
				
		
		//-product_deletePro.jsp 연결메서드
		public void deleteProduct(int pno) {
			System.out.println("ProductDAO deleteProduct()");
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				String sql="delete from products where pno=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, pno);
				// 4단계 SQL구문을 실행(insert,update,delete)
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//deleteProduct()
		
		
		public void updateProduct(ProductDTO dto) {
			System.out.println("ProductDAO updateProduct()");
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				String sql="update products set pname=?, checkin=?, checkout=?,"
						+ " pprice=?, max_men=?, expiration=?, ppic1=?, ppic2=?, ppic3=?,"
						+ " caution=?, pexplan=? where pno=?";
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPname());
				pstmt.setInt(2, dto.getCheckin());
				pstmt.setInt(3, dto.getCheckout());
				pstmt.setInt(4, dto.getPprice());
				pstmt.setInt(5, dto.getMax_men());
				pstmt.setInt(6, dto.getExpiration());
				pstmt.setString(7, dto.getPpic1());
				pstmt.setString(8, dto.getPpic2());
				pstmt.setString(9, dto.getPpic3());
				pstmt.setString(10, dto.getCaution());
				pstmt.setString(11, dto.getPexplain());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//updateProduct()
			
		public void fupdateProduct(ProductDTO dto) {
			System.out.println("ProductDAO fupdateProduct()");
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				String sql="update products set ppic1=?, pname=?, pprice=?, pexplain=? where pno=?";
				pstmt=con.prepareStatement(sql);
				// file 추가
				pstmt.setString(1, dto.getPpic1());
				pstmt.setString(2, dto.getPname());
				pstmt.setInt(3, dto.getPprice());
				
				pstmt.setInt(4, dto.getPno());
				// 4단계 SQL구문을 실행(insert,update,delete)
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
		}//fupdateProduct
		
			
			
	
			
			
			
			
    
    }//class
	   

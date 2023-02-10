package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
public void insertMember(UserDTO dto) {
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		con = getConnection();
		
		String sql = "insert into members(id,pass,name,birth,email,address1,tel) values(?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPass());
		pstmt.setString(3, dto.getUname());
		pstmt.setString(4, dto.getBirth());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getAddress1());
		pstmt.setString(7, dto.getTel());
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
		if (con != null)try {con.close();} catch (Exception e2) {}
	}
	return;
	}	
 
public UserDTO getMember(String id) {
	UserDTO dto = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		con = getConnection();
		String sql = "select * from members where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			dto = new UserDTO();

			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setUname(rs.getString("name"));
			dto.setBirth(rs.getString("birth"));
			dto.setEmail(rs.getString("email"));
			dto.setAddress1(rs.getString("address"));
			dto.setTel(rs.getString("tel"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
		if (con != null) try {con.close();} catch (Exception e2) {}
		if (rs != null) try {rs.close();} catch (Exception e2) {}
	}
	return dto;
}//getMember()
}
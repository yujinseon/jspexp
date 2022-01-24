package jspexp.a04_member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class member_dao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public void setConn() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 예외:" + e.getMessage());
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("DB 접속 성공!!");
	}
	void closeRscPs() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}
	
	public member_vo login(String id, String pass) {
		member_vo m = null;
		try {
			setConn();
			String sql = "SELECT * \r\n"
					+ "FROM MEMBER \r\n"
					+ "WHERE id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new member_vo(rs.getString("id"),rs.getString("pass"),
						rs.getString("name"),rs.getString("auth"),rs.getInt("point"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB예외:" + e.getMessage());
			closeRscPs();
		}
		return m;
	}
	public void insertMember(member_vo ins) {
		String sql = "INSERT INTO MEMBER values(?,?,?,?,?)";
		try {
			setConn();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPass());
			pstmt.setString(3, ins.getName());
			pstmt.setString(4, ins.getAuth());
			pstmt.setInt(5, ins.getPoint());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 6. 예외 처리..
			System.out.println(e.getMessage());
			closeRscPs();
			
			
		}finally {
			System.out.println("등록 처리 완료!!");
		}
	}
	public member_vo getMember(String id) {
		member_vo m = null;
		try {
			setConn();
			String sql = "SELECT * \r\n"
					+ "FROM MEMBER \r\n"
					+ "WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new member_vo(rs.getString("id"),rs.getString("pass"),
						rs.getString("name"),rs.getString("auth"),rs.getInt("point"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB예외:" + e.getMessage());
			closeRscPs();
		}
		return m;
	}
	public void updateMember(member_vo upt) {
		String sql = "update member\r\n"
				+ "			set pass = ?,\r\n"
				+ "				name = ?,\r\n"
				+ "				auth = ?,\r\n"
				+ "				point = ?\r\n"
				+ "			where id = ?";
		try {
			setConn();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getPass());
			pstmt.setString(2, upt.getName());
			pstmt.setString(3, upt.getAuth());
			pstmt.setInt(4, upt.getPoint());
			pstmt.setString(5, upt.getId());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 6. 예외 처리..
			System.out.println(e.getMessage());
			closeRscPs();
			
			
		}finally {
			System.out.println("수정 처리 완료!!");
		}		
	}
	public void deleteMember(String id) {
		String sql = "delete \r\n"
				+ "		from member\r\n"
				+ "		where id = ?";
		try {
			setConn();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 6. 예외 처리..
			System.out.println(e.getMessage());
			closeRscPs();
			
			
		}finally {
			System.out.println("삭제 처리 완료!!");
		}		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

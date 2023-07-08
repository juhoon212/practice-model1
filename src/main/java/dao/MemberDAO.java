package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Member;

public class MemberDAO extends JdbcDAO{
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	private MemberDAO() {
		
	}
	
	public static MemberDAO getMemberDAO() {
		return memberDAO;
	}
	
	
	public int insertMember(Member member) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		try {
			
			String sql = "insert into member values(?, ? ,?)";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			
			rows = pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("db errror = " + e.getMessage());
		}finally {
			close(conn, pstmt, null);
		}
		
		return rows;
	}
	
	public Member login(String id, String password) throws SQLException{
		
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		
		try {
			
			String sql = "select * from member where id = ? , password = ?";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			Member member = null;
			
			if(rs.next()) {
				member = new Member();
				
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
			}
			
			return member;
		}catch(SQLException e) {
			System.out.println("db errror = " + e.getMessage());
			throw e;
		}finally {
			close(conn, pstmt, null);
		}
	}
	
	public Member findById(String id) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member member = null;
		
		try {
			
			String sql = "select * from member where id = ?";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
			}
		}catch (SQLException e) {
			System.out.println("db errror = " + e.getMessage());
			throw e;
		}finally {
			close(conn, pstmt, rs);
		}
		
		return member;
	}
}

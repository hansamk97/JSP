package com.codingbox.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.codingbox.web.dto.TblMemberDTO;

public class TblMemberDAO {
	
	Context context;
	DataSource dataSource;
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	
	// 회원가입
	public boolean join( TblMemberDTO member ) {
		String sql = "INSERT INTO tbl_member VALUES (?,?,?,?,?)";
		boolean result = false;
		int rNum = 0;
		
		try {
			//conn = DBConnection.getConnection();
			context = new InitialContext(null);
			dataSource 
			= (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			conn = dataSource.getConnection();			
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, member.getUserid());
			pstm.setString(2, member.getUserpw());
			pstm.setString(3, member.getUsername());
			pstm.setString(4, member.getUsergender());
			pstm.setString(5, member.getUserphone());
			
			// executeUpdate : 1.DML 문의 행의 숫자가 리턴
			//				   2.0이 리턴이 됐으면 아무일도 일어나지 않음
			rNum = pstm.executeUpdate();
			if( rNum != 0 ) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public TblMemberDTO login( String userid, String userpw ) {
		TblMemberDTO member = null;
		String sql = "SELECT * FROM TBL_MEMBER WHERE USERID = ? AND USERPW = ?";
		
		try {
			//conn = DBConnection.getConnection();
			context = new InitialContext(null);
			dataSource 
			= (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			conn = dataSource.getConnection();
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userid);
			pstm.setString(2, userpw);
			rs = pstm.executeQuery();
			
			if( rs.next() ) {
				member = new TblMemberDTO();
				member.setUserid( rs.getString(1) );
				member.setUserpw( rs.getString(2) );
				member.setUsername( rs.getString(3) );
				member.setUsergender( rs.getString(4) );
				member.setUserphone( rs.getString(5) );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}

		return member;
	}
	
	/*
	 *  return true 	: 중복되는 아이디 존재
	 *         false 	: 중복되는 아이디 없음 
	 */
	public boolean checkId(String userid) {
		boolean result = false;
		String sql = "SELECT count(*) FROM TBL_MEMBER WHERE USERID = ?";
		
		try {
			//conn = DBConnection.getConnection();
			context = new InitialContext(null);
			dataSource 
			= (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			conn = dataSource.getConnection();
			
			pstm = conn.prepareStatement(sql);
			
			System.out.println("userid : " + userid);
			pstm.setString(1, userid);
			rs = pstm.executeQuery();
			
			if( rs.next() ) {
				if( rs.getInt(1) == 1 ) {
					System.out.println("dao : " + rs.getInt(1));
					result = true;
				}
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}













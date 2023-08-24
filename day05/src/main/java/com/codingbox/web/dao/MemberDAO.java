package com.codingbox.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.codingbox.web.dto.MemberBean;

public class MemberDAO {

	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	
	// 이름으로 나이를 조회
	public int getAge(String name) {
		String sql = "SELECT age FROM MEMBER WHERE name = ?";
		int age = 0;
		
		try {
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, name);
			rs = pstm.executeQuery();
			
			if( rs.next() ) {
				age = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return age;
	}
	// 전체 항목 ArrayList 형태로 가져오기
	public ArrayList<MemberBean> selectALL(){
		ArrayList<MemberBean> result = new ArrayList<>();
		String sql = "SELECT * FROM MEMBER";
		
		try {
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while( rs.next() ) {
				MemberBean member = new MemberBean();
				member.setName(rs.getString(1));
				member.setAge(rs.getInt(2));
				result.add(member);
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}


















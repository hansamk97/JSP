package com.codingbox.web.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.web.mybatis.SqlMapConfig;

public class UserDAO {

	SqlSessionFactory factory = SqlMapConfig.getfaFactory();
	SqlSession sqlSession;
	
	public UserDAO() {
		sqlSession = factory.openSession(true);
	}
	
	// 회원가입
	public boolean join( UserDTO user ) {
		boolean result = false;
		
		if(sqlSession.insert("User.join", user) != 0) {
			result = true;
		}
		return result;
		}
	
	// 로그인
	public boolean login(String userid, String userpw) {
		boolean result = false;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
			
		if((Integer)sqlSession.selectOne("User.login",datas) == 1) {
			result = true;
		}
		
		return result;
	}
	
}

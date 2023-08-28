package com.codingbox.web.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.web.dto.TblMemberDTO;
import com.codingbox.web.mybatis.SqlMapConfig;

public class MyBatisMemberDAO {

	SqlSessionFactory factory = SqlMapConfig.getfaFactory();
	SqlSession sqlSession;
	
	public MyBatisMemberDAO() {
		sqlSession = factory.openSession(true);
		// true : auto commit
	}
	
	public boolean checkId(String userid) {
		boolean result = false;
		
		//query 호출
		int cnt = 0;
		
		// 1번째 param : 어떤 쿼리를 호출할지
		// 2번째 param : 쿼리 실행시 필요한 파라미터 값
		cnt = sqlSession.selectOne("Member.checkId", userid);
		if( cnt >= 1 ) {
			result = true;
		}
		
		return result;
	}
	
	public boolean join( TblMemberDTO member ) {
		boolean result = false;
		// 1번째 param : 어떤 쿼리를 호출할지
		// 2번째 param : 쿼리 실행시 필요한 파라미터 값
		if( sqlSession.insert( "Member.join", member ) == 1 ) {
			result = true;
		}
		
		return result;
	}
	
	public TblMemberDTO login( String userid, String userpw ) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		TblMemberDTO member =
		sqlSession.selectOne("Member.login", datas);
		return member;
		
	}
	
}



















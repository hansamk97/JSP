package com.codingbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.dto.MemberDTO;
import com.codingbox.web.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public MemberDAO() {
		sqlSession = factory.openSession(true);
		// true : auto commit 
	}
	
	public MemberDTO searchById( String userid ) {
		return (MemberDTO)sqlSession.selectOne("Member.searchById", userid);
	}
	
	public List<MemberDTO> getList() {
		List<MemberDTO> result = 
				sqlSession.selectList("Member.getList");
		return result;
	}
	
}
















package com.codingbox.web.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.web.mybatis.SqlMapConfig;

public class BoardDAO {

	SqlSessionFactory factory = SqlMapConfig.getfaFactory();
	SqlSession sqlSession;
	
	public BoardDAO() {
		sqlSession = factory.openSession(true);
	}

	public boolean insertBoard(BoardDTO board) {
		boolean result = false;
		
		if( sqlSession.insert("Board.insertBoard", board) == 1 ) {
			// 성공 시
			result = true;
		}
		
		return result;
	}

	public List<BoardDTO> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
		List<BoardDTO> list =
		sqlSession.selectList("Board.getBoardList", datas);
		return list;
	}

	public int getBoardCnt() {
		return sqlSession.selectOne("Board.getBoardCnt");
	}
	
	
}












package com.codingbox.web.board.dao;

import java.util.ArrayList;
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

	public BoardDTO getDetail(int boardnum) {
		return sqlSession.selectOne("Board.getDetail", boardnum);
	}

	public void updateReadCount(int boardnum) {
		sqlSession.update("Board.updateReadCount", boardnum);	// 쿼리문을 실행
	}


	public boolean addReply(ReplyDTO reply) {
		boolean result = false;
		
		if( sqlSession.insert("Board.addReply", reply) == 1 ) {
			result = true;
		}
		
		return result;
	}

	public List<ReplyDTO> getReplys(int boardnum) {
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		
		list = sqlSession.selectList("Board.getReplys", boardnum);
		
		return list;
	}

	public boolean updateReply(int replynum, String replycontent) {
		boolean result = false;
		
		HashMap<String, Object> datas = new HashMap<String, Object>();	// 파라미터 두개 이상일 땐 hashmap 사용
		datas.put("replynum", replynum);
		datas.put("replycontent", replycontent);
		
		if( sqlSession.update("Board.updateReply", datas) == 1 ) {
			result = true;
		}
		
		return result;
	}

	public boolean deleteReply(int replynum) {
		boolean result = true;
		
		if( sqlSession.delete("Board.deleteReply", replynum) == 1 ) {
			result = true;
		}
		
		return result;
	}


	
	

}










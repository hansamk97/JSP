package com.codingbox.web.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.action.Action;
import com.codingbox.action.ActionForward;
import com.codingbox.web.board.dao.BoardDAO;
import com.codingbox.web.board.dao.BoardDTO;

public class BoardWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		BoardDTO board = new BoardDTO();
		
		board.setBoardtitle(request.getParameter("boardtitle"));
		board.setBoardcontent(request.getParameter("boardcontent"));
		board.setUsername(request.getParameter("username"));
		
		if( bdao.insertBoard(board) ) {
			// 성공 시
			forward.setPath("/board/BoardWrite.bo");
		}else {
			// 실패 시
			forward.setPath("/board/BoardWrite.bo");
		}
		forward.setRedirect(true);	// redirect 방식으로 넘겨줄거야
		
		return forward;
	}

}

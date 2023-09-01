package com.codingbox.web.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.action.Action;
import com.codingbox.action.ActionForward;
import com.codingbox.web.board.dao.BoardDAO;

public class BoardViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		
		// 게시글 조회수 update(getDetail문 선택되기 전에, 조회수가 먼저 update)
		bdao.updateReadCount(boardnum);	// 어떤 글의 boardnum를 update할거야
		
		// 댓글 조회
		// dao, xml : getReplys
		request.setAttribute("replylist", bdao.getReplys(boardnum));
		
		request.setAttribute("board", bdao.getDetail( boardnum ));	// 상세게시글이 select, 게시글 상세 조회
		forward.setRedirect(false);	//false여야 redirect방식으로 넘어감
		forward.setPath("/board/boardview.jsp");
		
		
		return forward;

	}

}













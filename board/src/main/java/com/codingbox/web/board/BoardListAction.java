package com.codingbox.web.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.action.Action;
import com.codingbox.action.ActionForward;
import com.codingbox.web.board.dao.BoardDAO;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int totalCnt = bdao.getBoardCnt();				// 총 개수 구하기
		request.setAttribute("totalCnt", totalCnt);
		
		// 현재 페이지 넘겨받기
		String temp = request.getParameter("page");
		int page = 0;
		page = temp == null ? 1 : Integer.parseInt(temp);
		
//		if( temp == null ) {
//			page = 1;
//		}else {
//			page = Integer.parseInt(temp);
//		}
		
		int pageSize = 10;
		int endRow = page * 10;	// 1페이지 : 10, 4페이지 : 40
		int startRow = endRow - 9;	// 1패이지 : 1, 4페이지  : 31
		
		// [1][2]...[10] : [1]
		// [11][12]...[20] : [11]
		int startPage = (page - 1) / pageSize * pageSize + 1;
		
		// [1][2]...[10] : [10]
		// [11][12]...[20] : [20]
		int endPage = startPage + pageSize - 1;
		int totalPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("boardList", bdao.getBoardList(startRow, endRow));
		forward.setRedirect(false);
		forward.setPath("/board/boardlist.jsp");
		return forward;
	}
	

}



















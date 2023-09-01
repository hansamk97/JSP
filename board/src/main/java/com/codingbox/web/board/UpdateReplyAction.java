package com.codingbox.web.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.action.Action;
import com.codingbox.action.ActionForward;
import com.codingbox.web.board.dao.BoardDAO;

public class UpdateReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		String replycontent = request.getParameter("reply" + replynum);
		
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		
		if( bdao.updateReply(replynum, replycontent) ) {
			// 댓글 수정 성공시
			forward.setRedirect(true);
			forward.setPath("/board/BoardView.bo?boardnum="+boardnum);
			
		}else {
			// 댓글 수정 실패시
			try {
				forward.setRedirect(false);
				PrintWriter out = response.getWriter();
				out.println("<script>alert('댓글 수정 실패'); history.back();</script>");
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		
		
		return forward;
	}

}

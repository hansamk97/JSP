package com.codingbox.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.web.user.action.Action;
import com.codingbox.web.user.action.ActionForward;
import com.codingbox.web.user.dao.UserDAO;
import com.codingbox.web.user.dao.UserDTO;

public class UserJoinAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		// db연결 -> insert
		UserDAO udao = new UserDAO();
		
		// DTO에 담아서 insert 진행
		UserDTO udto = new UserDTO();
		
		udto.setUserid(request.getParameter("userid"));
		udto.setUserpw(request.getParameter("userpw"));
		udto.setUsername(request.getParameter("username"));
		udto.setUserphone(request.getParameter("userphone"));
		udto.setUseraddr(request.getParameter("useraddr"));
		
		forward.setRedirect(true);
		if( udao.join(udto) ) {
			// 회원가입 성공
			forward.setPath("/user/loginview.jsp");
			
		}else {
			// 회원가입 실패
			forward.setPath("/index.jsp");
			
		}
		
		return forward;
	}

	
}







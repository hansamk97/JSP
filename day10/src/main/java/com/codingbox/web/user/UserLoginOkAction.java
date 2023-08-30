package com.codingbox.web.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.web.user.action.Action;
import com.codingbox.web.user.action.ActionForward;
import com.codingbox.web.user.dao.UserDAO;
import com.codingbox.web.user.dao.UserDTO;

public class UserLoginOkAction implements Action{
	
		@Override
		public ActionForward excute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
	
		String uerid = request.getParameter("userid");
		String uerpw = request.getParameter("userpw");
		
		
		if(udao.login(uerid, uerpw)) {
			// 로그인 성공
			forward.setPath("/main/mainview.jsp");
		}else {
			// 로그인 실패
			forward.setPath("/user/loginview.jsp");
			
		}
		forward.setRedirect(true);
		return forward;
		}

	}
	
	
	
	
			
		


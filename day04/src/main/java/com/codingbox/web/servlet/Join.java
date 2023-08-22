package com.codingbox.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.codingbox.web.dao.UserDAO;
import com.codingbox.web.dto.UserDTO;

@WebServlet("/join")
public class Join extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		
		UserDTO dto = new UserDTO();
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		dto.setUsername(username);
		dto.setUserphine(userphone);
		
		UserDAO udao = new UserDAO();
		if(udao.join(dto)){
			// true면 회원가입 성공
			
		}else{
			// false 시 회원가입 실패
			
		}
	}
}

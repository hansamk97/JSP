package com.codingbox.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class DoFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);		
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("URI : " + request.getRequestURI());
		String requestURI = request.getRequestURI();
		String responseURI = null;
		
		if( requestURI.equals("/do1.do") ) {
//			request.setAttribute("result", "do1으로 요청보내기");
//			request.getRequestDispatcher("do1.jsp").forward(request, response);
			responseURI = new Do1().execute(request, response);
			
		}else if( requestURI.equals("/do2.do") ) {
//			request.setAttribute("result", "do2로 요청보내기");
//			request.getRequestDispatcher("do2.jsp").forward(request, response);
			responseURI = new Do2().execute(request, response);
			
		}else if( requestURI.equals("/do3.do") ) {
//			request.setAttribute("result", "do3로 요청보내기");
//			request.getRequestDispatcher("do3.jsp").forward(request, response);
			responseURI = new Do3().execute(request, response);
		}
		
		request.getRequestDispatcher(responseURI).forward(request, response);
	}
}













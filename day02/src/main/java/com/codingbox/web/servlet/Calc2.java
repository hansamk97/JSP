package com.codingbox.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/calc2")
public class Calc2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		
		// Application 저장소 선언
//		ServletContext application = arg0.getServletContext();
		
		// session 객체
		HttpSession session = arg0.getSession();
		
		PrintWriter out = arg1.getWriter();
		
		String value_ = arg0.getParameter("value");
		String op = arg0.getParameter("operator");
		int value = 0;
		
		if( !value_.equals("") ) {
			value = Integer.parseInt(value_);	
		}
		
		// 계산
		if( op.equals("=") ) {
			int x = (Integer)session.getAttribute("value");
			int y = value;
			String operator = (String)session.getAttribute("op");
			int result = 0;
			
			if( operator.equals("+") ) {
				result = x + y;
			}else {	// "-" 일 경우
				result = x - y;
			}
			
			out.printf("결과 값 : %d\n", result);
			
		}else {	// 값 계산
			session.setAttribute("value", value);
			session.setAttribute("op", op);
		}
	}
}

package com.codingbox.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class MyServlet2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {

		String xStr = arg0.getParameter("x");
		String yStr = arg0.getParameter("y");
		
		int x = 0, y = 0;
		
		if( !xStr.equals("") ) {
			x = Integer.parseInt(xStr);
		}
		if( !yStr.equals("") ) {
			y = Integer.parseInt(yStr);
		}
		
		int result = x + y;
		arg1.getWriter().printf("result is %d\n",  result);
		
	
	}
}

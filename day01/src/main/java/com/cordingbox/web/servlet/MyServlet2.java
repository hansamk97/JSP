package com.cordingbox.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello2")
public class MyServlet2 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		
		PrintWriter out = arg1.getWriter();
		out.println("Hello Servelt Annotation<br>");
		out.println("Hello Servelt Annotation<br>");
		out.println("Hello Servelt Annotation<br>");
		System.out.println("Hello Servelt Annotation");
	}
}

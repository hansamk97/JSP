<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// out은 내장 객체이기 때문에 객체선언 불가
    // PrintWriter out = response.getWriter();

	// http://localhost:8083/first.jsp
	String cntStr = request.getParameter("cnt");
	
	int cnt = 5;
	if( cntStr != null && cntStr.equals("") ){
		cnt = Integer.parseInt(cntStr);
	}
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% for( int i=0; i<cnt; i++){ %>
		안녕 servelt~~~ <br/>
	<%} %>
</body>
</html>
<%@page import="com.codingbox.web.dao.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.codingbox.web.dao.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		MemberDAO mdao = new MemberDAO();
		int age = mdao.getAge(name);
	%>
	<% if( age != 0 ){%>
		이름 : <%=name %><br/>
		나이 : <%=age %><br/>
	<% } else{%>
		찾는 이름이 없습니다.
	<% } %>
	
	
	<input type="button" value="다시 검색하기"
		 onclick="location.href='age_search.jsp'"/>
</body>
</html>
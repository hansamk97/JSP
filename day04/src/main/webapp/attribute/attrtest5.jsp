<%@page import="com.codingbox.vo.User"%>
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
		User[] arUser = {
				new User("apple", "김사과", 10),
				new User("java", "사과", 20),
				new User("app", "김사", 30),
		};
	
		request.setAttribute("users", arUser);
		pageContext.forward("attrtest6.jsp");
	%>
</body>
</html>
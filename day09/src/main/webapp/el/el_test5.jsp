<%@page import="java.util.ArrayList"%>
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
		ArrayList<String> arList = new ArrayList<>();
		arList.add("Hello");
		arList.add("JSP");
		arList.add("EL");
		arList.add("JSTP");
		pageContext.setAttribute("list",arList);
	%>
	${list }<br>
	<% for( int i=0; i<arList.size(); i++ ){ %>
		
	<%} %>
</body>
</html>














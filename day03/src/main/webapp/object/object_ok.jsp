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
		String username = request.getParameter("username");
		String userbirth = request.getParameter("userbirth");
		
		// 로직 처리
		//...
		
		// forward : request 객체가 유지
		// redirect : request 객체가 재생성
		// pageContext.forward("object_result.jsp");
		response.sendRedirect("object_result.jsp");
	%>
</body>
</html>
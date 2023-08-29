<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		pageContext.getAttribute("id");
		requestContext.getAttribute("id");
		sessionContext.getAttribute("id");
		applicationContext.getAttribute("id");
	 -->
	아이디 ${id }<br/>
	패스워드 ${pw }<br/>
	
	아이디 ${param.id }<br/>
	패스워드 ${param.pw }<br/>
</body>
</html>

















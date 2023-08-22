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
	// request.getParameter()
	//	: 요청을 보낸 페이지에서 <input>으로 보낸 데이터를 받을 때 사용
	String userid = "apple";
	String userpw = "abcd1234";
	String username = "김사과";
	
	//request.setAttribute("userid", userid);
	//request.setAttribute("userpw", userpw);
	//request.setAttribute("username", username);
	//pageContext.forward("attrtest2.jsp");
	
	//session
	session.setAttribute("userid", userid);
	session.setAttribute("userpw", userpw);
	session.setAttribute("username", username);
	pageContext.forward("attrtest2.jsp");
	//response.sendRedirect("attrtest2.jsp");
	
	
%>

</body>
</html>
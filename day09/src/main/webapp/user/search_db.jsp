<%@page import="com.codingbox.dto.MemberDTO"%>
<%@page import="com.codingbox.dao.MemberDAO"%>
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
		String userid = request.getParameter("userid");
		System.out.println(userid);
		MemberDAO dao = new MemberDAO();
		MemberDTO user = dao.searchById(userid);
		System.out.println(user);
		request.setAttribute("user", user);
		pageContext.forward("searchview.jsp");
	%>
</body>
</html>
















<%@page import="com.codingbox.web.dao.UserDAO"%>
<%@page import="com.codingbox.web.dto.UserDTO"%>
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
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String userphone = request.getParameter("userphone");
		
		UserDTO dto = new UserDTO();
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		dto.setUsername(username);
		dto.setUserphine(userphone);
		
		UserDAO udao = new UserDAO();
		if(udao.join(dto)){
			// true면 회원가입 성공
			
		}else{
			// false 시 회원가입 실패
			
		}
	%>
</body>
</html>
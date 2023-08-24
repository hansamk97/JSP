<%@page import="com.codingbox.web.dao.TblMemberDAO"%>
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
		TblMemberDAO mdao = new TblMemberDAO();
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		if( mdao.login(userid, userpw) ){		// 로그인 성공
	%>
		<script>
			alert("로그인 성공");
		</script>
	<%} else { // 로그인 실패 %>
		<script>
			alert("로그인 실패");
		</script>
	<%} %>
</body>
</html>
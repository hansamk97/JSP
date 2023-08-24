<%@page import="com.codingbox.web.dto.TblMemberDTO"%>
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
		
		TblMemberDTO member = mdao.login(userid, userpw);
		System.out.println("member : " + member);
		
		if( member != null ){		// 로그인 성공
			session.setAttribute("session_id", member);
			
	%>
		<script>
			alert("로그인 성공");
			location.href = 'mainview.jsp';
		</script>
	<%} else { // 로그인 실패 %>
		<script>
			alert("로그인 실패");
			location.href = 'loginview.jsp';
		</script>
	<%} %>
</body>
</html>
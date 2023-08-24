<%@page import="com.codingbox.web.dao.TblMemberDAO"%>
<%@page import="com.codingbox.web.dto.TblMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="member" class="com.codingbox.web.dto.TblMemberDTO"/>
	<!-- 외부에서 전달된 name속성과 필드의 이름이 같으면 value가 자동으로 세팅된다.  -->
	<jsp:setProperty property="*" name="member"/>
	
<%-- 	<jsp:setProperty property="userid" name=""/> --%>
<%-- 	<jsp:setProperty property="userid" name=""/> --%>
<%-- 	<jsp:setProperty property="userid" name=""/> --%>
	
	<%
		TblMemberDAO mdao = new TblMemberDAO();
		if( mdao.join( member ) ){	// 회원가입 성공
	%>
		<script>
			alert("회원가입 성공!");
			location.href = "loginview.jsp";
		</script>
	<% } else { // 회원가입 실패 %>
		<script>
			alert("회원가입 실패!");
			location.href = "joinview.jsp";
		</script>
	<% } %>
</body>
</html>
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
	<%
		//String userid = (String)session.getAttribute("session_id");
	
		TblMemberDTO member = (TblMemberDTO)session.getAttribute("session_id");
		
		if( member != null ){	//로그인 한 사람
			
	%>
	<script>
		alert( "<%=member.getUsername()  %> 님 안녕하세요!");
	</script>
	<p>
		<%=member.getUsername()  %>님 (<%=member.getUserid() %>)
		<input type="button" value="로그아웃"
		 	onclick="location.href='logout_db.jsp'" />
	</p>
	<%} else{ 	// 로그인 안 한 사람%>
		<script>
			alert("로그인 후 이용해주세요!");
			location.href = "loginview.jsp";
		</script>	
	
	<%} %>

</body>
</html>
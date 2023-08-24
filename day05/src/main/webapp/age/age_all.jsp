<%@page import="com.codingbox.web.dto.MemberBean"%>
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
	<jsp:useBean id="mdao" class="com.codingbox.web.dao.MemberDAO"/>
	<%
		ArrayList<MemberBean> result = mdao.selectALL();
	%>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		<%  for( MemberBean member : result ){ %>
			<tr>
				<td><%=member.getName() %></td>
				<td><%=member.getAge() %></td>
			</tr>
		<% } %>
	</table>
	<input type="button" value="다시 검색하기"
		 onclick="location.href='age_search.jsp'"/>
</body>
</html>
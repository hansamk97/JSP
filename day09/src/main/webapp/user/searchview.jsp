<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="search_db.jsp">
		검색하실 회원 ID <input type="text" name="userid"/><br/>
		<input type="button" value="전체회원보기" 
			onclick="location.href='list_db.jsp'">
		<input type="submit">		 
	</form>
	<hr/>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>휴대전화</th>
			<th>상세주소</th>
		</tr>
		<c:choose>
			<c:when test="${!empty requestScope.user}">
				<tr>
					<c:set var="user" value="${requestScope.user }"/>
					<td>${user.userid }</td>
					<td>${user.userpw }</td>
					<td>${user.username }</td>
					<td>${user.userphone }</td>
					<td>${user.addr }</td>
				</tr>
			</c:when>
			<c:otherwise>				
				<c:forEach var="user" items="${requestScope.list }">
					<tr>
						<td>${user.userid }</td>
						<td>${user.userpw }</td>
						<td>${user.username }</td>
						<td>${user.userphone }</td>
						<td>${user.addr }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>













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
	<c:choose>
		<%-- param.userid가 empty일때  --%>
		<c:when test="${empty param.userid }">
			<form action="">
				아이디 : <input type="text" name="userid"/><br/>
				비밀번호 : <input type="password" name="userpw"/><br/>
				<input type="submit"/>
			</form>
		</c:when>
		<%-- param.userid가 empty가 아닌 경우 일때 --%>
		<c:otherwise>
			<c:set var="userid" value="${param.userid }"/>
			<c:set var="userpw" value="${param.userpw }"/>
			<c:choose>
				<c:when test="${userid == 'apple' }">김사과</c:when>
				<c:when test="${userid == 'admin' }">관리자</c:when>
				<c:otherwise>비회원</c:otherwise>
			</c:choose>			
		</c:otherwise>
	</c:choose>
</body>
</html>












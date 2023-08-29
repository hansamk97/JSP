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
	<h2>JSTL TEST(변수)</h2>
	<!-- 변수선언, scope : 어느 범위까지 사용하는지, page : pageContext -->
	<!-- jstl로 변수 선언 시, setAttribute로 값을 넣기때문에, 
		el문으로 값을 가지고 올 수 있다. -->
	<c:set var="userid" value="apple" scope="page"/>
	회원아이디 <c:out value="${userid }" /><br/>
	회원아이디 ${userid }<br/>
	<hr/>
	<%-- <c:set>이사이에 들어가는 값이 value</c:set> --%>
	<c:set var="userid" scope="session">admin</c:set>
	<c:set var="userpw" scope="session">admin0000</c:set>
	회원아이디 : ${userid }<br/>
	회원패스워드 : ${userpw }<br/>
	회원아이디 : ${sessionScope.userid }<br/>
	회원패스워드 : ${sessionScope.userpw }<br/>
</body>
</html>














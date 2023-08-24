<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean class="com.codingbox.web.dto.MemberBean" id="member"/>
	
	<jsp:setProperty property="name" name="member" value="김자바"/>	
	<jsp:setProperty property="age" name="member" value="22"/>	
	
	<table border="1">
		<tr>
			<th>이름</th>		
			<th>나이</th>		
		</tr>
		<tr>
			<td>
				<jsp:getProperty property="name" name="member"/>
			</td>		
			<td>
				<jsp:getProperty property="age" name="member"/>
			</td>		
		</tr>
	</table>
	
	
</body>
</html>
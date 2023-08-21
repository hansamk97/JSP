<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="action.jsp" method="post" name="myform">
		<fieldset>
			<legend>Post Data 전송예제</legend>
			<div>
				<label>
					이름 :
					<input type="text" name="user_name" id="user_name">
				</label>
			</div>
		</fieldset>
		<button type="submit">Submit</button>
	</form>
</body>
</html>
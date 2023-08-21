<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>내장 객체 예제</h3>
	<form action="object_ok.jsp" name="joinForm">
		<fieldset>
			<legend>개인정보</legend>
			<input type="text" name="username">
			<input type="date" name="userbirth">
			<input type="submit" value="확인" onclick="sendit();">
		</fieldset>
	</form>
	
	<script>
		function sendit(){
			let joinForm = document.joinForm;
			let nameTag = joinForm.username;
			let birthTag = joinForm.userbirth;
			
			if( nameTag.value == "" ){
				alert("이름을 입력하세요");
				nameTag.focus();
				return false;
			}
			joinForm.submit();
		}
	</script>
</body>
</html>
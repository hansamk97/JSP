<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		let xhr = new XMLHttpRequest();
		// 요청
		xhr.open("GET", "data.json", true);
		xhr.send();
		xhr.onreadystatechange = function(){
	   		// 응답, 성공한 경우
	   		if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				//alert(JSON.parse(xhr.responseText));
				let obj = JSON.parse(xhr.responseText);
				alert(obj.count);
				alert(obj.result);
				
			}
		}
	</script>
</body>
</html>
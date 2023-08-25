<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Ajax 요청 보내기 테스트</h3>
	<input type="submit" value="GET방식으로 요청 보내기" onclick="send1();" />
	<input type="submit" value="POST방식으로 요청 보내기" onclick="send2();" />
	<p id="result"></p>

	<script>
		function send1(){
	        let xhr = new XMLHttpRequest();
	        	// 요청
	        xhr.open("GET", "request_ajax.jsp?userid=apple&userpw=abc1234", true);
	        xhr.send();
	        xhr.onreadystatechange = function(){
	           // 응답, 성공한 경우
	           if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
	             document.getElementById("result").innerHTML = xhr.responseText;
	             // alert(xhr.responseText);
           }
        }
     }
	
		function send2(){
			let xhr = new XMLHttpRequest();
	    	// 요청
		    xhr.open("POST", "request_ajax.jsp", true);
	    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    xhr.send("userid=student&userpw=std1234");
		    xhr.onreadystatechange = function(){
		       // 응답, 성공한 경우
		       if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
		         document.getElementById("result").innerHTML = xhr.responseText;
		         // alert(xhr.responseText);
       		}
    	}
 	}
	
	</script>
</body>
</html>
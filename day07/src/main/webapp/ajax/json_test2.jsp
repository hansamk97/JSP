<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax를 이용해 실시간 순위 나타내기</h1>
	<table border="1">
		<tr>
			<th>실시간 검색 순위</th>
			<th>키워드</th>
		</tr>
		<tr>
			<td id="td1">순위</td>
			<td id="td2">키워드</td>
		</tr>
	</table>
	<script>
		window.onload = function(){
			let obj = "";
			let word = new Array();
			let xhr = new XMLHttpRequest();
			// 요청
			xhr.open("GET", "data2.json", true);
			xhr.send();
			xhr.onreadystatechange = function(){
		   		// 응답, 성공한 경우
		   		if( xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
					obj = JSON.parse( xhr.responseText );
					//alert(obj);
					// 파싱된 obj에서 search_word라는 key를 가지고
					// value값을 꺼내오면
					// [{}, {}, {}, {}, {}]가 나온다.(즉, 배열이다.)
					for( let i=0; i<obj.search_word.length; i++ ){
						word[i] = obj.search_word[i].name;
					}
				}
			}
			
			let i = 0;	// 순위
			let interval = setInterval(function(){
				// json 안에 있는 search_word 배열의 길이로 나눈 나머지는
				// 0, 1, 2, 3, 4 -> 5가 되는 순간 다시 0이 된다.
				i = i%obj.search_word.length;
				document.getElementById("td1").innerHTML = i + 1;
				document.getElementById("td2").innerHTML = word[i];
				i++;
			}, 2000);
			
			// setTimeout(함수, 밀리초) : 해당 밀리초 이후에 앞에 넘겨준 함수 호출
			setTimeout(function(){
				// clearInterval(인터벌) : 해당 인터벌을 삭제
				clearInterval(interval);
				
			}, 20000);	// 20000 : 20초 뒤
			
			
		}
		
		
	
	</script>
</body>
</html>
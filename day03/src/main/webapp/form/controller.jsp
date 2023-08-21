<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String site = 
		request.getParameter("site");
	// System.out.println(site);
	
	String resultURL = "";
	if( site.equals("naver") ){
		resultURL = "forward_naver.jsp";
		
	}else if( site.equals("google") ){
		resultURL = "forward_google.jsp";
		
	}else if( site.equals("daum") ){
		resultURL = "forward_daum.jsp";
		
	}

%>
	<!-- 
		forward는 사용하자마자 바로 해당 페이지가 열린다.
		따라서 기능을 구현하는 이 controller에서 forward를 사용한다.
	 -->
	<jsp:forward page="<%=resultURL %>" />
</body>
</html>

















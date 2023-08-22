<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// controller
	int num = 0;
	String num_ = request.getParameter("num");
	if( num_ != null || !num_.equals("") ){
		num = Integer.parseInt(num_);
	}
	
	String result = "";
	if( num % 2 != 0 ){
		result = "홀수";
	}else{
		result = "짝수";
	}
	
%>
<!-- view -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- model -->
	<%=result %>

</body>
</html>
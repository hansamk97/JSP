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
		pageContext.setAttribute("result","hello");	
	%>
<%-- 	<%=request.getAttribute("result") %><br/> --%>
	${result}<br/>
	${requestScope.result}<br/>
	
<%-- 	${names[0] }<br/> --%>
<%-- 	${names[1] }<br/> --%>
	
<%-- 	${notice.id }<br/> --%>
<%-- 	${notice.title }<br/> --%>
	------------------------------------------------------<br/>
	${param.num}	<br/>
	------------------------------------------------------<br/>
	${param.num >= 3 }
	${param.num ge 3 }<br/>
	------------------------------------------------------<br/>
	${empty param.num }<br/>
	${not empty param.num }<br/>
	------------------------------------------------------<br/>
	${empty param.num?'값이 비어있습니다.':param.num }
</body>
</html>













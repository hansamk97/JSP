<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp";
	String password = "jsp";
	
	int check = 0;
	
	Class.forName(driver);
	System.out.println("jdbc Driver 로딩 성공");
	
	conn = DriverManager.getConnection(url, user, password);
	System.out.println("오라클 연결 성공");
	
	// String sql = "select sysdate from dual";
	String sql = "select * from car";
	PreparedStatement pstm = conn.prepareStatement(sql);
	ResultSet rs = pstm.executeQuery();
	
	while( rs.next() ){
		out.print("차 번호 : " + rs.getString(1) + "<br/>");
		out.print("차 브랜드 : " + rs.getString("BRAND") + "<br/>");
		out.print("차 색상 : " + rs.getString(3) + "<br/>");
		out.print("차 가격 : " + rs.getInt("PRICE") + "원<br/>");
	}
	
//	if( rs.next() ){
//		out.println( rs.getDate(1) );
//	}
	
	out.print("<br/><hr>");
	
	String carnum = "4";	// 앞으로는 프론트 단에서 받는 값
	//재할당
	//sql = "SELECT * FROM CAR c WHERE CARNUM = ";
	sql = "SELECT * FROM CAR c WHERE CARNUM = ?";
	pstm = conn.prepareStatement(sql);
	
	pstm.setString(1, carnum);
	rs = pstm.executeQuery();
	if( rs.next() ){
		out.print("차 번호 : " + rs.getString(1) + "<br/>");
		out.print("차 브랜드 : " + rs.getString("BRAND") + "<br/>");
		out.print("차 색상 : " + rs.getString(3) + "<br/>");
		out.print("차 가격 : " + rs.getInt("PRICE") + "원<br/>");
	}
	
	
	
	
%>
</body>
</html>
























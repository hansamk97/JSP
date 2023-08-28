<%@page import="com.codingbox.web.dao.MyBatisMemberDAO"%>
<%@page import="com.codingbox.web.dao.TblMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	// TblMemberDAO에서 db조회 후 (checkId(userid)), checkId -> boolean
	// 해당 아이디로 가입이 가능하면 out.print("ok"),
	// 그렇지 않으면 out.print("not-ok")
	//TblMemberDAO mdao = new TblMemberDAO();
	MyBatisMemberDAO mdao = new MyBatisMemberDAO();
	if( !mdao.checkId(userid) ){
		// 회원가입 가능한 상태값
		out.print("ok");
	}else{
		// 회원가입 불가능한 상태값
		out.print("not-ok");
	}
	
	
	
%>

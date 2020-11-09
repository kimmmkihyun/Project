<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
logout_3.jsp<br>

<%
	session.invalidate();					//모든 session해제하고start_4.jsp로 가라
	response.sendRedirect("start_4.jsp");
%>
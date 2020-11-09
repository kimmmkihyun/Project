<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<%@ include file="../user/user_top_4.jsp" %>
    
WEB-INF\member\MemberRegisterCompleted.jsp<br>

<%
	String viewPage = request.getContextPath() + "/loginForm.me";
	response.sendRedirect(viewPage);
%>
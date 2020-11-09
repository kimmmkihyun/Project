<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   String viewPage = request.getContextPath() + "/user.uspage";
   
   response.sendRedirect(viewPage); 
%>
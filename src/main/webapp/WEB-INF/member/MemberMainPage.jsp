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
   String viewPage = request.getContextPath() + "/user.uspage";
   session.getAttribute("loginInfo2");
   response.sendRedirect(viewPage);
%>

</body>
</html>
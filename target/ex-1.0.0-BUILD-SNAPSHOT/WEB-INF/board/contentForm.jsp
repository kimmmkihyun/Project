<%@page import="board.model.BoardDao"%>
<%@page import="board.model.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="color.jsp" %> 
<style type="text/css">
body {
    width: 100%;
    text-align : center;
}
table {
    margin: 0 auto;
}   
</style>     
	content.jsp<br>
	<body bgcolor="<%=bodyback_c %>">
	
	
	글내용 보기
	<table border="1" width="450" align="center" cellspacing="0">
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>" >글번호 </td>
		<td width="125"  align="center">${bean.num }</td>  
		<td width="125"  align="center" bgcolor="<%=value_c %>">조회수 </td>
		<td width="125"  align="center">${bean.readcount }</td>
		
	</tr>
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>">작성자 </td>
		<td width="125"  align="center" >${bean.writer }</td>
		<td width="125"  align="center" bgcolor="<%=value_c %>" >작성일</td>
		<td width="125"  align="center" >${bean.regdate }
		
	</tr>
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>">글제목 </td>
		<td colspan="3" align="center" >${bean.subject }</td>
		
		
	</tr>
	<tr>
		<td width="125"  align="center" bgcolor="<%=value_c %>">글내용 </td>
		<td colspan="3">${bean.content }</td>
		
		
	</tr>
	<tr>
		<td colspan=4  align="center" height="30" bgcolor="<%=value_c %>">
			<input type="submit" value="글수정" onClick="location.href='update.bd?num=${bean.num }'">  
			<input type="button" value="글삭제" onClick="location.href='delete.bd?num=${bean.num}'"> 
			<input type="button"  value="답글쓰기" onClick= "location.href='reply.bd?num=${bean.num }&ref=${bean.ref }&re_level=${bean.relevel }&re_step=${bean.restep }'"> 
			<input type="button" value="목록보기" onClick="location.href='list.bd'">
		</td>
	</tr>

	
	</table>
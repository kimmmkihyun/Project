<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<style type="text/css">
	body {
		width : 100%;
		text-align : center;
	}
	
	table {
		margin : 0 auto;
	}
</style>
list.jsp<br>
<body>
<b>글목록(전체 글:${pageInfo.totalCount })</b>
<form action="list.bd" method="get">
	<select name="whatColumn">
		<option value="all">전체
		<option value="subject">제목
		<option value="writer">작성자
	</select>
	<input type="text" name="keyword" value="홍길동">
	<input type="submit" value="검색">
</form>
<table width="700" border="1">
	<tr>
		<td align="right">
			<a href="write.bd">글쓰기</a>
		</td>
	</tr>
</table>
<c:if test="${totalCount == 0}">
<table width="700" border="1">
		<tr>
			<td>게시판에 저장된 글이 없습니다.</td>		
		</tr>
	</table>
</c:if>
		
<c:if test="${ not (totalCount == 0) }">
	<table width="700" align="center" border="1">
		<tr>
			<td align="center" width="50">번호</td>	
			<td align="center" width="250">제 목</td>	
			<td align="center" width="100">작성자</td>	
			<td align="center" width="150">작성일</td>	
			<td align="center" width="50">조회</td>	
			<td align="center" width="10">IP</td>	
			
		</tr>		
		<c:forEach items ="${lists }" var ="bd">
    	<tr>
    		<td>${bd.num }</td>
    		<td><a href="content.bd?num=${bd.num}">${bd.subject }</a></td>
    		<td>${bd.writer }</td>
    		<td>${bd.regdate }</td>
    		<td>${bd.readcount }</td>
    		<td>${bd.ip }</td>
    	</tr>
    </c:forEach>
			
			
	</table>
</c:if>
</body>
${pageInfo.pagingHtml}


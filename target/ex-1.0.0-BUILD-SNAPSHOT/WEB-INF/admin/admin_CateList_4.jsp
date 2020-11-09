<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file = "common.jsp" %>

<style type="text/css">

	.table{
		width: 30%;
		margin: 0 auto;
		margin-top: 4vh; 
	}
	#top_form2{
		width: 30%;
		margin: 0 auto;
		margin-top: 2vh;   
	}
	#top_form1{
		width: 60%;
		margin: 0 auto;
		margin-top: 6vh;
	}
	th{
		text-align: center;
	}
	td{
		text-align: center;
	}
	#paging{
		width: 45%;
		margin: 0 auto;
		text-align: center;
		margin-top: 4vh;
	}
</style>

<script type="text/javascript">
	function insert(){
		location.href='input.cate'; 
	}
	function goUpdate(cnum,pageNumber,pageSize){
		location.href="update.cate?cnum="+cnum+"&pageNumber="+pageNumber+"&pageSize="+pageSize; 
	}
	function goDelete(cnum,pageNumber){
		location.href="delete.cate?cnum="+cnum+"&pageNumber="+pageNumber; 
	}
</script>

<!--  WEB-INF\admin\category\CateList.jsp 입니다.<br> -->

<div id="top_form1">
	<font color="gray" size="5" ><b>카테고리 목록</b></font>  
</div>
<form action="list.cate" method="get" id="top_form2">
	<select name="whatColumn">
		<option value="all">전체 검색
		<option value="code">대분류
		<option value="cname">소분류
	</select>
	<input type="text" name="keyword" value="Jacket">
	<input type="submit" value="검색" class="btn btn-light" style="background: #e0e0e0;">
	<input type="button" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;" value="카테고리 추가" onclick="insert()">
	
</form>

<table align="center" width="40%" class="table">
	<tr>
		<th>번호</th>
		<th>카테고리 대분류</th>
		<th>카테고리 소분류</th>
		<th>수정 | 삭제</th>  
	</tr>  
	
	<c:forEach var="cate" items="${ lists }"> 
	<tr>
		<td>${ cate.cnum }</td>
		<td>${ cate.code }</td>
		<td>${ cate.cname }</td>          
		<td>
			<%-- <button type="button" class="btn btn-light" onClick="goUpdate('${cate.cnum }','${pageInfo.pageNumber}','${pageInfo.pageSize}')">수정</button>
			<button type="button" class="btn btn-light" onClick="goDelete('${cate.cnum }','${pageInfo.pageNumber}')">삭제</button> --%>
			<a href="update.cate?cnum=${cate.cnum }&pageNumber=${pageInfo.pageNumber}&pageSize=${pageInfo.pageSize}">수정</a> |
			<a href="delete.cate?cnum=${cate.cnum }&pageNumber=${pageInfo.pageNumber}">삭제</a> 
			<%-- <a href="delete.cate?cnum=${cate.cnum }&pageNumber=${pageInfo.pageNumber}">삭제</a> --%> 
		</td>
	</tr>
	</c:forEach>
	
	
</table>

<div id="paging">
	${pageInfo.pagingHtml }
</div>
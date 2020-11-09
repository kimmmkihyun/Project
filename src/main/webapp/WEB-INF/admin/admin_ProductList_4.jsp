<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file = "common.jsp" %>
<!-- WEB-INF\admin\product\ProductList.jsp -->
<script type="text/javascript">
	function insert(){
		location.href='input.prd'; 
	}	
</script>	
	
	
<style type="text/css">
	.table{
		width: 60%;
		margin: 0 auto;
		margin-top: 4vh; 
	}
	#top_form2{
		width: 45%;
		margin: 0 auto;
		margin-top: 4vh;
	}
	#top_form1{
		width: 60%;
		margin: 0 auto;
		margin-top: 6vh;
	}
	th{
		text-align: center;
	}
	#paging{
		width: 45%;
		margin: 0 auto;
		text-align: center;
		margin-top: 4vh;
	}
</style>
<div id="top_form1">
	<font color="gray" size="5" ><b>상품 목록(재고관리)</b></font>  
</div>

<form action="list.prd" method="get" id="top_form2">
	<select name="whatColumn" align="center">
		<option value="all">전체 검색
		<option value="pnum">상품번호
		<option value="pname">상품이름
	</select>
	<input type="text" name="keyword" value="자켓">
	<input type="submit" class="btn btn-light" style="background: #e0e0e0;" value="검색">
	<input type="button" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;" value="상품 추가" onclick="insert()">
	
</form>

<form action="post" enctype="multipart/form-data">
<!-- <p align="center">상품 리스트(재고관리)</p>	 -->
<table align="center" width="40%" class="table">
	<tr>
		<th>상품번호</th>
		<th>상품이름</th>
		<th>이미지</th>
		<th>코드</th>
		<th>스펙</th>
		<th>가격</th>
		<th>적립포인트</th>
		<th>수정|삭제</th>
	</tr>	
	
	<c:forEach var="prd" items="${ list }"> 
	<tr>
		<td align="center">${prd.pnum }</td>
		<td align="center">
			<a href="detail.detail?pnum=${prd.pnum }">${prd.pname }</a>
		</td>
		<td align="center">
		
			<img src="<%=request.getContextPath() %>/resources/${prd.pimage }"  width="100px" height="100px"/>
		
		</td>
		<td align="center">${prd.pcode }</td>
		<td align="center">${prd.pspec }</td>
		<td align="center">${prd.price }</td>
		<td align="center">${prd.point }</td>
		<td align="center">
		<a href="update.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}&pageSize=${pageInfo.pageSize}">수정</a> | 
		<a href="delete.prd?pnum=${prd.pnum }&pageNumber=${pageInfo.pageNumber}">삭제</a></td>
	</tr>
	</c:forEach>


</table>
</form>

<div id="paging">
	${pageInfo.pagingHtml }
</div>

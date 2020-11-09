<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file = "common.jsp" %>

<style type="text/css">

	.table{
		width: 40%;
		margin: 0 auto;
		margin-top: 4vh; 
	}
	#top_form2{
		width: 40%;
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

<script>
	function list() {
		location.href = "admin_ProductList_4.jsp";
	} 
	
	
</script>
<%

	String pnum = request.getParameter("pnum");
	String pcode = request.getParameter("pcode");
	String psize = request.getParameter("psize");
	/* 
	out.println("pnum = "+pnum);
	out.println("pcode = "+pcode);
	out.println("psize = "+psize);   
	*/
%>
<!-- WEB-INF\admin\product\ProductDetailList_4.jsp 입니다.<br> -->
<div id="top_form1">
	<font color="gray" size="5" ><b>재고 확인</b></font>  
</div>

<form action="detaillist.detail" method="get" id="top_form2">
	<select name="whatColumn">
		<option value="all">전체 검색
		<option value="pnum">상품번호
		<option value="pname">상품이름
	</select>
	<input type="text" name="keyword" value="1001">
	<input type="submit" value="검색">
</form>

<table align="center" width="40%" class="table">
	<tr>
		<th>번호</th>	
		<th>상품번호</th> 		
		<th>상품코드</th>
		<th>상품명</th>
		<th>사이즈</th>
		<th>색상</th>
		<th>재고</th>
		<th>수정 | 삭제</th>
	</tr>
	<c:forEach items="${lists }" var="detail">
	<tr>
		<td align="center">${detail.dnum }</td>
		<td align="center">${detail.pnum }</td>
		<td align="center">${detail.pcode }</td>
		<td align="center">${detail.pname }</td>
		<td align="center">${detail.psize }</td>
		<td align="center">${detail.pcolor}</td>
		<td align="center">${detail.pstock }</td>
		<td align="center">
			<a href="update.detail?dnum=${detail.dnum }&pageNumber=${pageInfo.pageNumber}&pageSize=${pageInfo.pageSize}">수정</a> |
			<a href="delete.detail?dnum=${detail.dnum }&pageNumber=${pageInfo.pageNumber}">삭제</a>
		</td>
	</tr>
</c:forEach>	
	
	
</table>

<div id="paging">
	${pageInfo.pagingHtml }
</div>


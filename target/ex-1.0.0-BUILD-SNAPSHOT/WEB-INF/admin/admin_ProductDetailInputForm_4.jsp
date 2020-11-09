<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file ="common.jsp" %>
<!-- WEB-INF\admin\product\ProductDetailInputForm_4.jsp -->

<style type="text/css">

	.table{
		width: 27%;
		margin: 0 auto;
		margin-top: 7vh; 
	}
	#top_form{
		width: 60%;
		margin: 0 auto;
		margin-top: 6vh;
	}
	th{
		text-align: center;
		width: 40%;
	}
</style>

<div id="top_form">
	<font color="gray" size="5" ><b>재고 등록</b></font>  
</div>

<form action="detail.detail" method="post">
<input type="hidden" name="pnum" value="${product.pnum }">
<input type="hidden" name="pcode" value="${product.pcode }">
<table  align="center" width="40%" class="table">
	<tr>
		<th>상품명</th>
		<td><input type="text" name="pname" value="${product.pname }"></td>
	</tr>
	
	<tr>
		<th>사이즈</th>
		<td>
			<input type="text" name="psize" value="">
		</td>
	</tr>
	
	<tr>
		<th>색상</th>
		<td> 
			<input type="text" name="pcolor" value="">
		</td>
	</tr>
	
	<tr>
		<th>재고</th>
		<td>
			<input type="text" name="pstock" value="">개
		</td>		
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="등록 후 리스트보기" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;">
			<input type="reset" value="취소" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;">
		</td>
	</tr>
</table>
</form>



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file ="common.jsp" %>
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


WEB-INF\admin\product\ProductDetailUpdateForm_4.jsp 입니다.<br>
<div id="top_form">
	<font color="gray" size="5" ><b>재고 수정</b></font>  
</div>

<form:form commandName="productDetail" action="update.detail" method="post">
<input type="hidden" name="dnum" value="${productDetail.dnum }">
<input type="hidden" name="pnum" value="${productDetail.pnum}">
<input type="hidden" name="pcode" value="${productDetail.pcode }">

<table border="1">
	<tr>
		<td>상품명</td>
		<td><input type="text" name="pname" value="${productDetail.pname }" disabled></td>
	</tr>
	
	<tr>
		<td>사이즈</td>
		<td>
			<input type="text" name="psize" value="${productDetail.psize }" disabled>
		</td>
	</tr>
	
	<tr>
		<td>색상</td>
		<td> 
			<input type="text" name="pcolor" value="${productDetail.pcolor }" disabled>
		</td>
	</tr>
	
	<tr>
		<td>재고</td>
		<td>
			<input type="text" name="pstock" value="${productDetail.pstock }">개
		</td>		
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정 후 리스트보기">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form:form>



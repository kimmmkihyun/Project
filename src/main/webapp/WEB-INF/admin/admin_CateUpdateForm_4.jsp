<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- WEB-INF\admin\category\CateInputForm.jsp 입니다.<br> -->
<%@ include file ="admin_top_4.jsp" %>
<%@ include file = "common.jsp" %>

<style type="text/css">
		.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
		}
	.table{
		width: 30%;
		margin: 0 auto;
		margin-top: 7vh; 
	}
	#top_form{
		width: 60%;
		margin: 0 auto;
		margin-top: 6vh;
	}
</style>

<div id="top_form">
	<font color="gray" size="5" ><b>카테고리 수정</b></font>  
</div>

<form:form commandName="category" action="update.cate" method="post" name="myform">
<input type="hidden" name="cnum" value="${ category.cnum }">
<input type="hidden" name=pageNumber value="${pageNumber }">
<input type="hidden" name=pageSize value="${pageSize }">	
	<table  align="center" width="40%" class="table">
		<tr>
			<td align="center">	
				<b>카테고리 대분류</b>	
			</td>
			
			<td>	
				<input type="text" name="code" value="${ category.code }">
			</td>
		</tr>
		
		<tr>
			<td align="center">	
				<b>카테고리 소분류</b>	
			</td>
			
			<td>	
				<input type="text" name="cname" value="${ category.cname }">
				<form:errors cssClass="err" path="cname"/>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;">
				<input type="reset" value="취소" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;">
			</td>
		</tr>
	</table>
	</form:form>	






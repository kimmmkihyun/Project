<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- WEB-INF\admin\category\CateInputForm.jsp 입니다.<br> -->
<%@ include file ="admin_top_4.jsp" %>
<%@ include file ="common.jsp" %>

<style type="text/css">

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

<% 
	String code[] ={"Outer","Top","Blouse","Bottom","Dress","Skirt","Shoes","Bag","Acc"};

%>
<div id="top_form">
	<font color="gray" size="5" ><b>카테고리 등록</b></font>  
</div>
<form action="input.cate" method="post" name="myform">
	<table  align="center" width="40%" class="table">
		<tr>
			<td align="center">	
				<b>카테고리 대분류</b>	
			</td>
			
			<td>
				<select name="code">
			<c:forEach items="<%=code%>" var="i" begin="0" end="8">   
					 <option value="${i }">${i } 
					
					<!-- <option value="Outer">Outer 
					<option value="Top">Top 
					<option value="Blouse">Blouse 
					<option value="Bottom">Bottom 
					<option value="Dress">Dress 
					<option value="Skirt">Skirt 
					<option value="Shoes">Shoes 
					<option value="Bag">Bag 
					<option value="Acc">Acc -->
			</c:forEach>		 
				</select>
			</td>
		</tr>
		
		<tr>
			<td align="center">	
				<b>카테고리 소분류</b>	
			</td>
			
			<td>	
				<input type="text" name="cname">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="등록" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;">
				<input type="reset" value="취소" class="btn btn-light" style="color:#f5f5f5; background:#373737; border:none; text-align: center;">
			</td>
		</tr>
		
	</table>
</form>	






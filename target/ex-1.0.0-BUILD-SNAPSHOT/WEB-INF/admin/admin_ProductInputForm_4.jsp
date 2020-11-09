<%@page import="admin.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file = "common.jsp" %>

	
<script type="text/javascript">
var f_selbox  = new Array('Outer','Top','Blouse','Bottom','Dress','Skirt','Shoes','Bag','Acc');
var s_selboxText = new Array();
s_selboxText[0] = new Array('JUMPER','MUSTANG','COAT','JACKET');
s_selboxText[1] = new Array("TEE","KNIT","SWEATSHIRT&HOODY","STRIPE");
s_selboxText[2] = new Array("BLOUSE","SHIRT");
s_selboxText[3] = new Array("DENIM","SHORTS","COTTON&SLACKS");
s_selboxText[4] = new Array("MINI","LONG");
s_selboxText[5] = new Array("MINI","LONG");
s_selboxText[6] = new Array("ALL");
s_selboxText[7] = new Array("BACK","SHOULDER","ETC");
s_selboxText[8] = new Array("JEWELRY","HAT","MUFFLER&GLOVES","ETC");

function init() {
	
	f_sel = document.myform.cate1;
	s_sel = document.myform.cate2;
	

	f_sel.options[0] = new Option("선택");
	s_sel.options[0] = new Option("선택");
	
	for(var i=0;i<f_selbox.length;i++) {
		f_sel.options[i+1] = new Option(f_selbox[i]);
	}
} //init
	

function firstChange() {
		
	//alert($("#cate1 option:selected").val());

		f_sel = document.myform.cate1;
		s_sel = document.myform.cate2;
		
		f_selIndex = f_sel.selectedIndex; // 선택:0  여성복:1	
	
	
		for(var i=s_sel.length-1;i>0;i--) {
			
			s_sel.options[i] = null;
			
			}
	
		
		for(var i=0;i<s_selboxText[f_selIndex-1].length;i++) {
			s_sel.options[i+1] = new Option(s_selboxText[f_selIndex-1][i]);
			
		}
		
	} //firstChange
	

	
	
</script>
WEB-INF\admin\product\ProductInputForm.jsp 입니다.<br>
<body onLoad="init()">
<form:form commandName="product" action="input.prd" method="post" enctype="multipart/form-data" name="myform">
<table border="1" >
	<tr>
		<td>카테고리</td>
		<td>
			<select name="pcode" id="cate1" onChange="firstChange()">

			</select>	
			<form:errors cssClass="err" path="code" />
			<select name="pcate" id="cate2">
				<option value="">	
			</select>
			<form:errors cssClass="err" path="pcate" />	 	
				
  		</td>
	</tr>
	
	<tr>
		<td>상품명</td>
		<td>
			<input type="text" name="pname" value="">
			<form:errors cssClass="err" path="pname" />
		</td>
	</tr>
	
	<tr>
		<td>상품이미지</td>
		<td> 
			<input type="file" name="upload">
			<form:errors cssClass="err" path="pimage" />
		</td>
	</tr>
	
	<tr>
		<td>상품가격</td>
		<td>
			<input type="text" name="price" value="">원
			<form:errors cssClass="err" path="price" />
		</td>		
	</tr>
	
	<tr>
		<td>적립포인트</td>
		<td>
			<input type="text" name="point" value="">point
			<form:errors cssClass="err" path="point" />
		</td>
	</tr>
	
	<tr>
		<td>상품스펙</td>
		<td>
			<input type="radio" name="pspec" value="new">new 	
			<input type="radio" name="pspec" value="normal">normal 	
			<input type="radio" name="pspec" value="sale">sale 
			<form:errors cssClass="err" path="pspec" />
		</td>
	</tr>
	
	<tr>
		<td>비고</td>
		<td>
			<textarea rows="10" cols="39" maxlength="50" name="pnote"> pnote</textarea>
			<form:errors cssClass="err" path="pnote" />
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="상품등록">
			<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form:form>
</body>




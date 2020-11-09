<%@page import="admin.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="admin_top_4.jsp" %>
<%@ include file = "common.jsp" %>

<script>
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

let a_choi;
function init() {
	a_choi = $(".pcode_class").val()
	let f_sel = document.myform.cate1;
	let s_sel = document.myform.cate2;	

	f_sel.options[0] = new Option("선택");
	s_sel.options[0] = new Option("선택");
	$("#cate1 option").eq(0).attr('value','선택')
	for(let i=0;i<f_selbox.length;i++) {
		f_sel.options[i+1] = new Option(f_selbox[i]);
        $("#cate1 option").eq(i+1).attr('value',f_selbox[i])
	//$("#cate1 option").eq(i).val($(".pcode_class").val())
        console.log($("#cate1 option").eq(i).val().includes(a_choi))
        if($("#cate1 option").eq(i).val().includes(a_choi) == true){
            $("#cate1 option").eq(i).attr("selected", "selected")
            //console.log($('#cate1 option:selected').val())
          }
	}
	
} //init
	
$(()=>{
	let b_choi = $(".pcode_class2").val();
	console.log(b_choi)
	if($('#cate1 option:selected').val()== a_choi) {
	    f_sel = document.myform.cate1;
		s_sel = document.myform.cate2;
		f_selIndex = f_sel.selectedIndex; // 선택:0  여성복:1	
		for(var i=s_sel.length-1;i>0;i--) {
			s_sel.options[i] = null;
			}
		for(var i=0;i<s_selboxText[f_selIndex-1].length;i++) {
			s_sel.options[i+1] = new Option(s_selboxText[f_selIndex-1][i]);
		}
		for(let i=0;i<s_selboxText.length;i++) {
		    $("#cate2 option").eq(i+1)
		    //console.log("cate2 : "+$('#cate2 option').eq(i).val())
		    //console.log("b_choi : "+b_choi)
		 	//console.log("비교 값 : "+$("#cate2 option").eq(i).val().includes(b_choi) == true)
		  if($("#cate2 option").eq(i).val().includes(b_choi) == true){
		    
		    $("#cate2 option").eq(i).attr("selected", "selected")
		    console.log($('#cate2 option:selected').val())
		  }
		}
	}
})

</script>

WEB-INF\admin\product\ProductUpdateForm.jsp 입니다.<br>

<body onLoad="init()">
<input type="hidden" class="pcode_class" value="${product.pcode }">
<input type="hidden" class="pcode_class2" value="${product.pcate }">
<form:form commandName="product" action="update.prd" method="post" enctype="multipart/form-data" name="myform">
<input type="hidden" name="pnum" value="${ product.pnum }">
<input type="hidden" name=pageNumber value="${pageNumber }">
<input type="hidden" name=pageSize value="${pageSize }">
<table border="1">
	<tr>
		<td>카테고리</td>
		<td>
			<select name="pcode" id="cate1">
				
			</select>	
			<form:errors cssClass="err" path="pcode" />
			
			
			<select name="pcate" id="cate2">
				
			</select>
			<form:errors cssClass="err" path="pcate" />
<%--
			<select name="code" class="cate1">
 			<c:forEach items="${lists }" var="lists" begin="0" end="${fn:length(lists) }">   
					 <option value="${lists.code }">${lists.code } 
			</c:forEach>
			</select>	
			
			 --%>		 	
				
  		</td>
	</tr>
	
	<tr>
		<td>상품명</td>
		<td>
			<input type="text" name="pname" value="${product.pname }">
			<form:errors cssClass="err" path="pname" />
		</td>
	</tr>
	
	<tr>
		<td>상품이미지</td>
		<td> 
			<img src="<%=request.getContextPath() %>/resources/${product.pimage}" width="100px" height="100px">
			<input type="file" name="upload" id="upload" value="" >
			<input type="hidden" name="uploadOld" value="${product.pimage }">
			<form:errors cssClass="err" path="pimage" />
		</td>
	</tr>
	
	<tr>
		<td>상품가격</td>
		<td>
			<input type="text" name="price" value="${product.price }">원
			<form:errors cssClass="err" path="price" />
		</td>		
	</tr>
	
	<tr>
		<td>적립포인트</td>
		<td>
			<input type="text" name="point" value="${product.point }">point
			<form:errors cssClass="err" path="point" />
		</td>
	</tr>
	
	<tr>
		<td>상품스펙</td>
		<td>
			<input type="radio" name="pspec" value="new" <c:if test="${product.pspec =='new' }">checked</c:if> >new 	
			<input type="radio" name="pspec" value="normal" <c:if test="${product.pspec =='normal' }">checked</c:if> >normal 	
			<input type="radio" name="pspec" value="sale" <c:if test="${product.pspec =='sale' }">checked</c:if> >sale 
			<form:errors cssClass="err" path="pspec" />
		</td>
	</tr>
	
	<tr>
		<td>비고</td>
		<td>
			<textarea rows="10" cols="39" maxlength="50" name="pnote"> ${product.pnote }</textarea>
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




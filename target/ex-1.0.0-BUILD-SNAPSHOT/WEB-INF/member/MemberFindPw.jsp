<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<%@ include file="../user/user_top_4.jsp" %>

<style type="text/css">
	.table{
		width: 25%;
		margin: 0 auto;
		margin-top: 20vh;
	}
</style>
	
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function abc(){
		
		var findpw = $('input[name="findpw"]:checked').val();
		/* alert(findid); */
		
		if(findpw==1){
			$('#email').show();
			$('#hp').hide();
		}
		if(findpw==2){
			$('#email').hide();	
			$('#hp').show();	
		}
	}//abc
	
</script>
    
WEB-INF\member\MemberFindPw.jsp<br>

<form action="findPw.me" method="post">
	<table align="center" width="40%" class="table">
		<tr>
			<td height="50" colspan="2" >   
				<font color="gray" size="5" ><b>Find PW</b><br></font>
				<font color="gray" size="1" >
				원하는 방법에 따라 비밀번호찾기가 가능합니다. 아래 유형을 선택하세요.
				</font>
				
			</td>		
		</tr>
		<tr>
			<td colspan="2">  
				<input type="radio" name="findpw" id="howtoFindPw" value="1" onclick="abc()" checked ><font color="gray" size="3"> 이메일로 찾기</font>  &emsp;
				<input type="radio"  name="findpw" id="howtoFindPw" value="2" onclick="abc()"><font color="gray" size="3"> 핸드폰번호로 찾기</font>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" value="">
			</td>
		</tr>
		<tr>
			<td width="35%" >이 &nbsp;&nbsp;름	 </td>  
			<td>
				<input type="text" name="name" value="">
			</td>
		<tr id="email" >	
			<td>이메일 </td>
			<td>
				<input type="text" name="email1" id="email1" value="" size="12">
				@
				<select id="email2" name="email2" >			  
						<option value="naver.com">naver.com</option>			
						<option value="daum.net">daum.net</option>			
						<option value="gmail.com">gmail.com</option>			
						<option value="nate.com">nate.com</option>			
				</select>
			</td>
		</tr>
		<tr id="hp" style="display:none;">
			<td>핸드폰번호</td>
			<td>
				<input type="text" name="hp1" value="" maxlength="3" size="3">-
				<input type="text" name="hp2" value="" maxlength="4" size="4">-
				<input type="text" name="hp3" value="" maxlength="4" size="4">
			</td>
		</tr>
		<tr>
			<td colspan="2">     
				<input type="submit" class="btn btn-secondary btn-lg btn-block" style="background:#373737; border:none; text-align: center;" value="확인" onclick="return check()">
			</td>
		</tr>
	</table>




</form>   
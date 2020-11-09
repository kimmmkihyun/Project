<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<%@ include file="../user/user_top_4.jsp"%>

MemberFindPwCompleted.jsp
<!-- 비밀번호찾기 -시간되면 '비밀번호 재설정하기'로 수정하기 -->

<style type="text/css">
.table {
	width: 25%;
	margin: 0 auto;
	margin-top: 4vh;
}

#d_top {
	width: 25%;
	margin: 0 auto;
	margin-top: 27vh;
}
</style>

<script type="text/javascript">
	function goLogin(id){
		location.href="loginForm1.me?mid="+id;
	}
</script>

<c:if test="${member.mid eq null }">

	<script type="text/javascript">
		alert("입력하신 정보로 가입된 회원은 존재하지 않습니다.");
		location.href="findPw.me";
	</script>

</c:if>
<c:if test="${not (member.mid eq null )}">


	<div id="d_top" align="center">
		<font size="5"> 고객님 비밀번호 찾기가 완료 되었습니다.<br>
		</font>
	</div>
	<table class="table">
		<tr>
			<td colspan="2" bgcolor="#f5f5f5"><font size="2"> 
					저희 쇼핑몰을 이용해주셔서 감사합니다.<br> 
					입력하신 정보로 검색된 비밀번호는 다음과 같습니다.
			</font></td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${member.mname}</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${member.mid}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${member.mpw}</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><font color="gray" size="1">
					고객님의 비밀번호 찾기가 성공적으로 이루어졌습니다.<br> 
					항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.
			</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button"
				class="btn btn-secondary" style="background: #373737; border: none;"
				value="로그인" onclick="goLogin('${member.mid}')"></td>
		</tr>


	</table>
</c:if>

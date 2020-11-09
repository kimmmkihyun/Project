<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<%@ include file="../user/user_top_4.jsp"%>

MemberFindIdCompleted.jsp
<br>

<style type="text/css">
.table {
	width: 25%;
	margin: 0 auto;
	margin-top: 4vh;
}
#d_top {
	width: 25%;
	margin: 0 auto;
	margin-top: 9vh;
}
</style>
<script type="text/javascript">
	function goLogin(id){
		location.href="loginForm1.me?mid="+id;
	}
	
	function poPassword() {
		location.href="findPw.me";
	}
</script>


<c:if test="${member.mid eq null }">

	<script type="text/javascript">
		alert("입력하신 정보로 가입된 회원 아이디는 존재하지 않습니다.");
		location.href="findId.me";
	</script>
	
</c:if>

<c:if test="${not (member.mid eq null )}">


	<div id="d_top" align="center">
		<font size="5"> 고객님 아이디 찾기가 완료 되었습니다.<br>
		</font>
	</div>
	<table class="table">
		<tr>
			<td colspan="2" bgcolor="#f5f5f5"><font size="2"> 저희 쇼핑몰을
					이용해주셔서 감사합니다.<br> 다음정보로 가입된 아이디가 총 1개 있습니다.
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
			<td>가입일자</td>
			<td>${member.regdate}가입</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><font color="gray" size="1">
					고객님의 아이디 찾기가 성공적으로 이루어졌습니다.<br> 항상 고객님의 즐겁고 편리한 쇼핑을 위해 최선의 노력을
					다하는 쇼핑몰이 되도록 하겠습니다.
			</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button"
				class="btn btn-secondary" style="background: #373737; border: none;"
				value="로그인" onclick="goLogin('${member.mid}')"> <input
				type="button" class="btn btn-dark"
				style="background:#373737; border: none;" value="비밀번호찾기"
				onClick="poPassword()">
			</td>
		</tr>


	</table>
</c:if>

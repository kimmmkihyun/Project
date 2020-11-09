<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_top.jsp</title>
	<!-- BootstrapCDN 부트스트랩 필요하면  아래 코드 복사해서 사용하기-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" ></script>
	<!-- 여기까지  -->
	<style type="text/css">
		.top{
		height:10vh;  
		text-align: center;
		padding-top: 1vh;
		font-weight: bold;
		font-size: 2em;
	/* 	background-color: #efe4d2; */
	} 
	
	.nav-link{
		margin-left: 40px;
		
	}
		
	</style>
</head>
<body> 
	<div class = "top">
			Sorority(admin) 
	</div> 
	<!-- admin_top nav bar -->
	<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
	  <a class="navbar-brand" href="admin.adpage">Admin</a><!-- 관리자 페이자 홈  -->
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
	    <div class="navbar-nav">
	      <a class="nav-link active" href="user.uspage">Sorority<span class="sr-only">(current)</span></a><!-- 사용자홈으로 보내주세요 -->
	      <a class="nav-link" href="input.cate">카테고리 등록</a>
	      <a class="nav-link" href="list.cate">카테고리 목록</a>
	      <a class="nav-link" href="input.prd">상품 등록</a>
	      <a class="nav-link" href="list.prd">상품 목록</a>
	      <a class="nav-link" href="detaillist.detail">재고 확인</a>
	      <a class="nav-link" href="list.me">회원 관리</a>
	    </div>
	  </div>
	</nav>
	<!-- admin_top nav bar -->

</body>
</html>
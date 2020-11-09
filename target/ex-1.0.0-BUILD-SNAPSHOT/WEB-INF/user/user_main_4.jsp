<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorority_main</title>
<style type="text/css">
	/* main 슬라이드 css */
	#carouselExampleFade{
		margin-top: 50px;
		padding-right: 10vw;
		padding-left: 10vw; 
		height: 60vh;
	}
	
	.carousel-item img{ 
		height: 60vh;
		width:100%;
		text-align: center;
		  
	} 
	
	.card-deck{
		margin-top: 50px;
		padding-right: 10vw;
		padding-left: 10vw;
 		  
 		  
	}
	
	.card img{ 
		height: 40vh;
		transform: scale(1);
		-webkit-transform: scale(1);
		-moz-transform: scale(1);
		-ms-transform: scale(1);
		-o-transform: scale(1);
		transition: all 0.3s ease-in-out; 
	}
	
	.card img:hover{
		transform: scale(1.075);
		-webkit-transform: scale(1.075);
		-moz-transform: scale(1.075);
		-ms-transform: scale(1.075);
		-o-transform: scale(1.075);
	}
</style>
</head>
<body>
	<%@include file="user_top_4.jsp" %>
	<!-- 메인 슬라이드 부분  -->
<div id="carouselExampleFade" class="c slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="http://app-storage-edge-005.cafe24.com/bannermanage2/sisshop/2020/10/07/d6c7f195631ae8da9bec439e29fc3a88.jpg" class="d-block w-12" alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://app-storage-edge-005.cafe24.com/bannermanage2/sisshop/2020/10/07/646fbcf015ae1f89422c4099733b790a.jpg" class="d-block w-12" alt="...">
    </div>
    <div class="carousel-item">
      <img src="http://app-storage-edge-005.cafe24.com/bannermanage2/sisshop/2020/10/07/02cc898af0b2d92c2ab61dc8d1369244.jpg" class="d-block w-12" alt="...">
    </div>
  </div>
</div>
  <!-- 메인 슬라이드 끝  --> 
  <!-- 상품이미지 정보    차후에 div class="card" 영역하나로 데이터 베이스 접근하여 반복문으로 출력해야함 -->
  <div class="card-deck">
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/2707c09502d1396bfef92aa74a55dd2c.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p>
    </div>
  </div>
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/2c6ab5e993e65291148703fb36443893.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p>
    </div>
  </div>
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/56c9cb1bbc66d1e89b8a12238d98f621.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p> 
    </div>
  </div>
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/eebed87d00dcc054070ce7d7319d9914.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p> 
    </div>
  </div>
</div>

 <div class="card-deck">
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/2707c09502d1396bfef92aa74a55dd2c.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p>
    </div>
  </div>
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/2c6ab5e993e65291148703fb36443893.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p>
    </div>
  </div>
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/56c9cb1bbc66d1e89b8a12238d98f621.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p> 
    </div>
  </div>
  <div class="card">
    <img src="http://merryaround.co.kr/web/product/medium/202010/eebed87d00dcc054070ce7d7319d9914.webp" class="card-img-top" alt="...">
    <div class="card-body">
      <h5 class="card-title">Card title</h5>
      <p class="card-text">sorority</p> 
    </div>
  </div>
</div>


</body> 
</html>
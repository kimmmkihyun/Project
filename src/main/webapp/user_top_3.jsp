<%@  page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!-- BootstrapCDN 부트스트랩 필요하면  아래 코드 복사해서 사용하기-->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>  
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 여기까지  -->
<style type="text/css">
.top {
   height: 18vh;
   text-align: center;
   padding-top: 4vh;
   font-weight: bold;
   
   width: 100%;
   margin: 0 auto;
   /* padding-right: 10vw; 
      padding-left: 10vw; */
   position: fixed;
   z-index: 98;
   /* overflow: hidden; */
   background-color: white; 
   
}
.top p{
   font-size: 2em;
}
.nav-color {
   /* background: #fff3e0; */
   
}
.nav-item {
   font-weight: bold;
   margin-left: 40px;
}
.icon {
   position: absolute;
   bottom: 40%;
    right: 10%;
    z-index: 9;
}
.icon img {
   width: 30px;
   height: 30px;
   float: right;
}
.fix{
   position: relative;
   overflow: hidden;
}
.navposition{
   margin-top: 163px;
   position: absolute;
   bottom: 0;
   background-color: white;
   width: 100%;
}
.arrow img{
   height: 60px;
   width: 70px;
   right: 20px;
    position: fixed;
    bottom: 20px;
    opacity: 0.4;
   
}
/* drop down css설정 */
.dropbtn {
  background-color: #fff;
  color: white;
  padding: 16px;
  font-size: 16px;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #fff; 
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #fff;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #fff;}
</style>

</head>
<body>
   <!-- 사용자페이지 top부분 임포트 해서 사용  -->

   <%
   		String viewLogin = request.getContextPath() + "/loginForm.me";
   		String viewLogout = request.getContextPath() + "/logout_3.jsp";
   %>
   <div class="fix">
      <div class="top">
         <p>Sorority</p>
         <div class="icon">
            
            <a href="<%=viewLogout%>"><img src="<c:url value="/resources/images/로그아웃수정후.png"/>" /></a> 
            <a href="#"><img src="<c:url value="/resources/images/주문내역.png"/>" /></a> 
            <a href="#"><img src="<c:url value="/resources/images/장바구니.png"/>" /></a> 
            
         </div>
         <div class="navposition">
         <nav class="navbar navbar-expand navbar-light nav-color"
            style="padding-right: 10vw; padding-left: 10vw;">
	    	
            <a class="navbar-brand" href="user.uspage">Sorority</a>
           
   
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Best</a>
                     </div>
                  </li>
                  
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Outer</a>
                         <div class="dropdown-content">
                            <!-- 반복문으로 2차 카테고리 출력하세요 -->
                            <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                     </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Top</a>
                        <div class="dropdown-content">
                           <!-- 반복문으로 2차 카테고리 출력하세요 -->
                            <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                     </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Blouse</a>
                        <div class="dropdown-content">
                           <!-- 반복문으로 2차 카테고리 출력하세요 -->
                            <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                     </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Bottom</a>
                     <div class="dropdown-content">
                        <a href="#">홈</a>
                           <!-- 반복문으로 2차 카테고리 출력하세요 -->
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                      </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Dress</a>
                     <div class="dropdown-content">
                           <!-- 반복문으로 2차 카테고리 출력하세요 -->
                           <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                      </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Skirt</a>
                     <div class="dropdown-content">
                           <!-- 반복문으로 2차 카테고리 출력하세요 -->
                           <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                      </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Shoes</a>
                     <div class="dropdown-content">
                           <!-- 반복문으로 2차 카테고리 출력하세요 -->
                           <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                      </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Bag</a>
                     <div class="dropdown-content">
                           <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                      </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">Acc</a>
                     <div class="dropdown-content">
                           <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">제품소개</a>
                            <a href="#">오시는길</a>
                          </div>
                      </div>
                  </li>
                  <li class="nav-item">
                     <div class="dropdown">
                        <a class="nav-link dropbtn" href="#">contact us</a>
                     	<div class="dropdown-content">
                            <a href="#">홈</a>
                            <a href="#">회사소개</a>
                            <a href="#">공지사항</a>
                            <a href="#">오시는길 </a>
                          	
                   	  </div>
                     </div>
                  </li>
               
               </ul>
               <form class="form-inline my-2 my-lg-0" action="search.uspage" method="get">
                  <input class="form-control mr-sm-2" type="search" name="keyword"
                     placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
               </form>
            </div>
         </nav>
      </div>
      </div>
   </div>
   <div class="arrow">
      <a href="#">
         <img src="<c:url value="/resources/images/화살표.png"/>"/>
      </a>
   </div>



</body>
</html>
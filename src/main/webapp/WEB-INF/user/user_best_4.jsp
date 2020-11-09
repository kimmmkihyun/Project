<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorority_Best</title>
<style type="text/css">
 
   
   .card_container{
      padding-right: 10vw;
      padding-left: 10vw;
   } 
   
   .card{
      margin-top: 50px;
      border: none;
   }
   
   #card_border{
         border: none;
         width: 90%;
   }
   
   .card img{
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
      z-index: 99;
   }
   
   
   .main_img{
      text-align: center;
   }
   
   
   .main_img img{
         width: 100%;  
         height: 480px;
   }
   .chips{
          content: "";
       position: absolute;
       margin-top : 40px;
       left: 50%;
       margin-left: -15px;
       display: inline-block;
       width: 30px;
       height: 2px;
       background: #ccc;    
   }
   h4{
      position: relative;
    display: inline-block;
    font-size: 14px;
    font-weight: 700;
    text-align: center;
    letter-spacing: 1px;
      
   }
   
   .main_top{
      margin-top: 25vh;
   }
</style>
</head>
<body>
   <%@include file="user_top_4.jsp" %>

  
  <div class="main_top">
  <div align="center" style="margin-top: 50px;">
     <h4>Best</h4>
     <span class="chips"></span>    
  </div>
  
  <section style="width: 100%; display: flex; flex-direction: column;">
  <section class="card_container" style="display: flex; flex-wrap: wrap; justify-content: center; width: 100%;">
  <c:forEach var="bean" items="${lists }" >
  <div class="card col-md-3 m3" id="card_border">
     <a class="main_img" href="detail.userdetail?pnum=${bean.pnum }">
        <img src="<%=request.getContextPath() %>/resources/${bean.pimage }" alt="..." >
     </a>
     <div class="card-body" align="left">
        <p>
           <b>item : ${bean.pname }</b><br>
           <b>price : ${bean.price }</b><br>
        </p>
     </div>
  </div>
  </c:forEach>

  </section>
  </section>
  
   
   <%@include file="user_bot.jsp" %>


</div>
</body> 
</html>
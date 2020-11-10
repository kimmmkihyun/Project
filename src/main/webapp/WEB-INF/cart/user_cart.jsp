<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_cart.jsp</title>
<style type="text/css">
.user_cart_main {
   margin-top: 23vh;
   padding-right: 10vw;
   padding-left: 10vw;
}

h3 {
   text-align: center;
}

.cartlist {
   margin-top: 5vh;
}

.table img {
   width: 100px;
   height: 130px;
}

thead {
   text-align: center;
   background-color: #f8f8f8;
}

tbody {
   text-align: center;
}

.check_out {
   margin-top: 15vh;
}

.cbtn {
   width: 150px;
}
</style>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
   function deleteCart(cartnum){
      //alert(cartnum);
      var retry = confirm("해당상품을 장바구니에서 삭제하시겠습니까?");
      if(retry){
         location.href="cartDel.cart?cartnum="+cartnum;
      }
      else{
         return;
      }
      
   }
   
   function updateCartQty(cartnum,cqty) {
         var bb = document.getElementById(cqty).value; 
         location.href ="cartUpdate.cart?pqty="+bb+"&cartnum="+cartnum;
   } 
   
   
   
   $(document).ready(function() {
      function abc(){
         var i = $("input[name=totalprice]").val();
         alert(i);
      }
   });

   function orderOneCart(cartnum,pimage,pname,pset,price,pqty,id){
      alert("주문하기 완료");
      location.href="orderone.od?cartnum="+cartnum+"&pimage="+pimage+"&pname="+pname+
            "&pset="+pset+"&price="+price+"&pqty="+pqty+"&id="+id;
   }
   
   function orderAll(){
      alert("전체상품 주문하기 완료");
         location.href="orderAll.od?";      
      
   }
   
   function goStartPage(){
      alert("시작 페이지로 돌아갑니다.");
      location.href="user.uspage";
   }

</script>

<%
/*    String pset = request.getParameter("pset");
   System.out.println("넘어온 pset:"+pset);
   
   String[] psetSlice = pset.split(" ");
   for(int i=0; i<psetSlice.length; i++) {
      System.out.println("userCart_psetSlice["+i+"]:"+psetSlice[i]);
    }*/
   
   /*
   int pnum = Integer.parseInt(request.getParameter("pnum"));
   System.out.println("넘어온 pnum:"+pnum);
   
   String qty = request.getParameter("qty");
   System.out.println("넘어온 qty:"+qty);
   */
   
%>

</head>
<body>
   <%@include file="../user/user_top_4.jsp"%>
   <div class="user_cart_main">

      <h3>SHOPPING CART</h3>
      <!-- 카트리스트 목록 -->
      <div class="cartlist">
         <table class="table">
            <thead>
               <tr>
                  <th scope="col">#</th>
                  <th scope="col">이미지</th>
                  <th scope="col">상품정보</th>
                  <th scope="col">판매가</th>
                  <th scope="col">수량</th>
                  <th scope="col">배송구분</th>
                  <th scope="col">합계</th>
                  <th scope="col">선택</th>
               </tr>
            </thead>

         <c:set var="TheTotal" value="0"/>
            <c:forEach items="${carts }" var="carts" varStatus="status">
               <tbody>
                  <tr>
                     <th scope="row" style="vertical-align: middle;">${carts.cartnum }</th>
                     <td>
                        <%-- <img src="<c:url value="/resources/images/test2.jpg"/>" /> --%>
                        <img
                        src="<%=request.getContextPath() %>/resources/${carts.pimage }"
                        width="100px" height="100px" />
                     </td>
                     <td style="vertical-align: middle;">${carts.pname}<br>
                        [ 옵션:${carts.pset} ]

                     </td>
                     <td style="vertical-align: middle;">${carts.price}won<br>(${carts.point}
                        point)
                     </td>
                     <td style="vertical-align: middle;"><input type="text"
                        id="cqty${status.count }" max="3" value="${carts.pqty }">
                        <input type="button" value="변경"
                        onclick="updateCartQty('${carts.cartnum }','cqty${status.count }')">
                     </td>
                     <td style="vertical-align: middle;">기본배송</td>
                     <td style="vertical-align: middle;">
                        ${carts.price * carts.pqty}
                        <input type="hidden" name ="totalprice" value="${carts.price * carts.pqty}">
                        <c:set var="TheTotal" value="${ TheTotal+(carts.price * carts.pqty)}"/>
                     </td>
                     
                     
                     
                     <td style="vertical-align: middle;">
                        <button type="button" class="btn btn-light" 
                        onclick="orderOneCart('${carts.cartnum}','${carts.pimage}','${carts.pname}','${carts.pset}',
                                          '${carts.price}','${carts.pqty}','${carts.id}')">주문하기</button>
                        <button type="button" class="btn btn-light"
                           onclick="deleteCart(${carts.cartnum })">삭제</button>
                     </td>
                  </tr>  
               </tbody>
            </c:forEach>
         </table>
      </div>


      <div class="check_out">
         <table class="table">
            <thead>
               <tr>  
                  <th scope="col">총 상품금액</th>
                  <th scope="col">총 배송비</th>
                  <th scope="col">결제 예정 금액</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <th scope="row" style="vertical-align: middle;">￦<c:out value="${TheTotal }"/></th>
                  <c:if test="${TheTotal < 50000 }">
               <c:set var="deliveryFee" value="2500"/>                  
                  </c:if>
                  <c:if test="${TheTotal >= 50000 }">
               <c:set var="deliveryFee" value="0"/>                  
                  </c:if>
                  <td style="vertical-align: middle;">￦<c:out value="${deliveryFee }"/></td>
                  
                  <td style="vertical-align: middle;">￦${TheTotal + deliveryFee}</td>
               </tr>  
               <tr>
                  <td colspan="3">
                     <button type="button" class="btn btn-primary cbtn" onclick="orderAll()">전체상품주문</button>
                     &nbsp;
                     <button type="button" class="btn btn-secondary cbtn" onclick="goStartPage()">쇼핑계속하기</button>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
<%@include file="../user/user_bot.jsp"%>
</body>
</html>
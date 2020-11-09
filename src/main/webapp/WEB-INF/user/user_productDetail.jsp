<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> /WEB-INF/user/user_productDetail.jsp</title>
<style type="text/css">
   .user_content {
      margin-top: 200px;
      padding-left: 15vw;
      padding-right: 15vw;
      padding-top: 5vh;
   }
   
   #btn{
      border: 1px solid #000;
      width: 16vw;
   }
   
   #card-body{
      padding-left: 100px;
      padding-right: 100px;
   
   }
   .span_area {float:left; width:30%}
   .select_area{float:left; width:70%}
   .select_area select{height:39px; width:70%}
   .span_area p{
      font-size: 20px;
   }
   .product_result, .buy_btn{float:left; width:100%}
   .card-title{text-align:left;}
   
   .price-text{
      padding-top: 8px;
   }
   .price-text span{
      font-size: 15px;
   }
   #selectSize{
         
   }
   .pnote-text{
   		font: 15px;
   		color: gray;
   }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

   $(document).ready(function(){
      <%-- location.href="detailsize.userdetail?pnum="+ <%= request.getParameter("pnum") %> +"&pcolor=" + pcolor;  --%>
      /* let pcolor = $("#selectColor option:selected").val();
      let optionlen = $("#selectColor option").length;
      
      for(let i=0; i<optionlen; i++){
            if($("#selectColor option").eq(i).val().includes(pcolor)){
                 $('#selectColor option').eq(i).attr("selected","selected")
              }
        } */
        
      $("#selectColor").change(function(){
         let index = $("#selectColor option:selected").text();
         let pnums = $('input[name="pnum"]').val()
         let list_size = $('input[name="lists_size"]').val()

         console.log(index);
         console.log(pnums);
         console.log(list_size);
         $.ajax({
               type : "get",
               url : "detailsize.userdetail",

               data : ({
                  pcolor : index,
                  pnum : pnums
               }),
               dataType: 'text',              
               success : function(data) {
                   showempinfo(data);
                   console.log("통신성공");
               },
               error : function(){
               console.log("통신실패");
            }
           });
         function showempinfo(data){
            console.log("data:"+data)
            var slice = data.split(",");
            console.log(slice)
               $('#selectColor option').eq(index).attr("selected","selected")
               $('#selectSize').empty();
               $('#selectSize').append("<option>선택")
               for(let i=0; i<slice.length-1;i++){
                  $('#selectSize').append("<option>"+slice[i])
               }

         }//showempinfo
            
       })  
       
      
      
   })
   
   
          
       function popupStock(pnum){
         //alert(pnum);
         
         //location.href="detaillist2.detail";  
         
         var url = "popupStock.jsp?pnum="+pnum;         
         //console.log(url);
         var name = "popupStock";
         var options = 'width=500, height=600, top=250, left=700, resizable=no, scrollbars=no, location=no';
         window.open(url,name, options); 
         
      }//popupStock
      
      let total = 0;
      let sum = 0;
   function showResult(){
      let pcolor = $("#selectColor option:selected").val(); 
      let psize = $("#selectSize option:selected").val();
      
     
      let price = ${product.price } ;
      let aa = $('.aa').text(); 
      
      //console.log(pcolor+","+psize); 
      //console.log(result); 
      let item_price = $('#price').val();
      if( aa.includes(pcolor+"/"+psize) ){
         alert('이미 선택되어 있는 옵션입니다');
         //console.log("상품선택 후 result:"+result);
      }
      else{
          
       
         
           $('#resultTable').append("<tr class='bb'><td class='aa'>"+pcolor+"/"+psize+" "+"</td><td>"+
                 "<input type='text' name='num' id='num' value='1' class='num' />"+
                 "<input type=button value='△' class='bt_up' onClick='CountUp(this)'>"+
                 "<input type=button value='▽' class='bt_down' onClick='CountDown(this)'>"+
                 "</td><td><input type='text' readonly id='price' name='price' value='"+price+"'/></td>"+
                 
                 "<td><input type=button value='X' onClick='deleteList(this)'></td></tr>"
           )  
           //total += parseInt(price);
           //console.log("total__: "+total);  
           
           if($('.totalCount').text() == ""){      // 
             console.log("item_price:"+item_price)
                $('.totalCount').append(price) 
             }else{
                CalSum();  
             }
                 
          console.log('aa:'+aa); 
           
      }     
   }  
   
   function deleteList(ths){  
      
      $(ths).parents("tr").remove();
      CalSum();
      
   }
   
   function CountUp(ths){
      //console.log("ths:"+ths);
      var $input = $(ths).parents("td").find("input[name='num']");
      //console.log("$input:"+$input);
      var tCount = Number($input.val());
      //console.log("변경전 구매수량:"+tCount);    
      $input.val(Number(tCount)+1);
      
      var bb = $('.bt_up').index(ths);  
      
      console.log("bb:"+bb);
      let count = $(".num").eq(bb).val();
      let price2 = $(".price-text span").text();   //하나당 가격
      let sum = count * price2;
      console.log("sum:"+sum); 
      $("input[name='price']").eq(bb).val(sum);   
      
   
      
      total =  parseInt(sum);  
      console.log("수량증가 후 total:"+total);  
      let ord_total = $(".totalCount").text();
      console.log("기존 total:"+ord_total);    
      let sum_total = parseInt(ord_total) + parseInt(sum);    
      console.log("기존+수량증가 total:"+sum_total);  
      
      CalSum();
      
   }
   

   function CountDown(ths){
      var $input = $(ths).parents("td").find("input[name='num']");
      var tCount = Number($input.val());
      if(tCount>1){
         $input.val(Number(tCount)-1);
         
         var bb2 = $('.bt_down').index(ths);  
         
         console.log("bb_2:"+bb2);
         let count2 = $(".num").eq(bb2).val();
         let price3 = $(".price-text span").text();   //하나당 가격
         let sum2 = count2 * price3;
         console.log("sum_2:"+sum2); 
         $("input[name='price']").eq(bb2).val(sum2);  
         
         
         CalSum();
         
         
      }
      else{
         alert('최소 주문수량은 1개입니다.');
      }
      
   }

   function CalSum(){
      
      let totalSum = 0;
      let price5 = $(".price-text span").text();
      //console.log("tr길이 : "+ $("tr[class='bb']").length );
      
     for(let i=0; i< $("tr[class='bb']").length ; ++i){
        totalSum += parseInt( $(".num").eq(i).val() )    
      }    
     
     let totalPrice = totalSum * parseInt(price5);
     console.log("totalPrice:"+totalPrice);  
     $(".totalCount").html(totalPrice);     
     
      //console.log("totalSum:"+totalSum);  
      
      
   }

   function goCart(pnum){
      //alert(1);
      console.log("goCart_pset:"+$('.aa').text());
      let pset = $('.aa').text();
      var login = $(".loginInfo22").val();
      let qty = "";
      for(let i=0; i< $("tr[class='bb']").length ; ++i){
         qty += parseInt( $(".num").eq(i).val() ) + ","    
         } 
      console.log("qty:"+qty);
      
      if($("#selectColor option:selected").val().includes("선택") || $("#selectSize option:selected").val().includes("선택")){
         alert("필수 옵션을 선택해 주세요");  
      }else{
         if(login == "" || login == null || login == "null"){
               location.href="loginForm.me?pnum="+pnum; 
            }else{
               location.href="cartlist.cart?pset="+pset+"&pnum="+pnum+"&qty="+qty;
            }
        
      }
   }


</script>
</head>
<body>
  <%@include file="user_top_4.jsp"%>
   
   <div class="user_content">
      <!-- 유저 컨텐트 내용 -->
       <input type="hidden" class="loginInfo22" value=<%=session.getAttribute("loginInfo2") %>>
      <div class="card mb-3" style="max-width: 85vw;"> 
            <input type="hidden" name="pnum" value="${product.pnum }">
            <input type="hidden" name="lists_size" value="${sizeLists.get(0).psize }">
         <div class="row no-gutters">
            <div class="col-md-4"> 
                <img src="<%=request.getContextPath() %>/resources/${product.pimage }" class="card-img" alt="..." >
            </div>
            <div class="col-md-8">
               <div class="card-body" id="card-body">
                  <h4 class="card-title">
                     <B>${product.pname }</B>
                  </h4>
               <div class="pnote-text">
                     <span>
                           ${product.pnote }  
                     </span>
                    <hr>
                     </div>
                     
                  
                  <div class="price-text">
						<p>판매가                 
                 
                        ￦<span >
                             ${product.price }  
                     </span>
                  </div>
                  <hr>  
                  <div class="card-text">
                     
                     <div class="span_area">
                        <p>재고수량 </p> 
                        <p>색상 </p> 
                        <p>사이즈 </p>
                     </div>
                     <form>
                        <%-- <input type="hidden" name="pcolor" value="${colorLists.color }"> --%>
                     </form>

                     <div class="select_area">
                        <p>  
                           <input type="button" value="실시간재고 확인하기" onclick="popupStock(${product.pnum })"/>
                        </p>
                        <p>
                        <select name="selectColor" id="selectColor">
                        <option>선택</option>
                           <c:forEach var="bean" items="${ colorLists }"> 
                              <option><c:out value="${bean.pcolor }" /></option>                              
                           </c:forEach>                           
                        </select>
                        </p>
                        <p>
                        <select id="selectSize" onChange="showResult()">
                           <option class="choi" >선택</option>                                                      
                        </select>
                        </p>
                     </div>
                     
                  </div>   
                  <div class="product_result">
                    <table class="table" id="resultTable">
                       <tr>
                          <td>상세</td>
                          <td>수량</td>
                          <td>금액</td>
                          <td>삭제</td>
                       </tr>
                    </table>
                  </div>
                 <span>총 : </span> 
                  <div class="totalCount"></div>
                  
               <div class="buy_btn">  
                  <button type="button" class="btn btn-light" id="btn">BUY IT NOW</button>
                  <button type="button" class="btn btn-light" id="btn" style="margin-left: 20px;" onclick="goCart(${product.pnum })">ADD TO CART</button>
               </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>
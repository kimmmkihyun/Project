<%@page import="order.model.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user/user_showList_4.jsp(구매내역 페이지)</title>
<style type="text/css">
   .checkout_main{
      margin-top: 25vh;
      padding-left: 10vw;
      padding-right: 10vw;
   }
   
   h3 {
      text-align: center;
   }
   
   thead{
      text-align: center;
      background-color: #f8f8f8;
   }
   
   tbody {
      text-align: center;
   }
   
   .table img{
      width: 100px;
      height: 130px;
   }
</style>

</head>
<body>
  <%@include file="../user/user_top_4.jsp"%>

   <div class="checkout_main">
      <div class="checkout_list">
         <h3>Order List</h3>
         <table class="table">
            <thead>
               <tr>
                  <th scope="col">주 문내역 번호</th>
                  <th scope="col">상품이미지</th>
                  <th scope="col">상품이름</th>
                  <th scope="col">판매가</th>
                  <th scope="col">주문수량</th>
                </tr>
            </thead>
            <tbody>
            
            <c:if test="${ fn:length(lists) == 0}">
               <td colspan="5" style="vertical-align: middle;">주문한 내역이 없습니다.</td>
               
               </tbody>
         </table>
      </div>
      <div class="check_out">
         <table class="table">
              <thead>
                <tr>
                  <th scope="col">총 구매금액  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row" style="vertical-align: middle;"> 0 원</th> 
                </tr>
                <tr>
                   <td colspan="3">
                      <button type="button" class="btn btn-secondary cbtn">쇼핑계속하기</button>
                   </td>
                </tr>
              </tbody>
         </table>
      </div>
   </div>
</c:if>
            <!--    
            	색상 사이즈 넘겨 받아서 해당되는 dnum에 맞게 되야 한다 !!!!
            	어떻게 받아야 할지 생각해보자!!
              -->
            <c:if test="${ fn:length(lists) != 0}">
               <c:forEach var="show" items="${ lists }">
                   
               <tr>
                  <td style="vertical-align: middle;">${show.olnum }</td>
                     <td style="vertical-align: middle;">
                        <img src="<%=request.getContextPath() %>/resources/${show.pimage }"
                        width="100px" height="100px" />
                     </td>
                     <td style="vertical-align: middle;">${show.pname }</td>
                     <td style="vertical-align: middle;">&#8361;${show.price }</td>
                     <td style="vertical-align: middle;">${show.oqty }</td>
                </tr>
               
               </c:forEach>
      
            </tbody>
         </table>
      </div>
      <div class="check_out">
         <table class="table">
              <thead>
                <tr>
                  <th scope="col">총 구매금액  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                
         
                  <%
               /*    DecimalFormat df = new DecimalFormat("###,###");
                  
                     List<Order> lists = (List<Order>)session.getAttribute("lists");
                     int total = 0;
                     for(int i=0;i<lists.size();i++) {
                        df.format(lists.get(i).getPrice());
                        
                         total += Integer.parseInt(df.format(lists.get(i).getPrice()))*lists.get(i).getOqty();
                     } */
                     %>
                     
                  <th scope="row" style="vertical-align: middle;">
                  <c:set var="total" value="0"/> 
               
                  <c:forEach var="i" items="${lists }" >
                  
                    <c:set var="total" value="${total + (i.price * i.oqty) }"/>
                      
                  </c:forEach>
                       &#8361;<c:out value="${total }"/>
                  </th>
                </tr>
                <tr>
                   <td colspan="3">
                      <a href="user.uspage"><button type="button" class="btn btn-secondary cbtn">쇼핑계속하기</button></a>
                   </td>
                </tr>
              </tbody>
         </table>
      </div>
   </div>
</c:if>
   <%@include file="../user/user_bot.jsp"%>
</body>
</html>
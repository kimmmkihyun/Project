<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>

<style type="text/css">
body {
   width: 100%;
   text-align: center;
   align: center;
}

table {
       
   margin : 0 auto;
}

.list_main{
   margin-top: 2vh;
}
.list_main2{
   margin-top: 22vh;
}
p{
   margin-left : 550px; 
}
.page_num{
   margin-left : 1150px; 
}
</style>
   <%
   if(session.getAttribute("loginInfo2").equals("admin")){
%>
<body>
   <%@ include file="../admin/admin_top_4.jsp"%>
   <div class="list_main"> 
   <h1><p>문의사항</p></h1> 
   <form action="list.bd" method="get" align="center">
      <select name="whatColumn">
         <option value="all">전체
         <option value="subject">제목
         <option value="writer">작성자
      </select> <input type="text" name="keyword" value="홍길동"> <input
         type="submit" value="검색">
   </form>
   </div>
   <table class="table">
      <tr>
         <td align="right"><a href="write.bd">글쓰기</a></td>
      </tr>
   </table>
   <c:if test="${totalCount == 0}">
      <table class="table">
         <thead>
            <tr>
               <td>게시판에 저장된 글이 없습니다.</td>
            </tr>
         </thead>
      </table>
   </c:if>

   <c:if test="${ not (totalCount == 0) }">
      <table class="table" style="width:0; text-align:center;">
         <tbody>
            <tr>
               <th align="center" width="50" style="padding: 2rem 0;">번호</th>
               <th align="center" width="250" style="padding: 2rem 0;">제 목</th>
               <th align="center" width="100" style="padding: 2rem 0;">작성자</th>
               <th align="center" width="150" style="padding: 2rem 0;">작성일</th>
               <th align="center" width="50" style="padding: 2rem 0;">조회</th>
               <th align="center" width="10" style="padding: 2rem 0;">IP</th>   
 
            </tr>
            <c:forEach items="${lists }" var="bd" varStatus="status">
               <tr>
                  <td>${bd.num }</td>
                  <td><a href="content.bd?num=${bd.num}&cnum=${bd.num}">${bd.subject }</a></td>
                  <!-- content.bd?num=${bd.num} -->
                  <td>${bd.writer }</td>
                  <td>${bd.regdate }</td>
                  <td>${bd.readcount }</td>
                  <td>${bd.ip }</td>
               </tr>

            </c:forEach>

         </tbody>
      </table>
   </c:if>
</body>
<div class="page_num">${pageInfo.pagingHtml} </div>
<%
   } else {
%>
<body>
<%@ include file="../user/user_top_4.jsp"%>
<div class="list_main2"> 
<h1><p>문의사항</p></h1>
<form action="list.bd" method="get" align="center">
   <select name="whatColumn">
      <option value="all">전체
      <option value="subject">제목
      <option value="writer">작성자
   </select>
   <input type="text" name="keyword" value="홍길동">
   <input type="submit" value="검색">
</form>
<table class="table">
   <tr>
      <td align="right">
         <a href="write.bd">글쓰기</a>
      </td>
   </tr>
</table>
<c:if test="${totalCount == 0}">
<table class="table" >
   <thead>
      <tr>
         <td>게시판에 저장된 글이 없습니다.</td>      
      </tr>
   </thead>   
</table>
</c:if>
      
<c:if test="${ not (totalCount == 0) }">
   <table class="table" style="width:0; text-align:center;">
   <tbody>
      <tr>
         <th align="center" width="50" style="padding: 2rem 0;">번호</th>
         <th align="center" width="250" style="padding: 2rem 0;">제 목</th>
         <th align="center" width="100" style="padding: 2rem 0;">작성자</th>
         <th align="center" width="150" style="padding: 2rem 0;">작성일</th>
         <th align="center" width="50" style="padding: 2rem 0;">조회</th>
         <th align="center" width="10" style="padding: 2rem 0;">IP</th>     
         
      </tr>      
      <c:forEach items ="${lists }" var ="bd" varStatus="status">
       <tr>
          <td>${bd.num }</td>
          <td><a href="content.bd?num=${bd.num}">${bd.subject }</a></td><!-- content.bd?num=${bd.num} -->
          <td>${bd.writer }</td>
          <td>${bd.regdate }</td>
          <td>${bd.readcount }</td>
          <td>${bd.ip }</td>
       </tr>
       
    </c:forEach>
         
    </tbody>      
   </table>
</c:if>
</div>
</body>
<div class="page_num">${pageInfo.pagingHtml} </div>
<% 
   }
%>
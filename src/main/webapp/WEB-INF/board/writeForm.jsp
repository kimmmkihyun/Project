<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common.jsp" %>
    <style type="text/css">

.table {
	    
	margin : 0 auto;
}

.list_main{
	margin-top: 20vh;
}

</style>
	     

<%
	if(session.getAttribute("loginInfo2").equals("admin")){
%>
	<%@ include file="../admin/admin_top_4.jsp"%>
	<h1><p align="center">글 쓰기</p></h1>
    <form:form commandName="board" method="post" action="write.bd" >   <!--  form에쓸때는 onSubmit, submit에 쓸때는 onClick -->
    <table class="table" align="center">
    <tbody>
    <tr>
    <td colspan="2" align="right" ><a href="list.bd">글목록</a></td>
    </tr>
      
    <tr>
    <td width="100" align="center" >이름</td>
    <td><input type="text" size="30" maxlength="10" name="writer" value="홍길동"></td>
	</tr>
    
    <tr>
    <td width="300" align="center" >제목</td>
    <td><input type="text" name="subject" size="50" value="aaa2"></td>
	</tr>
	
    <tr>
    <td width="100" align="center" >Email</td>
    <td><input type="text" size="50" name="email" value="abc@aa.com"></td>
	</tr>
	
    <tr>
    <td width="100" align="center" >내용</td>
    <td><textarea name="content" id="abc" rows="13" cols="50"></textarea> </td>
	</tr>
	
    <tr>
    <td width="100" align="center" >비밀번호</td>
    <td width="350"><input type="password" size="10" maxlength="12" name="passwd" value="1234"></td>
	</tr>
    <tr>
    <td colspan="2" align="center">
    <input type="submit" value="글쓰기" >
    <input type="reset" value="다시작성">
    <input type="button" value="목록보기" onClick="location.href='list.bd'">
    
    </td>
</tr>
    
    
    </tbody>
    </table>  
   </form:form>
    <%
	} else{
    %>
	 <%@ include file="../user/user_top_4.jsp"%>
	 <div class="list_main" align="center"> 
	 <h1><p align="center">글 쓰기</p></h1>
   <form:form commandName="board" method="post" action="write.bd" >   <!--  form에쓸때는 onSubmit, submit에 쓸때는 onClick -->
    <table class="table" align="center">
    <tbody>
    <tr>
    <td colspan="2" align="right" ><a href="list.bd">글목록</a></td>
    </tr>
      
    <tr>
    <td width="100" align="center" >이름</td>
    <td><input type="text" size="30" maxlength="10" name="writer" value="홍길동"></td>
	</tr>
    
    <tr>
    <td width="300" align="center" >제목</td>
    <td><input type="text" name="subject" size="50" value="aaa2"></td>
	</tr>
	
    <tr>
    <td width="100" align="center" >Email</td>
    <td><input type="text" size="50" name="email" value="abc@aa.com"></td>
	</tr>
	
    <tr>
    <td width="100" align="center" >내용</td>
    <td><textarea name="content" id="abc" rows="13" cols="50"></textarea> </td>
	</tr>
	
    <tr>
    <td width="100" align="center" >비밀번호</td>
    <td width="350"><input type="password" size="10" maxlength="12" name="passwd" value="1234"></td>
	</tr>
    <tr>
    <td colspan="2" align="center">
    <input type="submit" value="글쓰기" >
    <input type="reset" value="다시작성">
    <input type="button" value="목록보기" onClick="location.href='list.bd'">
    
    </td>
</tr>
    
    
    </tbody>
    </table>  
   </form:form>
   </div>
   <% 	    
	}
%>  
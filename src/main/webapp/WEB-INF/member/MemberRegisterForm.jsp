<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common.jsp" %>
<%@ include file="../user/user_top_4.jsp" %>    
<style type="text/css">
   .err{
   font-size: 9pt;
   color: red;
   font-weight: bold;
   }
   
   .table{
      
      width: 75%;
      margin: 0 auto;
      margin-top: 10vh;
   }
   #title{
      font-weight: bold;
      font-size: 20px;
      color: gray; 
   }
   .top_margin{
      margin-top: 25vh;  
   }
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
   
   var dupcheck = false;
   var change = false;
   var use = "";
   
   $(function(){
      $('input[name="mid"]').keydown(function(){
         $('#idmessage').css('display','none');
         change=true;
         use="";
      });
      
      $('input[name="rempw"]').keydown(function(){
         $('#pwmessage').css('display','none');
         change=true;
         use="";
      });
   });
   
   function checkDuplication(){
      
      if($('#mid').val()==""){
         alert("아이디를 입력해주세요.");
         $('#mid').focus();
         return false;
      }
      
      if($('#mpw').val()==""){
         alert("비밀번호를 입력해주세요.");
         $('#mpw').focus();
         return false;
      }
      
      if($('#rempw').val()==""){
         alert("비밀번호를 확인해주세요.");
         $('#rempw').focus();
         return false;
      }
      
      if($('#mpw').val() != $('#rempw').val()){
         alert("비밀번호가 일치하지 않습니다.");
         $('#rempw').focus();
         return false;
      }
      
       if($('#mname').val()==""){
         alert("이름을 입력해주세요.");
         $('#mname').focus();
         return false;
      } 
      
      if($('select option:selected').val()=="도시선택"){
         alert("도시를 선택해주세요.");
         return false;
      }
      
      if($('#addr2').val()==""){
         alert("상세주소를 입력해주세요.");
         $('#addr2').focus();
         return false;
      }
      
      if($('#hp2').val()==""){
         alert("휴대폰 앞자리를 입력해주세요.");
         $('#hp2').focus();
         return false;
      }

      if($('#hp3').val()==""){
         alert("휴대폰 뒷자리를 입력해주세요.");
         $('#hp3').focus();
         return false;
      }
      
      if($('#email1').val()==""){
         alert("이메일을 입력해주세요.");
         $('#email1').focus();
         return false;
      }

      if($('#birth1').val()==""){
         alert("태어난 년도를 입력해주세요.");
         $('#birth1').focus();
         return false;
      }
      
      if($('#birth2').val()==""){
         alert("태어난 월을 입력해주세요.");
         $('#birth2').focus();
         return false;
      }
      
      if($('#birth3').val()==""){
         alert("태어난 일을 입력해주세요.");
         $('#birth3').focus();
         return false;
      }
      
      if(dupcheck == false){
         alert("중복검사를 해주세요.");
         return false;
      }
      else if(use == "impossible"){
         alert("'"+$("#mid").val()+"'는 이미 존재하는 아이디입니다.");
         return false;
      }      
      else{
         alert("'"+$("#mid").val()+"'님 회원가입을 축하드립니다. 이제 로그인을 해주세요.");
      }
   }
   
   function passwd_keyup(){
      if($('input[name=mpw]').val() == $('input[name=rempw]').val()){
         $('#pwmessage').html("<br><font color=red>비밀번호 일치</font>");
         $('#pwmessage').show();
      }
      else{
         $('#pwmessage').html("<br><font color=red>비밀번호 불일치</font>");
         $('#pwmessage').show();
      }
   }
   function duplicate(){
      dupcheck=true;
      
      $.ajax({
         url:"duplication.me",
         type:'POST',
         datatype:'text',
         /* contentType :'text/plain; charset=utf-8;',  */
         data: ({
            checkId : $("#mid").val()
         }),
         
         success:function(data){      
            if($.trim(data) =='YES'){
               $('#idmessage').html('<br><font color=red>사용 가능한 아이디 입니다.</font>');
               $('#idmessage').show();
               use = "possible";
            }
            else{
               $('#idmessage').html('<br><font color=red>사용 불가능한 아이디 입니다.</font>');
               $('#idmessage').show();
               use = "impossible";
            }
         }
      }); 
      
   }
   
   
   
   
</script>
</head>
<div class="top_margin">
<body>

   <form:form commandName="member" method="post" action="registerForm.me" onsubmit="return checkDuplication()"> 
      <table class="table">
         <tr>
            <th colspan="2" id="title" style="padding-top: 20px;padding-bottom: 20px; text-align: center;" >  
               JOIN US
            </th>
         </tr>
         <tr>
            <td>아이디<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>      
            <td>
               <input type="text" name="mid" id="mid" value="lee">
               <input type="button" id="duplicate_check" value="중복체크" class="btn btn-primary mb-2"  style="background:#78909c; border:none; " onclick="duplicate()">
               <span id="idmessage" style="display:none;"></span>
               <form:errors cssClass="err" path="mid" />
            </td>
         </tr>
               
         <tr>
            <td>비밀번호<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>
            <td>
               <input type="password" name="mpw" id="mpw" value="1234">
               <form:errors cssClass="err" path="mpw" />
            </td>
         </tr>
         
         <tr>
            <td>비밀번호 확인<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>   <!-- 선우 코드 작성중 -->
            <td>
               <input type="password" name="rempw" id="rempw" onkeyup="passwd_keyup()">
               <span id="pwmessage" style="display:none;"></span>
                  <form:errors id="err" cssClass="err" path="rempw"/>
            </td>
         </tr>
         
         <tr>
            <td>이름<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>
            <td>
               <input type="text" name="mname" id="mname" value="이수현">
               <form:errors cssClass="err" path="mname" />
            </td>
         </tr>
         
         <tr>
            <td>주소<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>
            <td>
               <select name="addr1" id="addr1">
                  <option value="도시선택">도시선택</option>      
                  <option value="서울">서울</option>         
                  <option value="부산">부산</option>         
                  <option value="대구">대구</option>         
                  <option value="광주">광주</option>         
                  <option value="전주">전주</option>         
                  <option value="인천">인천</option>         
               </select>
               <form:errors cssClass="err" path="addr1" />
         
         
               <input type="text" name="addr2" id="addr2" value="종로구" size="50">
               <form:errors cssClass="err" path="addr2" />
         </tr>
         
         <tr>
            <td>일반전화</td>
            <td>
               <select id="p1" name="p1">  
                  <option value="지역번호">지역번호</option>         
                  <option value="02">02</option>         
                  <option value="031">031</option>         
                  <option value="032">032</option>         
                  <option value="033">033</option>         
                  <option value="041">041</option>         
                  <option value="042">042</option>         
                  <option value="043">043</option>         
                  <option value="044">044</option>         
                  <option value="051">051</option>         
                  <option value="052">052</option>         
                  <option value="053">053</option>         
                  <option value="054">054</option>         
                  <option value="061">061</option>         
                  <option value="062">062</option>         
                  <option value="063">063</option>         
                  <option value="064">064</option>         
               </select> 
               -
               
               <input type="text" name="p2" id="p2" value="" size="4">
               -
               
               <input type="text" name="p3" id="p3" value="" size="4">
            </td>
         </tr>
         
         <tr>
            <td>휴대전화<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>
            <td>
               <select name="hp1" id="hp1">
                  <option value="010">010</option>         
                  <option value="011">011</option>         
                  <option value="016">016</option>         
                  <option value="017">017</option>         
                  <option value="018">018</option>         
                  <option value="019">019</option>         
               </select>
               <form:errors cssClass="err" path="hp1" />
            
               -
               
               <input type="text" name="hp2" id="hp2" value="1234"  size="4">
               <form:errors cssClass="err" path="hp2" />
               -
               
               <input type="text" name="hp3" id="hp3" value="5678"  size="4">
               <form:errors cssClass="err" path="hp3" />
            </td>
         </tr>
         
         <tr>
            <td>이메일<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>
            <td>
               <input type="text" name="email1" id="email1" value="aa">
               <form:errors cssClass="err" path="email1" />
               @
               <select id="email2" name="email2">
                  <option value="naver.com">naver.com</option>         
                  <option value="daum.net">daum.net</option>         
                  <option value="gmail.com">gmail.com</option>         
                  <option value="nate.com">nate.com</option>         
               </select>
            </td>
         </tr>
         
         <tr>
            <td>생년월일<img src="<c:url value="/resources/images/star1.PNG"/>" style="width: 10px; height: 10px"/></td>
            <td>
               <input type="text" name="birth1" id="birth1" value="2020" size="4">년
               <form:errors cssClass="err" path="birth1" />
         
               <input type="text" name="birth2" id="birth2" value="10" size="2">월
               <form:errors cssClass="err" path="birth2" />
               
               <input type="text" name="birth3" id="birth3" value="01" size="2">일
               <form:errors cssClass="err" path="birth3" />
               
            </td>
         
         </tr>
         
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="가입하기"  class="btn btn-primary mb-2" id="btnSubmit"  style="background:#78909c; border:none; ">   
            </td>
         </tr>
         
      </table>
   </form:form>   
</body>
</div>
</html>
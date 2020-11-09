<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	int pnum= Integer.parseInt(request.getParameter("pnum"));
%>  

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

	function load(pnum){
		//alert(pnum);
		
        $.ajax({
        	  type : "get",
              url : "popuplist.detail",
              data : ({
                 pnum : pnum
              }),
              dataType: 'text',               
              contentType :'text/plain; charset=utf-8;',
            success : function(data) {
                showempinfo(data);
                console.log("통신성공");
            },
            error : function(){
            console.log("통신실패!!");
         }
        });
        
	      function showempinfo(data){
	    	  
	         console.log("data:"+data)
	         var slice = data.split(",");  
	         console.log(slice)
	         /*
	         for(let i=0; i<slice.length-1;i++){
	             $('#stockTr').append("<tr><td>"+slice[i]+"</td></tr>")
	          }
	         */
	
		         for(let i=0; i<slice.length-1;i++){
		        	 
		        	 var stock = '';
		        	 if(i%2==0){
		        		 if (slice[i+1] <10 && slice[i+1] >0){
		        			 stock = '품절임박(잔여 :' + slice[i+1]+")" ;
		        		 }
		        		 else if(slice[i+1] ==0 ){
		        			 stock = '품절';
		        		 }
		        		 else{
		        			 stock = '주문가능';
		        		 }
		        		 
		        		 $('#mytbody').append("<tr><td>"+slice[i]+"</td><td>"+stock+"</td></tr>")
		        	 }
		        	 
		         }
	         
	      }
		
		
		
	}


</script>



<body onload="load(<%=pnum%>)" id="#mybody">
	<table border="1">
		
			<tr>
				<td colspan="2">
					현재 상품의 재고수량 현황입니다.<br>
					(현재 판매 진행 중이므로 재고 현황에 다소 차이가 날 수 있습니다.)
				</td>
			</tr>
			
			<tbody id="mytbody">
			
			</tbody>
			
	</table>
	
</body>
</html>
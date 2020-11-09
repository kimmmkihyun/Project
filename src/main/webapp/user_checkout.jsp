<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%@include file="user_top_3.jsp" %> 
	<div class="checkout_main">
		<div class="checkout_list">
			<h3>Order List</h3>
			<table class="table">
				<thead>
					<tr>
				      <th scope="col">주문내역 번호</th>
				      <th scope="col">상품이름</th>
				      <th scope="col">상품이미지</th>
				      <th scope="col">판매가</th>
				      <th scope="col">주문수량</th>
				    </tr>
				</thead>
				<tbody>
					<!--
					mid는 세션으로 넘겨서 받고 /
					<c:forEach var="show" items="${ orderlists }">
					<tr>
						<th scope="row" style="vertical-align: middle;">1</th>
					      <td>
					      	<img src="<c:url value="/resources/images/test2.jpg"/>" />
					      </td>
					      <td style="vertical-align: middle;">무스탕</td>
					      <td style="vertical-align: middle;">￦30,000</td>
					      <td style="vertical-align: middle;">50</td>
				    </tr>
					</c:forEach>
					-->
				</tbody>
			</table>
		</div>
		<div class="check_out">
			<table class="table">
	  			<thead>
				    <tr>
				      <th scope="col">총 구매금액</th>
				    </tr>
	  			</thead>
	  			<tbody>
				    <tr>
				      <th scope="row" style="vertical-align: middle;">￦80,000</th>
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
</body>
</html>
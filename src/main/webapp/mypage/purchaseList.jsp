<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>주문 조회</title>

</head>


<script type="text/javascript">

	const button = document.querySelector(".cancelBtn");
	const status = document.querySelector(".purchaseStatus").value;
	const input = document.querySelector(".input");
	
	function activateBtn() {
		
		if(status.equals("주문접수")){
			button.disabled = false;
		}
		
		else{
			button.disabled = true; 
		}
	}
	button.addEventListener('keyup', activateBtn);
</script>

<script type="text/javascript">

	function del() {
		if(confirm("정말로 주문을 취소하시겠습니까?")) {
			location.href = "purchaseCancel.do";
		}		
	}
</script>


<body>

<!--오늘 날짜 가져오는 자바 스크립트립-->
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String currentDate = format.format(date);
%>

<!--주문조회 메인-->
	<div class="purchaseList" style="position: absolute; left: 25%;">
	
		<h2 align="center">나의 쇼핑 내역</h2>
		<h3 align="center">주문 조회</h3>
	
		<table border="2">
			<tr>
				<th>주문접수</th>
				<th>상품준비중</th>
				<th>픽업완료</th>
			</tr>
			<tr>
				<td>${purchase_status_count_3 } </td>
				<td>${purchase_status_count_101 }</td>
				<td>${purchase_status_count_103 }</td>
			</tr>
		</table>
		
		<form action="purchaseQueryList.do" method="post">
			<table>
				<tr>
					<td>
					<input type="date" name="startDate" value="${userInfo.user_joindate }" > ~ <input type="date" name="endDate" value="<%=currentDate%>" >
					<input type="submit" value="조회">
					</td>
				</tr>
			</table>
		</form>

		<table border="2" class="purchase_list">
			<tr>
				<th>주문번호</th>
				<th colspan="2">상품정보</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>주문상태</th>
				<th>픽업일자</th>
				<th>주문취소</th>
			</tr>
			
			<c:forEach items="${purchaseList }" var="dto">
			
				<tr>
					<td rowspan="2">${dto.purchase_date }${dto.purchase_id }</td>
					<td rowspan="2"><img src="data:cake_img/png;base64, ${dto.cake_img_base64Image }" width = "100" height="100"></td>
					<td>${dto.cake_name }</td>
					<td rowspan="2">${dto.purchase_quantity }</td>
					<td rowspan="2">${dto.purchase_price }</td>
					<td rowspan="2" class="purchaseStatus">${dto.purchase_status }</td>
					<td rowspan="2">${dto.purchase_pickup_date }</td>
					<td rowspan="2"><input type="button" value="주문취소" class="cancelBtn" onclick="cancel()"></td>
				</tr>
				<tr>
					<td>옵션: ${dto.cake_option }<br> 
						레터링: ${dto.purchase_text }</td>
				</tr>
			
			</c:forEach>
			
		</table>
	
	</div>

</body>
</html>


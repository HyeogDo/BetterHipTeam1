<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>취소/환불 조회</title>

</head>

<body>

<!--오늘 날짜 가져오는 자바 스크립트립-->
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String currentDate = format.format(date);
%>

<!--사이드 마이페이지 메뉴-->

<h3>나의 쇼핑 내역</h3>
<p><a href="purchaseList.do">주문 조회</a></p>
<p><a href="refundList.do">취소/환불 조회</a></p>

<br>
<h3>회원 정보</h3>
<p><a href="userInfoModifyView.do">회원정보 변경</a></p>
<p><a href="userInfoDeleteView.do">회원 탈퇴</a></p>


<!--주문조회 메인-->
	<div style="position: absolute; left: 25%;">
	
		<h2 align="center">나의 쇼핑 내역</h2>
		<h3 align="center">취소 / 환불 조회</h3>
		
		
		<form action="refundQueryList.do" method="post">
			<table class="refund_list_query">
				<tr>
					<td colspan="2">
					<input type="date" name="startDate" value="${userInfo.user_joindate }"> ~ <input type="date" name="endDate" value="<%=currentDate%>">
					<input type="submit" value="조회">
					</td>
				</tr>
			</table>
		</form>
	
		<h4>취소현황</h4>
		<table border="2" class="cancel_list">
			<tr>
				<th>주문번호</th>
				<th colspan="2">상품정보</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>픽업일자</th>
				<th>처리상태</th>
			</tr>
			
			<c:forEach items="${cancelList }" var="dto">
			
				<tr>
					<td rowspan="2">${dto.purchase_date }${dto.purchase_id }</td>
					<td rowspan="2"><img src="data:cake_img/png;base64, ${dto.cake_img_base64Image }" width = "100" height="100"></td>
					<td>${dto.cake_name }</td>
					<td rowspan="2">${dto.purchase_quantity }</td>
					<td rowspan="2">${dto.purchase_price }</td>
					<td rowspan="2">${dto.purchase_pickup_date }</td>
					<td rowspan="2">취소완료</td>
				</tr>
				<tr>
					<td>옵션: ${dto.cake_option }<br> 
						레터링: ${dto.purchase_text }</td>
				</tr>
			
			</c:forEach>
			
		</table>
		
		<h4>환불내역</h4>
		<table border="2" class="cancel_list">
			<tr>
				<th>주문번호</th>
				<th colspan="2">상품정보</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>픽업일자</th>
				<th>처리상태</th>
			</tr>
			
			<c:forEach items="${refundList }" var="dto">
			
				<tr>
					<td rowspan="2">${dto.purchase_date }${dto.purchase_id }</td>
					<td rowspan="2"><img src="data:cake_img/png;base64, ${dto.cake_img_base64Image }" width = "100" height="100"></td>
					<td>${dto.cake_name }</td>
					<td rowspan="2">${dto.purchase_quantity }</td>
					<td rowspan="2">${dto.purchase_price }</td>
					<td rowspan="2">${dto.purchase_pickup_date }</td>
					<td rowspan="2">환불완료</td>
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


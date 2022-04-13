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

<!--주문취소 버튼 클릭시 alert  -->
<script type="text/javascript">

function check(purchase_id){
	if(confirm("주문을 취소하시겠습니까?")){
		location.href = "purchaseCancel.do?purchase_id="+purchase_id;
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


<!--사이드 마이페이지 메뉴-->

<h3>나의 쇼핑 내역</h3>
<p><a href="purchaseList.do">주문 조회</a></p>
<p><a href="refundList.do">취소/환불 조회</a></p>

<br>
<h3>회원 정보</h3>
<p><a href="userInfoModifyView.do">회원정보 변경</a></p>
<p><a href="userInfoDeleteView.do">회원 탈퇴</a></p>


<!--주문조회 메인-->
	<div class="purchaseList" style="position: absolute; left: 25%;">
	
		<h2 align="center">나의 쇼핑 내역</h2>
		<h3 align="center">주문 조회</h3>
		
		<!-- 주문접수 / 상품준비중 / 픽업완료 주문 수 count table  -->
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
		
		<!-- 주문내역 날짜별 조회 -->
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

		<!-- 주문내역 리스트 테이블  -->
		<table border="2" id="purchase_list">
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
					<td rowspan="2">${dto.purchase_price }원</td>
					<td rowspan="2">${dto.purchase_status }</td>
					<td rowspan="2">${dto.purchase_pickup_date }</td>
					<td rowspan="2">
						<c:choose>
							<c:when test="${dto.purchase_status eq '주문접수'}">
								<input type="button" value="취소하기" onclick="check(${dto.purchase_id })">
							</c:when>
							<c:otherwise>
								<input type="button" value="취소불가" readonly="readonly" style="background-color: darkgrey">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>옵션: ${dto.cake_option }<br> 
						레터링: ${dto.purchase_text }&nbsp;
						<button onclick = "window.open('purchaseImgListPopup.do?purchase_id=${dto.purchase_id}','window_name', 'width=430, height=500, location=no, status=no, scrollbars = yes');">
						첨부이미지</button>
					</td>
				</tr>
			
			</c:forEach>
			
		</table>
	
	</div>

</body>
</html>


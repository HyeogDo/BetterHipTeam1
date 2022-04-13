<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



<html>
	<script type="text/javascript">
	
	
/* function imagePopup(){
	var pop_title = "popupOpener" ; 
	window.open("", pop_title, "width=400, height=300, left=600, top=300") ; 
	var imageForm = document.imageForm ;
	imageForm.target = pop_title ;
	imageForm.action = "paymentListPopup.do" ; 
	imageForm.submit() ; 
	
	
} */




function check_form(){

var form = document.regiform;
if(!form.agree_chk.checked){
form.agree_chk.focus();
alert("약관에 동의하셔야 다음단계로 이동합니다.");
return false;
  }

	location.href="payment.do";
}
</script>
<style type="text/css">
div#top{
width: 100%;
height: 200px;
background-color: gray;
float: left;
}
#side_left{
width: 10%;
height:1000px;
background-color:white;
float:left;
}
#mid_area{
width:80%;
height:1000px;
background-color:white;
float:left;
}
#mid_left{
width:10%;
height:1000px;
background-color:white;
float:left;
}
#mid_content{
width:70%;
height:1000px;
background-color:white;
float:left;
}
#mid_right{
width:10%;
height:1000px;
background-color:white;
float:left;
}
}
#side_rigth{
width:10%;
height:1000px;
background-color:white;
float:left;
}
#bottom{
width: 100%;
height: 200px;
background-color: gray;
float: left;
}

</style>
<head>
<meta charset="UTF-8">
<title>배러힙 주문하기</title>
</head>
<body>
	<div id="top" style="text-align: center;"></div>
	<div id="side_left"></div>
	<div id="mid_area">
		<div id="mid_left">
		</div>
		<div id="mid_content">
							<div style="text-align: center;">
				<h1>주문하기</h1>
			</div>
				<h3>주문상품</h3>
				
				<!-- 		첫번째 줄  시작     -->
				<div>
					<table border="1">
						<tr>
							<th width="800">상품정보</th>
							<th width="100">수량</th>
							<th width="100">주문금액</th>
							<th width="100">상태</th>
						</tr>
					
					
					
				
					    
					</table>
				</div>
					
			<!-- 		첫번째 줄  끝     -->
					
					
					<!-- 두번째 줄 -->
						<c:forEach items="${paymentList }" var="dto_purchase_list">

						
						
						<table border="1">
							<tr>
								<td width="150" height="200">
									<img src="data:cake_img/png;base64, ${dto_purchase_list.cake_img}" width = "150" height="200">
								</td>
								<td width="600" height="200" style="text-align: center;">
									<h3>${dto_purchase_list.cake_name}</h3>
									맛: ${dto_purchase_list.customize_taste}, 
									사이즈: ${dto_purchase_list.customize_size}, 
									크림 종류: ${dto_purchase_list.customize_cream_type}, 
									크림 색상: ${dto_purchase_list.customize_cream_color}<br>
									문구 : ${dto_purchase_list.purchase_text}<br>
 									픽업 날짜 : ${dto_purchase_list.purchase_pickup_date}
							<%-- 		<form name="imageForm" method="get">
 										<input type="hidden" name="purchase_id" value="${dto_purchase_list.purchase_id}">
 										<input type="button" value="이미지 보기" onclick="imagePopup()">
									</form> --%>
									<button onclick="window.open('paymentListPopup.do?purchase_id=${dto_purchase_list.purchase_id}','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');">이미지보기</button>
 									
 									
								</td>
								<td width="100" height="200" style="text-align: center;">
									${dto_purchase_list.purchase_quantity}
								</td>
								<td width="100" height="200" style="text-align: center;">
									${dto_purchase_list.purchase_price}
								</td>
								<td width="100" height="200" style="text-align: center;">
									방문수령
								</td>
								
							</tr>
						</table>
						</c:forEach>
			
				
				<h3>주문자 정보</h3>
				-----------------------------------------------------------------------------
			<table>
				<tr>
					<td>주문자 명</td>
					<td>${paymentUserList.user_name }</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>${paymentUserList.user_phone }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${paymentUserList.user_email }</td>
				</tr>
				
			</table>
				-----------------------------------------------------------------------------
				
				
				<h3>총 주문금액</h3>
				<h3>${total_price } 원</h3>
				<br><br>
				
				
			
			<!-- -------- 약관 동의 ------------- -->
				<form name="regiform">
				<h3>약관 동의</h3>
					<input type="checkbox" name="agree_chk" value="1">이 케이크가 먹고싶다면 순순히 약관 동의를 누르시는 게 좋을 겁니다. 동의 안하면 안 팔아요.<br><br><br>
					<input type="button" onclick="check_form()" value="결제하기">
					<!-- <img alt="kakaopay" src="./images/kakaopay.png" onclick="check_form()"/> -->
			
				</form>
		</div>
		<div id="mid_right">

		</div>
	</div>
	<div id="side_right"></div>
	<div id="bottom"></div>



</body>
</html>
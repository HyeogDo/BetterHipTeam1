<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
String user_id=request.getParameter("user_id");
%>



<html>
	<script type="text/javascript">
function check_form(){

var form = document.regiform;
if(!form.agree_chk.checked){
form.agree_chk.focus();
alert("약관에 동의하셔야 다음단계로 이동합니다.");
return false;
  }

	location.href="payment.do?user_id=<%=user_id%>";
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
<title>Insert title here</title>
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
							<th width="700">상품정보</th>
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
								<td width="700" height="100" style="text-align: center;">
									[이미지]
									${dto_purchase_list.cake_name}
									맛: ${dto_purchase_list.customize_taste}, 
									사이즈: ${dto_purchase_list.customize_size}, 
									크림 종류: ${dto_purchase_list.customize_cream_type}, 
									크림 색상: ${dto_purchase_list.customize_cream_color}
								</td>
								<td width="100" style="text-align: center;">
									${dto_purchase_list.purchase_quantity}
								</td>
								<td width="100" style="text-align: center;">
									${dto_purchase_list.purchase_price}
								</td>
								<td width="100" style="text-align: center;">
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
				
				
				<h3>${total_price } 원</h3>
				<h3>총 주문금액</h3>
				
				
				
			
			<!-- -------- 약관 동의 ------------- -->
				<form name="regiform">
					<input type="checkbox" name="agree_chk" value="1">약관 동의
					<input type="button" onclick="check_form()" value="결제하기">
			
				</form>
		</div>
		<div id="mid_right">

		</div>
	</div>
	<div id="side_right"></div>
	<div id="bottom"></div>



</body>
</html>